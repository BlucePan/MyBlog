package com.blog.util;

import java.util.List;


import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.blog.model.User;
import com.blog.service.UserService;

//XML配置
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml","classpath:cache-config.xml"})  
public class CachTest extends AbstractJUnit4SpringContextTests {
	
    @Autowired
	private UserService userService;
	
	//加缓存
	@Test
	public void testTwo(){		
	/*   List<User> userList =userService.queryAll(new User());		*/
			User u=userService.queryUserById("666666");
	        System.out.println("第一次查询：》》》》"+u);
	        User user=new User();
	        user.setId("666666");
	        user.setName("小盘子");
	        userService.editEntity(user);
	        System.out.println("第二次查询：》》》》"+userService.queryUserById("666666"));
	}
	
	
	
	//清楚缓存
	@Test
	public void testThree(){		
     List<User> userList =userService.queryAll(new User());	

	        System.out.println("第一次查询：》》》》"+userList.size());
	        User user=new User();
	        user.setId("444444");
	        user.setName("小梅");
	        user.setAccount("bcd");
	        userService.addEntity(user);
	        System.out.println("第二次查询：》》》》"+userService.queryAll(new User()).size());
	}
	
	
	
	
	
    @Test  
    public void getTimestampTest() throws InterruptedException{  
        System.out.println("第一次调用：" + userService.getTimestamp("param"));
        Thread.sleep(2000);
        System.out.println("2秒之后调用：" + userService.getTimestamp("param"));
        Thread.sleep(11000);
        System.out.println("再过11秒之后调用：" + userService.getTimestamp("param"));
    } 
	

}
