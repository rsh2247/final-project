package project.bom.lecture.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.bom.lecture.vo.ContentVO;
import project.bumsik.payment_main.vo.Lecture_VO;



@Repository("LectureDAO")
public class LectureDAOImpl implements LectureDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Lecture_VO> getLectureList(Map<String,String> searchParam) {
		return sqlSession.selectList("Lecture.getLectureList",searchParam);
	}

	@Override
	public void updateThumbnail(Lecture_VO vo) {
		sqlSession.update("Lecture.updateThumbnail",vo);
	}

	@Override
	public Lecture_VO getLecture(Map<String, String> searchParam) {
		return sqlSession.selectOne("Lecture.getLectureList",searchParam);
	}

	@Override
	public int getLectureListCnt(Map<String, String> searchParam) {
		return sqlSession.selectOne("Lecture.getLectureListCnt",searchParam);
	}

	@Override
	public int checkOverlapLectureId(String lecture_id) {
		return sqlSession.selectOne("Lecture.checkOverlapLectureId",lecture_id);
	}

	@Override
	public void insertLecture(Lecture_VO vo) {
		sqlSession.insert("Lecture.insertLecture",vo);
	}
	
	@Override
	public List<ContentVO> getLectureIndex(Map<String,String> searchParam) {
		return sqlSession.selectList("Lecture.getLectureIndex",searchParam);
	}
}
