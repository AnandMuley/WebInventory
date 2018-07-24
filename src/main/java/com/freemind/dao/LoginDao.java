package com.freemind.dao;

import org.springframework.security.core.userdetails.UserDetails;

public interface LoginDao {

	 public UserDetails loadUserByUsername(String username);
	 public com.freemind.model.UserModel getUserByUnamePassword(String username,String password);
	 public void addUser(String userName,String password); 
	 public com.freemind.model.UserModel getUserByUname(String userName);
}
