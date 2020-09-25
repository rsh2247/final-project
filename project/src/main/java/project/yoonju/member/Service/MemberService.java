package project.yoonju.member.Service;

import java.util.List;


import org.springframework.dao.DataAccessException;

import project.yoonju.member.vo.MemberVO;



public interface MemberService {
	 public List listMembers() throws DataAccessException;
	 public int addMember(MemberVO memberVO) throws DataAccessException;
	 public int removeMember(String id) throws DataAccessException;
	 public MemberVO login(MemberVO memberVO) throws Exception;
}
