package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.BaseDao;
import com.blog.model.User;

public interface UserDao extends BaseDao {

	User queryUserById(String id); //根据id查询用户
	
    public <T> List<T> findUserByPage(Map<?, ?> map); //查询用户表
	 
	public int getUserCount(Map<?, ?> map); //用户表总数
	
	 User getUserByName(String username); //根据姓名获取用户
	
}
