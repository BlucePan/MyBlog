package com.blog.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.BaseController;
import com.blog.model.BlogMenu;
import com.blog.model.Role;
import com.blog.model.User;
import com.blog.model.UserRole;
import com.blog.service.BlogMenuService;
import com.blog.service.RoleService;
import com.blog.service.UserService;
import com.blog.util.BlogUtil;
import com.blog.util.JsonBeang;
import com.blog.util.PageView;

@Controller
@RequestMapping("/role/manage/*")
public class RoleController extends BaseController {

	private JsonBeang jb = new JsonBeang();

	// 闲谈列表
	@RequestMapping("/roleList.html")
	public String roleList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("name", request.getParameter("name"));
		PageView pageView = roleService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("name"))) {
			buffer.append("&name=");
			buffer.append(request.getParameter("name"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());

		return "background/role/roleList";
	}

	// 跳到增加页面
	@RequestMapping("/addToRole.html")
	public String addToRole(HttpServletRequest request, Model model) {
		return "background/role/addRole";
	}

	// 增加闲谈
	@RequestMapping("/addRole.html")
	public String addRole(HttpServletRequest request, Model model) {
		Role role = new Role();
		role.setId(BlogUtil.getKey());
		role.setCreateUserId(String.valueOf(getLoginUser(request).getId()));
		role.setName(request.getParameter("name"));
		roleService.addRole(role);
		return "forward:/role/manage/roleList.html";
	}

	// 查看详情
	@RequestMapping("/roleDetail.html")
	public String roleDetail(HttpServletRequest request, Model model) {
		Role role = roleService.queryRoleById(request.getParameter("id"));
		model.addAttribute("role", role);
		return "background/role/editRole";
	}

	// 修改闲谈
	@RequestMapping("/roleUpdate.html")
	public String roleUpdate(Role role, HttpServletRequest request, Model model) {
		roleService.updateRole(role);
		return "forward:/role/manage/roleList.html";
		// return "redirect:activityList.html";
	}

	// 删除闲谈
	@RequestMapping("/delrole.html")
	public void delrole(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id == null || id.equals("")) {
			jb.setStatus("000");
			jb.setMessage("非法操作");
		} else {
			roleService.deleteRole(id);
			jb.setStatus("100");
			jb.setMessage("操作成功");
		}
		BlogUtil.fromPrintJson(jb, response);
	}

	// 用户角色列表
	@RequestMapping("/userAllRoleList.html")
	public String userAllRoleList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("findContent", request.getParameter("findContent"));
		PageView pageView = userService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("findContent"))) {
			buffer.append("&findContent=");
			buffer.append(request.getParameter("findContent"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());

		return "background/user/userAllRoleList";
	}

	// 获取所有的角色
	@RequestMapping("/queryAllRole.html")
	public void queryAllRole(HttpServletRequest request, HttpServletResponse response) {
		Role role = new Role();
		List<Role> rList = roleService.queryAllRole(role);
		String id = request.getParameter("id");
		Map map = new HashMap();
		map.put("id", id);
		jb.setObject(null);
		jb.setStatus("100");
		jb.setList(rList);
		jb.setObject(null);
		jb.setMap(map);
		BlogUtil.fromPrintJson(jb, response);
	}

	@ResponseBody
	@RequestMapping("/updateRoles.html")
	public int updateRoles(HttpServletRequest request) {
		UserRole userRole;
		String userId = request.getParameter("userId");
		String role = request.getParameter("roles");
		try {
			roleService.delUserRoleByUserId(userId);
			String[] roles = role.split(",");
			for (int i = 0; i < roles.length; i++) {
				userRole = new UserRole();
				userRole.setId(BlogUtil.getKey());
				userRole.setUid(userId);
				userRole.setRid(roles[i]);
				roleService.addUserRole(userRole);
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	// 删除用户所拥有的角色
	@RequestMapping("/delUserRoles.html")
	public void delUserRoles(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id == null || id.equals("")) {
			jb.setStatus("000");
			jb.setMessage("非法操作");
		} else {
			roleService.delUserRoleByUserId(id);
			jb.setStatus("100");
			jb.setMessage("操作成功");
		}
		BlogUtil.fromPrintJson(jb, response);
	}

	// 跳到分配角色
	@RequestMapping("/permissioRole.html")
	public String permissioRole(HttpServletRequest request, Model model) {
		List<BlogMenu> menuList = blogMenuService.queryBlogMenuByRoleId(request.getParameter("roleId"));
		// System.out.println("---------------"+menuList.size());
		BlogMenu bMenu = new BlogMenu();
		bMenu.setFlag("1");
		List<BlogMenu> allRes = blogMenuService.getAllMenuList(bMenu);
		StringBuffer sb = new StringBuffer();
		sb.append("var data = [];");
		String name = "";
		for (BlogMenu r : allRes) {
			boolean flag = false;

			name = r.getMenuName();
			String name1 = "";
			for (BlogMenu blogMenu : menuList) {
				name1 = blogMenu.getMenuName();

				if (blogMenu.getId().equals(r.getId())) {
					sb.append("data.push({ fid: '" + r.getId() + "', pfid: '" + r.getSuperior() + "', fname: '" + name1
							+ "',ischecked: true});");
					flag = true;
				}
			}
			if (!flag) {
				sb.append("data.push({ fid: '" + r.getId() + "', pfid: '" + r.getSuperior() + "', fname: '" + name
						+ "'});");
			}
		}
		model.addAttribute("roleId", request.getParameter("roleId"));
		model.addAttribute("resources", sb);
		return "background/role/permissioRole";
	}

	@ResponseBody
	@RequestMapping("/saveRoleRescours.html")
	public String saveRoleRescours(HttpServletRequest request, String roleId, String rescId) {
		String errorCode = "1000";
		List<String> list = BlogUtil.removeSameItem(Arrays.asList(rescId.split(",")));
		try {
			roleService.saveUserRole(roleId, list);
		} catch (Exception e) {
			e.printStackTrace();
			errorCode = "1001";
		}
		return errorCode;
	}

	// 用户列表
	@RequestMapping("/userList.html")
	public String userList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("name", request.getParameter("name"));
		map.put("account", request.getParameter("account"));
		PageView pageView = userService.findUserByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("name"))) {
			buffer.append("&name=");
			buffer.append(request.getParameter("name"));
		}
		if (!BlogUtil.isEmpty(request.getParameter("account"))) {
			buffer.append("&account=");
			buffer.append(request.getParameter("account"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());

		return "background/user/userList";
	}

	// 跳到增加页面
	@RequestMapping("/addToUser.html")
	public String addToUser(HttpServletRequest request, Model model) {
		return "background/user/addUser";
	}

	// 增加闲谈
	@RequestMapping("/addUser.html")
	public String addUser(HttpServletRequest request, Model model) {
		User user = new User();
		user.setId(BlogUtil.getKey());
		user.setAccount(request.getParameter("account"));
		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
		userService.addEntity(user);
		return "forward:/role/manage/userList.html";
	}

	// 查看详情
	@RequestMapping("/userDetail.html")
	public String userDetail(HttpServletRequest request, Model model) {
		User user = userService.queryUserById(request.getParameter("id"));
		model.addAttribute("user", user);
		return "background/user/editUser";
	}

	// 修改闲谈
	@RequestMapping("/userUpdate.html")
	public String userUpdate(User user, HttpServletRequest request, Model model) {
		userService.editEntity(user);
		return "forward:/role/manage/userList.html";
		// return "redirect:activityList.html";
	}

	// 删除闲谈
	@RequestMapping("/delUser.html")
	public void delUser(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id == null || id.equals("")) {
			jb.setStatus("000");
			jb.setMessage("非法操作");
		} else {
			userService.deleteEntity(id);
			jb.setStatus("100");
			jb.setMessage("操作成功");
		}
		BlogUtil.fromPrintJson(jb, response);
	}

}
