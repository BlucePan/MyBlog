package com.blog.service;

import java.util.List;

import com.blog.model.User;

public interface UserService {
	 User  queryUserById(String id);
	 User queryUser(User user);  //根据用户名密码查询
	 List<User> queryAll(User user);
	 void addEntity(User user);
	 void deleteEntity(String id);
	 void editEntity(User user);
	 
				
}
