package project.yoonju.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import project.yoonju.member.vo.MemberVO;


//import com.myspring.pro30.member.vo.MemberVO;


public interface MemberDAO {
	 public List selectAllMemberList() throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 public int deleteMember(String user_id) throws DataAccessException;
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

}
