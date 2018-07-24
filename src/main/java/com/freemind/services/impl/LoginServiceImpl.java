package com.freemind.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.freemind.dao.LoginDao;
import com.freemind.model.UserModel;
import com.freemind.services.LoginService;

@Service("loginService")
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDao loginDao;
	@Override
	public UserDetails loadUserByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public UserModel getUserByUnamePassword(String userName, String password) {
		return loginDao.getUserByUnamePassword(userName, password);
	}
	@Override
	public void addUser(String userName, String password) {
		 loginDao.addUser(userName, password);
	}
	@Override
	public UserModel getUserByUname(String userName) {
		return loginDao.getUserByUname(userName);
	}
	

}
