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
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	CustomUserDAO userDao;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Map<String, Object> user = sqlSession.selectOne("user.selectUser",username);
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		boolean enable = false;
		if(user.get("USER_ENABLE").toString().equals("1")) enable = true;
		List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		gas.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
		return new CustomUser(user.get("USERNAME").toString(), user.get("PASSWORD").toString(), enable, true, true, true, gas,user.get("EMAIL").toString(),"testnickname");
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
		inputMap.put("pw", "{bcrypt}"+bcryptPasswordEncoder.encode((String) inputMap.get("pw")));
		System.out.println(inputMap.get("pw"));
		int result = userDao.insertUser(inputMap);
	}
	
	public void userConfirm(Map<String,Object> inputMap) {
		System.out.println("inputMap : " + inputMap);
		Map<String,Object> user = userDao.selectUserByEmail(inputMap);
		
		if(user.get("USER_AUTHKEY").equals(inputMap.get("authKey")) ) {
			System.out.println("check");
			userDao.updateUserEnable(user);
		}
	}
	

}
