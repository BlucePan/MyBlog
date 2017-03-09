package com.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.BaseController;
import com.blog.model.BlogMenu;
import com.blog.service.BlogMenuService;
import com.blog.util.BlogUtil;
import com.blog.util.PageView;

@Controller
@RequestMapping("/menu")
public class BlogMenuController extends BaseController {
	@Resource
	private BlogMenuService blogMenuService;
	//退出系统
	@RequestMapping("/clearManage.html")
	public String clearManage(HttpServletRequest request){
		request.getSession(true).setAttribute("oa_user_info", null);
		return "redirect:/menu/toLogin.html";
	}
	
	@RequestMapping("/toLogin.html")
	public String toLogin(HttpServletRequest request){
		
		return "background/login";
	}
	
	//菜单列表
	@RequestMapping("/menuList.html")
	public String menuList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("menuName", request.getParameter("menuName"));
		PageView pageView = blogMenuService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if(!BlogUtil.isEmpty(request.getParameter("menuName"))){
			buffer.append("&menuName=");
			buffer.append(request.getParameter("menuName"));
		}
		model.addAttribute("pager",pageView.getPagerStr(buffer));
        model.addAttribute("list", pageView.getItems());
			
		return "background/menu/list";
	}
	//跳到增加页面	
	@RequestMapping("/menuToAdd.html")
	public String menuToAdd(HttpServletRequest request, Model model) {
		BlogMenu menu = new BlogMenu();
		menu.setFlag("1");
		List<BlogMenu> list = blogMenuService.getAllMenuList(menu);
		model.addAttribute("list", list);
		return "background/menu/add";
	}
	//增加菜单
	@RequestMapping("/menuAdd.html")
	public String menuAdd(HttpServletRequest request, Model model) {
		BlogMenu menu = new BlogMenu();
		menu.setId(BlogUtil.getKey());
		menu.setMenuName(request.getParameter("menuName"));
		menu.setResKey(request.getParameter("resKey"));
		menu.setImgUrl(request.getParameter("images"));
		menu.setUrl(request.getParameter("url"));
		menu.setMenuType(request.getParameter("menuType"));
		menu.setPriority(request.getParameter("priority"));
		menu.setSuperior(request.getParameter("superior"));
		menu.setCreateUserId(String.valueOf(getLoginUser(request).getId()));
		menu.setUpdateUserId(String.valueOf(getLoginUser(request).getId()));
		menu.setFlag(request.getParameter("flag"));
		menu.setRemake(request.getParameter("remake"));
		menu.setiScommon(request.getParameter("iScommon"));
		blogMenuService.addBlogMenu(menu);
		return "forward:/menu/menuList.html";
	}
	//查看详情
	@RequestMapping("/menuDetail.html")
	public String menuDetail(HttpServletRequest request, Model model) {
		BlogMenu menu = blogMenuService.queryBlogMenuById(request.getParameter("id"));
		model.addAttribute("menu", menu);
		BlogMenu menu1 = new BlogMenu();
		menu1.setFlag("1");
		List<BlogMenu> list = blogMenuService.getAllMenuList(menu1);
		model.addAttribute("list", list);
		return "background/menu/edit";
	}
	//修改菜单
	@RequestMapping("/menuUpdate.html")
	public String menuUpdate(HttpServletRequest request, Model model) {
		BlogMenu menu = new BlogMenu();
		menu.setId(request.getParameter("id"));
		menu.setMenuName(request.getParameter("menuName"));
		menu.setResKey(request.getParameter("resKey"));
		menu.setImgUrl(request.getParameter("images"));
		menu.setUrl(request.getParameter("url"));
		menu.setMenuType(request.getParameter("menuType"));
		menu.setPriority(request.getParameter("priority"));
		menu.setSuperior(request.getParameter("superior"));
		menu.setUpdateUserId(String.valueOf(getLoginUser(request).getId()));
		menu.setFlag(request.getParameter("flag"));
		menu.setRemake(request.getParameter("remake"));
		menu.setiScommon(request.getParameter("iScommon"));
		blogMenuService.updateBlogMenu(menu);
		return "forward:/menu/menuList.html";
	}
	//删除菜单
	@ResponseBody
	@RequestMapping("/menuDel.html")
	public String menuDel(HttpServletRequest request){
		String data = "";
		String id = request.getParameter("id");
		BlogMenu menu = new BlogMenu();
		menu.setSuperior(id);
		List<BlogMenu> menuList = blogMenuService.getAllMenuList(menu);
		if(menuList.size()>0){
			data = "error";
		}else{
			blogMenuService.deleteBlogMenu(id);
			data = "success";
		}
		return data;
	}
	
}
