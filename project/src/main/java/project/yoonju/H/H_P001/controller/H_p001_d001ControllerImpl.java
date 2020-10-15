package project.yoonju.H.H_P001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.yoonju.H.H_P001.service.H_p001_d001Service;
import project.yoonju.H.H_P001.vo.H_p001_d001VO;
import project.yoonju.member.vo.MemberVO;
import project.yoonju.H.H_P001.vo.ImageVO;

/*import com.myspring.pro30.board.service.H_p001_d001Service;
import com.myspring.pro30.board.vo.H_p001_d001VO;
import com.myspring.pro30.board.vo.ImageVO;
import com.myspring.pro30.member.vo.MemberVO;*/



@Controller("boardController")
public class H_p001_d001ControllerImpl implements H_p001_d001Controller {
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	H_p001_d001Service boardService;

	@Override
	@RequestMapping(value = "**/listArticles.page", method = { RequestMethod.GET, RequestMethod.POST })				//글목록보기
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
	//	String viewName = (String) request.getAttribute("viewName");
		String viewName = "/H_P001/listArticles.tiles";
		System.out.println("뷰네임-------------" + viewName);
		List articlesList = boardService.listArticles();
		System.out.println("CON===============>>" + articlesList.size());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);
		System.out.println(articlesList);
		return mav;

	}


	@Override
	@RequestMapping(value = "/addNewArticle.do", method = RequestMethod.POST)										//글쓰기
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}

		String imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		String user_id = memberVO.getUser_id();
		articleMap.put("post_parent", 0);
		articleMap.put("user_id", user_id);
		articleMap.put("imageFileName", imageFileName);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			String post_num = boardService.addNewArticle(articleMap);
			if (imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + post_num);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/listArticles.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/articleForm.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}


	@RequestMapping(value = "/H_P001/viewArticle.tiles", method = RequestMethod.GET)									//한 개 글보기
	public ModelAndView viewArticle(@RequestParam("post_num") String post_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		H_p001_d001VO articleVO = boardService.viewArticle(post_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article2", articleVO);
		System.out.println("article을 보여줘=========>>>>");
		System.out.println("article.post_num");

		return mav;
	}

	
	@RequestMapping(value = "/modArticle.do", method = RequestMethod.POST)									//글 수정하기
	@ResponseBody
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}

		String imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		String user_id = memberVO.getUser_id();
		articleMap.put("user_id", user_id);
		articleMap.put("imageFileName", imageFileName);
		String post_num = (String)articleMap.get("post_num");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.modArticle(articleMap);
			if (imageFileName != null && imageFileName.length() != 0) { 
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + post_num);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

				String originalFileName = (String) articleMap.get("originalFileName");
				File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + post_num + "\\" + originalFileName);
				oldFile.delete();
			}
			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewArticle.do?post_num="
					+ post_num + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			System.out.println("여기는 오냐?");
			System.out.println("ArticlesMap" + articleMap + "111111111111");
			
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewArticle.do?post_num="
					+ post_num + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/removeArticle.do", method = RequestMethod.POST)										//글삭제하기
	@ResponseBody
	public ResponseEntity removeArticle(@RequestParam("post_num") String post_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeArticle(post_num);
			File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + post_num);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/board/listArticles.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/board/listArticles.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@RequestMapping(value = "/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 한개 이미지 업로드하기
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			System.out.println("===========>> fileName:"+fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO+ "\\" + "temp", imageFileName);
			System.out.println("===========>> new File:"+ARTICLE_IMAGE_REPO + "\\" + imageFileName);
			if (mFile.getSize() != 0) { // File Null Check
				if (!file.exists()) { // 경로상에 파일이 존재하지 않을 경우
					if (file.getParentFile().mkdirs()) { // 경로에 해당하는 디렉토리들을 생성
						file.createNewFile(); // 이후 파일 생성
					}
				}
				System.out.println("===========>> imageFileName:"+imageFileName);
				//mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName)); // 임시로 저장된 multipartFile을 실제 파일로 전송
				mFile.transferTo(file); // 임시로 저장된 multipartFile을 실제 파일로 전송
			}
		}
		return imageFileName;
	}


}
