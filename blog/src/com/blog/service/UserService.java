package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.model.User;
import com.blog.util.PageView;

public interface UserService {
	 User  queryUserById(String id);
	 User queryUser(User user);  //根据用户名密码查询
	 List<User> queryAll(User user);
	 void addEntity(User user);
	 void deleteEntity(String id);
	 User editEntity(User user);
	 String getTimestamp(String param);  //测试缓存时间
	 PageView findByPage(PageView page,Map map); //查询用户拥有的角色
	 PageView findUserByPage(PageView page,Map map); //查询所有的用户
	 
				
}
