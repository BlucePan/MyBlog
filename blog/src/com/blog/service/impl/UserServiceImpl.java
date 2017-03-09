package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.UserDao;
import com.blog.model.User;
import com.blog.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	
	
	
	public User queryUserById(String id) {	
		return (User) userDao.queryUserById(id);
	}



	@Override
	public User queryUser(User user) {
		return (User) userDao.queryEntity(user);
	}



	@Override
	public List<User> queryAll(User user) {
		// TODO Auto-generated method stub
		return userDao.queryAll(user);
	}



	@Override
	public void addEntity(User user) {
		userDao.addEntity(user);
		
	}



	@Override
	public void deleteEntity(String id) {
		userDao.deleteEntity(id);
		
	}



	@Override
	public void editEntity(User user) {
		userDao.editEntity(user);
		
	}

}
