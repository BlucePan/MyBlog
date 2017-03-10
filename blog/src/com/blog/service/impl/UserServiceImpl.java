package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.blog.dao.UserDao;
import com.blog.model.User;
import com.blog.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	
	
	/**
	 * @Cacheable 将结果加入缓存。下次调用时直接从缓存中读取
	 * cacheNames指定缓存，要与ehcache.xml中的cache明显相同
	 */
	@Cacheable(value="cacheTest",key="#id")
	@Override
	public User queryUserById(String id) {	
		return (User) userDao.queryUserById(id);
	}



	@Override
	public User queryUser(User user) {
		return (User) userDao.queryEntity(user);
	}


	@Cacheable(value="cacheTest",key="0")
	@Override
	public List<User> queryAll(User user) {
		return userDao.queryAll(user);
	}


	//清除缓存 beforeInvocation=true 表示为抛出异常清楚下执行此操作
    @CacheEvict(value="cacheTest",key="0", beforeInvocation=true)
	@Override
	public void addEntity(User user) {
		userDao.addEntity(user);
		
	}



	@Override
	public void deleteEntity(String id) {
		userDao.deleteEntity(id);
		
	}


/**
 * key 写返回值的id result.id   对应放入缓存的id(key="#id")
 */
	@Override
	@CachePut(value="cacheTest",key="#result.id")
	public User editEntity(User user) {
		userDao.editEntity(user);
		return userDao.queryUserById(user.getId());
	}

	


	@Override
	@Cacheable(value="cacheTest",key="#param")
	public String getTimestamp(String param) {
		   Long timestamp = System.currentTimeMillis();
	        return timestamp.toString();
	}

}
