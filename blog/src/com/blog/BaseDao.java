package com.blog;

import java.util.List;
import java.util.Map;
/**
 * 已经实现基本的 分页 增,删,改,查接口,不需要重复写
 * 所有dao都继承这个BaseDao
 * @author  panzhi
 * @date    2018年8月1日
 * @version 1.0.0
 */
public interface BaseDao {

    public <T> List<T> findByPage(Map<?, ?> map);
	
	public int getCount(Map<?, ?> map);  
	
	public <T> List<T> queryAll(Object obj);
	
	public <T> Object queryEntityById(Integer id);
	
	public void addEntity(Object obj);
	
	public void deleteEntity(String id);
	
	public void editEntity(Object obj);
	
	public <T> Object queryEntity(Object obj);
}
