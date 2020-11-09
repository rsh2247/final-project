package project.bom.lecture.service;

import java.util.List;
import java.util.Map;

import project.bom.lecture.vo.ContentVO;
import project.bumsik.payment_main.vo.Lecture_VO;

public interface LectService {
	public List<Lecture_VO> getLectureList(Map<String,String> searchParam);
	public Lecture_VO getLecture(Map<String,String> searchParam);
	public int getLectureListCnt(Map<String,String> searchParam);
	public void lectureTumbnailEncoder(Lecture_VO vo);
	public void updateThumbnail(Lecture_VO vo);
	public StringBuffer makeRandomString();
	public int checkOverlapLectureId(String lecture_id);
	public void insertLecture(Lecture_VO vo);
	public List<ContentVO> getLectureIndex(Map<String,String> searchParam);
 }
