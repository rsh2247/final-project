package project.imgblob;

import org.springframework.web.multipart.MultipartFile;

public class ImgBlobVO {
    private MultipartFile imgFile;
    public String getText1() {
		return text1;
	}

	public void setText1(String text1) {
		this.text1 = text1;
	}

	private String text1;
    
    public MultipartFile getImgFile() {
        return imgFile;
    }
 
    public void setImgFile(MultipartFile imgFile) {
        this.imgFile = imgFile;
    }
}
