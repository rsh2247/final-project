package project.upload;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@RequestMapping(value = "/upload1", method = RequestMethod.GET)
	public String upload1(Locale locale, Model model) {
		return "mainPage/mainPage001.tiles";
	}

	@RequestMapping(value = "/upload2", method = RequestMethod.GET)
	public String upload2(Locale locale, Model model) {
		return "upload/upload2";
	}

	@RequestMapping(value = "requestupload1")
	public String requestupload1(MultipartHttpServletRequest mtfRequest, HttpServletRequest request) {
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);
		MultipartFile mf = mtfRequest.getFile("file");
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/image/";
		String path = root_path+attach_path;
		String a = "C:\\file_repo\\";
		System.out.println(path);

		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		long fileSize = mf.getSize(); // 파일 사이즈

		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);

		String safeFile = path + System.currentTimeMillis() + originFileName;

		try {
			mf.transferTo(new File(safeFile));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:upload1";
	}

	@RequestMapping(value = "requestupload2")
	public String requestupload2(MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);

		String path = "C:\\MyProject\\photoUpload\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String safeFile = path + System.currentTimeMillis() + originFileName;
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "redirect:upload2";
	}

}
