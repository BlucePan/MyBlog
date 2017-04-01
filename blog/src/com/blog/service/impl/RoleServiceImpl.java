package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.blog.dao.RoleDao;
import com.blog.model.Role;
import com.blog.model.RolePermission;
import com.blog.model.UserRole;
import com.blog.service.RoleService;
import com.blog.util.BlogUtil;
import com.blog.util.PageView;
@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleDao roleDao;
		
	@Override
	public PageView findByPage(PageView page, Map map) {
		page.setTotalCount(roleDao.getCount(map));
		map.put("start",page.getStart());
		map.put("max", page.getPageSize());
	    List<Role> rolelist=roleDao.findByPage(map);
		page.setItems(rolelist);
		return page;
	}

	@Override
	public void addRole(Role role) {
		roleDao.addEntity(role);
	}

	@Override
	public Role queryRoleById(String id) {
		return roleDao.queryRoleById(id);
	}

	@Override
	public void updateRole(Role role) {
		 roleDao.editEntity(role);

	}

	@Override
	public void deleteRole(String id) {
		roleDao.deleteEntity(id);

	}

	@Override
	public List<Role> queryAllRole(Role role) {
		return roleDao.queryAll(role);
	}

	@Override
	public void delUserRoleByUserId(String userId) {
		roleDao.delUserRoleByUserId(userId);
		
	}

	@Override
	public void addUserRole(UserRole uRole) {
		roleDao.addUserRole(uRole);
		
	}

	@Override
	public void saveUserRole(String roleId, List<String> list) {
		roleDao.delRolePermissionByRoleId(roleId);  
		for (String rId : list) {
			if(!BlogUtil.isEmpty(rId)){
				RolePermission rPermission=new RolePermission();
				rPermission.setId(BlogUtil.getKey());
				rPermission.setRid(roleId);
				rPermission.setPid(rId);
				roleDao.addRolePermission(rPermission);
			}
		}
		
	}

}
