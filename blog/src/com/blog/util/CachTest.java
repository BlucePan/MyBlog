package com.blog.util;

import java.util.List;


import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.blog.model.User;
import com.blog.service.UserService;

//XML配置
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
public class CachTest extends AbstractJUnit4SpringContextTests {
	
    @Autowired
	private UserService userService;
	
	
	 
	//不加缓存
	@Test
	public void testOne(){		
	   List<User> userList =userService.queryAll(new User());		
	      System.out.println("一共有：》》》》"+userList.size());
	
	}
	
	
	

}
