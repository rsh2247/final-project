package project.sungho.security.member;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserAuthenticationService implements UserDetailsService {

	@Autowired
	UserDAOService userDaoService;
	
	private SqlSession sqlSession;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Map<String, Object> user = ((SqlSession) userDaoService).selectOne("user.selectUser",username);
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		 List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
		 gas.add(new SimpleGrantedAuthority(user.get("authority").toString()));
		return new CustomUser(user.get("username").toString(), user.get("password").toString(), (Integer)user.get("enabled") == 1, true, true, true, gas,(String)user.get(""),(String)user.get(""));
	}
	
	public UserAuthenticationService() {
		super();
	}
	public UserAuthenticationService(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

}
