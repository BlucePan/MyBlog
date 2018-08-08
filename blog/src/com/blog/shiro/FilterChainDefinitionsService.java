package com.blog.shiro;

import java.util.Map;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * 
 * @author 系统管理员在后台更新权限（增删改）的时候，要保证数据库中的filterchains同步到服务器中
 * @date 2017-4-6  
 * @version 1.0.0
 */
public class FilterChainDefinitionsService  {
	@Autowired
	private MyShiroFilterFactoryBean permissionFactory;
	
	//重新加载过滤器权限
	public void reloadFilterChains(){
		synchronized (permissionFactory) { //强制同步，控制线程安全
		AbstractShiroFilter shiroFilter = null; 	
		try {
			shiroFilter = (AbstractShiroFilter) permissionFactory.getObject();  

            PathMatchingFilterChainResolver resolver = (PathMatchingFilterChainResolver) shiroFilter  
                    .getFilterChainResolver();  
            // 过滤管理器  
            DefaultFilterChainManager manager = (DefaultFilterChainManager) resolver.getFilterChainManager();  
            // 清除权限配置  
            manager.getFilterChains().clear();  
            permissionFactory.getFilterChainDefinitionMap().clear();  
            // 重新设置权限  
            permissionFactory.setFilterChainDefinitions(MyShiroFilterFactoryBean.definitions);//传入配置中的filterchains  

            Map<String, String> chains = permissionFactory.getFilterChainDefinitionMap();  
            //重新生成过滤链  
            for (Map.Entry<String, String> entry : chains.entrySet()) {
                String url = entry.getKey();
                String chainDefinition = entry.getValue().trim()
                        .replace(" ", "");
                manager.createChain(url, chainDefinition);
            }
            System.out.println("更新权限成功！！");
		} catch (Exception e) {
			e.printStackTrace();
		}	
		}
	}
	
}
