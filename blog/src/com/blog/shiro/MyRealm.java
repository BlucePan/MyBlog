package com.blog.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
/**
 * 自定义Realm
 * @author panzhi
 * @date 2017-4-6  
 * @version 1.0.0
 */
public class MyRealm extends AuthorizingRealm {

	 /** 
     * 授权 
     */  
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		
		return null;
	}

	
	/**
	 *  认证信息，主要针对用户登录， 
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		
		return null;
	}

}
