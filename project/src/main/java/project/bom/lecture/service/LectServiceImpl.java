package project.bom.lecture.service;

import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.bom.lecture.dao.LectureDAO;
import project.bumsik.payment_main.vo.Lecture_VO;


@Service
public class LectServiceImpl implements LectService {
	
	@Autowired
	private LectureDAO lectureDAO;
	
	@Override
	public List<Lecture_VO> getLectureList(Map<String,String> searchParam) {
		return lectureDAO.getLectureList(searchParam);
	}

	@Override
	public void lectureTumbnailEncoder(Lecture_VO vo) {
		if(vo.getLecture_thumbnailEncoder()!=null) {
			byte[] encoded = Base64.getEncoder().encode((byte[])vo.getLecture_thumbnailEncoder().get("lecture_thumbnailEncoder"));
			vo.setLecture_encodedThumbnail(new String(encoded));
			vo.setLecture_thumbnailEncoder(null);
		}
	}

	@Override
	public void updateThumbnail(Lecture_VO vo) {
		lectureDAO.updateThumbnail(vo);
	}

	@Override
	public Lecture_VO getLecture(Map<String, String> searchParam) {
		return lectureDAO.getLecture(searchParam);
	}

	@Override
	public int getLectureListCnt(Map<String, String> searchParam) {
		return lectureDAO.getLectureListCnt(searchParam);
	}
	
	public StringBuffer makeRandomString() {
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		for(int i=0;i<20;i++){
		    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤한 소문자를, false 일 시 랜덤한 숫자를 StringBuffer 에 append 한다.
		    if(rnd.nextBoolean()){
		        buf.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		        buf.append((rnd.nextInt(10)));
		    }
		}
		return buf;
	}

	@Override
	public int checkOverlapLectureId(String lecture_id) {
		return lectureDAO.checkOverlapLectureId(lecture_id);
	}

	@Override
	public void insertLecture(Lecture_VO vo) {
		lectureDAO.insertLecture(vo);
	}
}