package com.freemind.dao.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.freemind.dao.LoginDao;
import com.freemind.model.UserModel;

@Repository("loginDao")
@Transactional
public class LoginDaoImpl implements LoginDao, UserDetailsService {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public UserDetails loadUserByUsername(String username) {

		System.out.println("Getting access details from employee dao !!");
		UserModel dbUser = getByUname(username);
		// Ideally it should be fetched from database and populated instance of
		// #org.springframework.security.core.userdetails.User should be
		// returned from this method
		// UserDetails user = new User(username, "password", true, true, true,
		// true, new GrantedAuthority[]{ new GrantedAuthorityImpl("ROLE_USER")
		// });

		UserDetails user = buildUserFromUserEntity(dbUser);
		try {
			if (user == null)
				throw new UsernameNotFoundException("user name not found");

		} catch (Exception e) {
			throw new UsernameNotFoundException("database error");
		}
		return user;
	}

	private User buildUserFromUserEntity(UserModel userEntity) {
		// convert model user to spring security user
		String username = userEntity.getUserName();
		String password = userEntity.getPassword();
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		return new User(username, password, enabled, accountNonExpired,
				credentialsNonExpired, accountNonLocked,
				getAuthorities(userEntity.getUserRoll().getId()));

	}

	public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {
		List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}

	public List<String> getRoles(Integer role) {

		List<String> roles = new ArrayList<String>();

		if (role.intValue() == 1) {
			roles.add("ROLE_MODERATOR");
			roles.add("ROLE_ADMIN");
		} else if (role.intValue() == 2) {
			System.out.println("HIIII");
			roles.add("ROLE_MODERATOR");
		}
		return roles;
	}

	public static List<GrantedAuthority> getGrantedAuthorities(
			List<String> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}

	public UserModel getByUname(String uname) {
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(UserModel.class);
		criteria.add(Restrictions.eq("userName", uname));
		return (UserModel) criteria.uniqueResult();
	}

	@Override
	@Transactional
	public UserModel getUserByUnamePassword(String userName,
			String password) {
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(UserModel.class);
		criteria.add(Restrictions.eq("userName", userName));
		criteria.add(Restrictions.eq("password", password));
		UserModel userModel = (UserModel) criteria.uniqueResult();
		session.close();
		return userModel;
	}

	@Override
	public void addUser(String userName, String password) {
		Session session = sessionFactory.openSession();
		UserModel userModel = new UserModel();
		userModel.setUserName(userName);
		userModel.setPassword(password);
		session.save(userModel);
		session.close();
	}

	@Override
	public UserModel getUserByUname(String userName) {
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(UserModel.class);
		criteria.add(Restrictions.eq("userName", userName));
		UserModel userModel = (UserModel) criteria.uniqueResult();
		session.close();
		return userModel;
	}

}
