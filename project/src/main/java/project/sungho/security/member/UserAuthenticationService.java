package project.sungho.security.member;

import java.util.*;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("customUser_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class UserAuthenticationService implements UserDetailsService {
	
	private SqlSession sqlSession;
	
	@Autowired
	CustomUserDAO userDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Map<String, Object> user = sqlSession.selectOne("user.selectUser",username);
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		 List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		 gas.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
		return new CustomUser(user.get("USERNAME").toString(), user.get("PASSWORD").toString(), true, true, true, true, gas,"testemail","testnickname");
	}
	
	public UserAuthenticationService() {
		super();
	}
	public UserAuthenticationService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	public void signUp(Map<String,Object> inputMap) {
		//Map<String, Object> user = sqlSession.selectOne("user.selectUser",inputMap.get("id"));
		int result = userDao.insertUser(inputMap);
		System.out.println(result);
		
	}
	

}
