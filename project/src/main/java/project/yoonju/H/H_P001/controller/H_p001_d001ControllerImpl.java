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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.sungho.security.member.CustomUser;
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
	
	/*
	 * @Autowired H_p001_d001VO articleVO;
	 */
	

	@Override
	@RequestMapping(value = "H/H_P001/listArticles.page", method = { RequestMethod.GET, RequestMethod.POST })				//글목록보기
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
	@RequestMapping(value = "H/H_P001/listPage.page", method = {RequestMethod.GET, RequestMethod.POST})					//게시물목록 + 페이징추가
	public ModelAndView listPage(@RequestParam("num") int num, HttpServletRequest request, HttpServletResponse response) throws Exception {

		int count = boardService.count();	//전체 게시물 갯수					119
		int postnum = 10 * num;	//한 페이지에서 출력할 게시물 갯수					10
		int pagenumList = (int)Math.ceil((double)count/10);	//하단 페이징 번호	(double)119/10 → ceil(11.9) → 12
		int displayPost = (num - 1) * 10;	// 출력할 게시물 					(1-1) * 10 = 0
		int pageNum_cnt = 10; //한번에 출력할 페이지 갯수							10

		//표시되는 페이지 번호 중 마지막 번호 1차 계산		/ int(ceil(1/10)) * 10 / → / int(ceil(1)) * 10 / → / int(1) * 10 /→ 10 
		int endPageNum = (int)(Math.ceil(((double)num) / (double)pageNum_cnt)) * pageNum_cnt; // 
		
		//표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt-1); 	// 10-(10-1) → 10-9 = 1
		
		// 표시되는 페이지 번호 중 마지막 번호 2차 계산				 	(int)ceil((119)/10) → int(ceil(11.9)) → 	12
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		
		if(endPageNum > endPageNum_tmp) {	
			endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false:true; 
		boolean next = endPageNum * pageNum_cnt >= count ? false:true;

		
		/*
		 * if(startPageNum < 0 ) { startPageNum = 1; }
		 */						//내가 따로 만든 코드
		
		String viewName = "/H_P001/listPage.tiles";
		System.out.println("뷰네임-------------" + viewName);
		List articlesList = boardService.listPage(displayPost, postnum);
		
		System.out.println("CON===============>>" + articlesList.size());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);
		mav.addObject("pagenum", pagenumList);
		System.out.println("articlesList는" + articlesList);
		
		mav.addObject("count", count);
		mav.addObject("startPageNum", startPageNum);
		mav.addObject("endPageNum", endPageNum);
		mav.addObject("endPageNum_tmp", endPageNum_tmp);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		mav.addObject("select", num);
		
		System.out.println("endPageNum은?" + endPageNum);		
		System.out.println("startPageNum은?" + startPageNum);
		System.out.println("endPageNum_tmp는?" + endPageNum_tmp);
		System.out.println("pagenumList는?" + pagenumList);
		System.out.println("count는?" + count);		
		System.out.println("prev는??" + prev);
		System.out.println("next는?" + next);
		System.out.println("num은?" + num);
		
		return mav;
	}
	

	@Override
	@RequestMapping(value = "H/H_P001/addNewArticle.user", method = RequestMethod.POST)										//글쓰기
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
		
		CustomUser cus = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();				

		articleMap.put("post_parent", 0);
		articleMap.put("user_id", cus.getUsername());
		articleMap.put("imageFileName", imageFileName);
		System.out.println("아티클맵에 담긴 것----------------->>11111" + articleMap);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			String post_num = boardService.addNewArticle(articleMap);
			System.out.println("post_num에 담긴 것 -------------->" + post_num);
			if (imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + post_num);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/H/H_P001/listArticles.page'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "H//H_P001/articleForm.page'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "H/H_P001/addrplyArticle.user", method = RequestMethod.POST)										//글쓰기
	@ResponseBody
	public ResponseEntity addrplyArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			

			System.out.println("parameter ######################################");
			System.out.println(articleMap.get(name));
			System.out.println("parameter ######################################");
			

		}
		
		
		String imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();				
		
		CustomUser cus = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();				

//		articleMap.put(arg0, post_num);
//		articleMap.put("post_parent", 0);
		
		articleMap.put("user_id", cus.getUsername());
		System.out.println("아티클맵에 담긴 것----------------->>" + articleMap);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			String post_num = boardService.addrplyArticle(articleMap);
			System.out.println("post_num에 담긴 것 -------------->" + post_num);
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/H/H_P001/listArticles.page'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "H//H_P001/articleForm.page'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	

	@RequestMapping(value = "H/H_P001/viewArticle.page", method = RequestMethod.GET)									//한 개 글보기
	public ModelAndView viewArticle(@RequestParam("post_num") String post_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = "/H_P001/viewArticle.tiles";
		System.out.println("뷰네임에 담긴 것-------->" + viewName);
		H_p001_d001VO articleVO = boardService.viewArticle(post_num); //여기서 에러가 난당
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article2", articleVO);
		System.out.println("articleVO를 보여줘=========>>>>" + articleVO);
		System.out.println("mav에 담긴 것------------->" + mav);
		
		return mav;
	}

	@RequestMapping(value = "H/H_P001/modifyArticle.user", method = RequestMethod.POST)									//글 수정하기
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

		CustomUser cus = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
		//MemberVO memberVO = (MemberVO) session.getAttribute("member"); 
		//String id = memberVO.getId(); 
		// 위에 있는 두 줄은 CustomUser로 대체됨 
		
		articleMap.put("user_id", cus.getUsername());
		articleMap.put("imageFileName", imageFileName);
		
		String post_num = (String)articleMap.get("post_num");
		System.out.println("아티클맵에 뭐가 담겼나 araticleMap-------------->" + articleMap );
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
			message += " location.href='" + multipartRequest.getContextPath() + "/H/H_P001/viewArticle.page?post_num="
					+ post_num + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			System.out.println("여기는 오냐?");
			System.out.println("ArticlesMap에 담긴 것--------------------->" + articleMap);
			
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewArticle.page?post_num="
					+ post_num + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "H/H_P001/removeArticle.user", method = RequestMethod.POST)										//글삭제하기
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
			System.out.println("삭제도 포스트넘이 문제인가---------->" + post_num);
			File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + post_num);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/H/H_P001/listArticles.page';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/H/H_P001/listArticles.page';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@RequestMapping(value = "H/H_P001/articleForm.user", method = RequestMethod.GET) //경로 절대경로로 바꾸기
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = (String) request.getAttribute("viewName");
		String viewName = "/H_P001/articleForm.tiles";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	
/*	@RequestMapping(value = "loginCheck.page", method = RequestMethod.POST)
	private ModelAndView loginCheck (@ModelAttribute("CustomUser") H_p001_d001VO articleVO, 
			RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
	}
*/
	
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
