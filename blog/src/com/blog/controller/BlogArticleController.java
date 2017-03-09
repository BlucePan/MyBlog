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
import com.blog.model.BlogArticleType;
import com.blog.model.BlogMenu;
import com.blog.service.BlogArticleService;
import com.blog.util.BlogUtil;
import com.blog.util.JsonBeang;
import com.blog.util.PageView;
@Controller
@RequestMapping("/article/manage/*")
public class BlogArticleController extends BaseController {
	private JsonBeang jb = new JsonBeang();
	@Resource
	private BlogArticleService bArticleService;
	
	//文章列表
	@RequestMapping("/articleList.html")
	public String articleList(HttpServletRequest request, Model model) {
	  List<BlogArticleType> articleTypeList=bArticleService.getAllArticleType();//得到所有的文章类型
	  	
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("title", request.getParameter("title"));
		map.put("type", request.getParameter("type"));
		PageView pageView = bArticleService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if(!BlogUtil.isEmpty(request.getParameter("title"))){
			buffer.append("&title=");
			buffer.append(request.getParameter("title"));
		}if(!BlogUtil.isEmpty(request.getParameter("type"))){
			buffer.append("&type=");
			buffer.append(request.getParameter("type"));
		}
		model.addAttribute("pager",pageView.getPagerStr(buffer));
        model.addAttribute("list", pageView.getItems());
        model.addAttribute("articleTypeList", articleTypeList);
			
		return "background/article/articleList";
	}

	
	//跳到增加页面
	@RequestMapping("/addToArticle.html")
	public String addToArticle(HttpServletRequest request, Model model) {	
		  List<BlogArticleType> articleTypeList=bArticleService.getAllArticleType();//得到所有的文章类型
		   model.addAttribute("articleTypeList", articleTypeList);
			return "background/article/addArticle";
	}
	
	
	//添加文章
	@RequestMapping("addArticle.html")
	public String addArticle(HttpServletRequest request, Model model,BlogArticle article) {	
		article.setId(BlogUtil.getKey());
		article.setCreateUserId(String.valueOf(getLoginUser(request).getId()));
		bArticleService.addArticle(article);
		 return "forward:/article/manage/articleList.html";
}	
	
	//查看文章详情
	@RequestMapping("/articleDetail.html")
	public String menuDetail(HttpServletRequest request, Model model) {
		BlogArticle article = bArticleService.queryBlogArticleById(request.getParameter("id"));
		model.addAttribute("article", article);
	List<BlogArticleType> articleTypeList=bArticleService.getAllArticleType();//得到所有的文章类型
		model.addAttribute("articleTypeList", articleTypeList);
		return "background/article/editArticle";
	}
	
	//修改文章
	@RequestMapping("/articleUpdate.html")
	public String articleUpdate(HttpServletRequest request, Model model) {
		BlogArticle article = new BlogArticle();
		article.setId(request.getParameter("id"));
		article.setTitle(request.getParameter("title"));
		article.setImage(request.getParameter("image"));
		article.setRemake(request.getParameter("remake"));
		article.setType(Integer.parseInt(request.getParameter("type")));
		article.setUpdateUserId(String.valueOf(getLoginUser(request).getId()));
		article.setContext(request.getParameter("context"));
		bArticleService.updateBlogArticle(article);
		return "forward:/article/manage/articleList.html";
		//	return "redirect:activityList.html";
	}
	//删除文章
	@RequestMapping("/delArticle.html")
	public void delArticle(HttpServletRequest request,HttpServletResponse response){
		String id=request.getParameter("id");
		if (id == null || id.equals("") ) {
			 jb.setStatus("000");
			 jb.setMessage("非法操作");
		}else{		
			bArticleService.deleteBlogArticle(id);
			jb.setStatus("100");
			jb.setMessage("操作成功");
		}
		BlogUtil.fromPrintJson(jb, response);
	}
	
	//置顶操作
	@RequestMapping("/editTopArticle.html")
	public String editTopArticle(HttpServletRequest request){
		try {
			BlogArticle article = new BlogArticle();
			article.setId(request.getParameter("id"));
			article.setTop(1);		
			article.setUpdateUserId(getLoginUser(request).getId());
			bArticleService.updateBlogArticle(article);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return "forward:/article/manage/articleList.html";
		// return "redirect:activityList.html";
	}
	
	//取消置顶
	@RequestMapping("/delTopArticle.html")
	public String delTopArticle(HttpServletRequest request){
		try {
			BlogArticle article = new BlogArticle();
			article.setId(request.getParameter("id"));
			article.setUpdateUserId(getLoginUser(request).getId());
			bArticleService.delTopArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/article/manage/articleList.html";
	}
}
