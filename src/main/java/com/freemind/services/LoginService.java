package com.freemind.services;

import org.springframework.security.core.userdetails.UserDetails;

import com.freemind.model.UserModel;

public interface LoginService {

	 public UserDetails loadUserByUsername(String userName);
	 public UserModel getUserByUnamePassword(String username,String password);
	 public void addUser(String userName,String password); 
	 public UserModel getUserByUname(String userName);
}
