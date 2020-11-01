package project.bom.lecture.dao;

import java.util.List;
import java.util.Map;

import project.bumsik.payment_main.vo.Lecture_VO;

public interface LectureDAO {
	public List<Lecture_VO> getLectureList(Map<String,String> searchParam);
	public Lecture_VO getLecture(Map<String,String> searchParam);
	public int getLectureListCnt(Map<String,String> searchParam);
	public void updateThumbnail(Lecture_VO vo);
	public int checkOverlapLectureId(String lecture_id);
	public void insertLecture(Lecture_VO vo);
}
