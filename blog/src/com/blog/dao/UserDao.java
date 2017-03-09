package com.blog.dao;

import com.blog.BaseDao;
import com.blog.model.User;

public interface UserDao extends BaseDao {

	User queryUserById(String id);
	
}
