package com.blog.controller;

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
import com.blog.model.BlogArticle;
import com.blog.model.BlogJottings;
import com.blog.model.BlogMenu;
import com.blog.service.BlogJottingsService;
import com.blog.service.BlogMenuService;
import com.blog.util.BlogUtil;
import com.blog.util.JsonBeang;
import com.blog.util.PageView;

@Controller
@RequestMapping("/jottings/manage/*")
public class BlogJottingsController extends BaseController {
	@Resource
	private BlogJottingsService bJottingsService;
	private JsonBeang jb = new JsonBeang();
	//闲谈列表
	@RequestMapping("/jottingsList.html")
	public String JottingsList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("createTime", request.getParameter("createTime"));
		PageView pageView = bJottingsService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if(!BlogUtil.isEmpty(request.getParameter("createTime"))){
			buffer.append("&createTime=");
			buffer.append(request.getParameter("createTime"));
		}  
		model.addAttribute("pager",pageView.getPagerStr(buffer));
        model.addAttribute("list", pageView.getItems());
			
		return "background/jottings/jottingsList";
	}
	//跳到增加页面	
	@RequestMapping("/jottingsToAdd.html")
	public String jottingsToAdd(HttpServletRequest request, Model model) {
		return "background/jottings/addJottings";
	}
	//增加闲谈
	@RequestMapping("/jottingsAdd.html")
	public String jottingsAdd(HttpServletRequest request, Model model) {
		BlogJottings jottings = new BlogJottings();
		jottings.setId(BlogUtil.getKey());
		jottings.setCreateUserId(String.valueOf(getLoginUser(request).getId()));
		jottings.setKeyWord(request.getParameter("keyWord"));
		jottings.setContext(request.getParameter("context"));
		bJottingsService.addBlogJottings(jottings);
		return "forward:/jottings/manage/jottingsList.html";
	}
	//查看详情
	@RequestMapping("/jottingsDetail.html")
	public String jottingsDetail(HttpServletRequest request, Model model) {
		BlogJottings jottings = bJottingsService.queryBlogJottingsById(request.getParameter("id"));
		model.addAttribute("jottings", jottings);
		return "background/jottings/editJottings";
	}
	//修改闲谈
	@RequestMapping("/jottingsUpdate.html")
	public String jottingsUpdate(BlogJottings jottings,HttpServletRequest request, Model model) {
		bJottingsService.updateBlogJottings(jottings);
		return "forward:/jottings/manage/jottingsList.html";
		//	return "redirect:activityList.html";
	}
	//删除闲谈
	@RequestMapping("/delJottings.html")
	public void delJottings(HttpServletRequest request,HttpServletResponse response){
		String id=request.getParameter("id");
		if (id == null || id.equals("") ) {
			 jb.setStatus("000");
			 jb.setMessage("非法操作");
		}else{		
			bJottingsService.deleteBlogJottings(id);
			jb.setStatus("100");
			jb.setMessage("操作成功");
		}
		BlogUtil.fromPrintJson(jb, response);
	}
	
	//前台分页加载闲谈列表
	@RequestMapping("/faceJottingsList.html")
	public String faceJottingsList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(10);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("createTime", request.getParameter("createTime"));
		PageView pageView = bJottingsService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if(!BlogUtil.isEmpty(request.getParameter("createTime"))){
			buffer.append("&createTime=");
			buffer.append(request.getParameter("createTime"));
		}  
		model.addAttribute("pager",pageView.getPagerStr(buffer));
        model.addAttribute("jList", pageView.getItems());	
		return "face/jottings";
	}
	
	
	
}
