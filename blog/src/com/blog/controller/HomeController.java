package com.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.BaseController;
import com.blog.model.BlogArticle;
import com.blog.model.BlogArticleType;
import com.blog.model.BlogVideo;
import com.blog.model.User;
import com.blog.util.BlogUtil;
import com.blog.util.PageData;
import com.blog.util.PageView;

@Controller
public class HomeController extends BaseController {

	/**
	 * 主页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/home.html")
	public String home(HttpServletRequest request, Model model) {
		// 跳往主页
		List<BlogArticle> bArticleList = bArticleService.getRecommendArticle();
		model.addAttribute("bArticleList", bArticleList); // 首页推荐文章
		List<BlogArticle> nArticleList = bArticleService.getNewArticle();
		model.addAttribute("nArticleList", nArticleList); // 首页最新文章
		List<BlogArticle> sArticleList = bArticleService.getSeniorityArticle();
		model.addAttribute("sArticleList", sArticleList); // 首页排行文章
		List<PageData> bSlideList = bSlideService.queryAllSlide(new PageData());
		model.addAttribute("bSlideList", bSlideList); // 首页轮播图
		List<PageData> labelList =bSlideService.ariticleLabelGroup("1"); //获取有文章的标签
		model.addAttribute("labelList", labelList); // 首页轮播图
		return "face/home";
	}

	/**
	 * 个人博客
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/article.html")
	public String articleList(HttpServletRequest request, Model model) {
		List<BlogArticleType> articleTypeList = bArticleService.getAllArticleType();// 得到所有的文章类型

		PageView page = new PageView();
		page.setPageSize(3);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("title", request.getParameter("title"));
		map.put("type", request.getParameter("type"));
		PageView pageView = bArticleService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("title"))) {
			buffer.append("&title=");
			buffer.append(request.getParameter("title"));
		}
		if (!BlogUtil.isEmpty(request.getParameter("type"))) {
			buffer.append("&type=");
			buffer.append(request.getParameter("type"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());
		model.addAttribute("articleTypeList", articleTypeList);

		return "face/faceArticleList";
	}

	/**
	 * 文章详情
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/articleDetail.html")
	public String articleDetail(HttpServletRequest request, Model model) {
		BlogArticle article = bArticleService.queryBlogArticleById(request.getParameter("id"));
		model.addAttribute("article", article);

		BlogArticle blogArticle = new BlogArticle();
		blogArticle.setId(request.getParameter("id"));
		blogArticle.setType(Integer.valueOf(request.getParameter("type")));
		// 上一篇
		blogArticle.setIsNext("1");
		BlogArticle aboveArticle = bArticleService.getNextArticle(blogArticle);
		model.addAttribute("aboveArticle", aboveArticle);
		// 下一篇
		blogArticle.setIsNext("2");
		BlogArticle nextArticle = bArticleService.getNextArticle(blogArticle);
		model.addAttribute("nextArticle", nextArticle);
		Map map = new HashMap();
		map.put("id", article.getId());
		map.put("keyWord", article.getKeyWord());
		// 相关文章
		List<BlogArticle> lArticleList = bArticleService.getLikeArticle(map);
		request.setAttribute("lArticleList", lArticleList);
		return "face/articleDetail";
	}

	/**
	 * 关于我
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/about.html")
	public String about(HttpServletRequest request) {
		User user = (User) userService.queryUserById("666666");

		request.setAttribute("user", user);
		return "face/about";
	}

	/**
	 * 留言板
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/gustbook.html")
	public String gustbook(HttpServletRequest request) {
		User user = (User) userService.queryUserById("666666");

		request.setAttribute("user", user);
		return "face/gustbook";
	}

	/**
	 * 娱乐视频
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/video.html")
	public String video(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(8);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("createTime", request.getParameter("createTime"));
		PageView pageView = bVideoService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("createTime"))) {
			buffer.append("&createTime=");
			buffer.append(request.getParameter("createTime"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());
		return "face/faceVideoList";
	}

	/**
	 * 视频详情
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/videosDetail.html")
	public String videosDetail(HttpServletRequest request, Model model) {
		BlogVideo video = bVideoService.queryBlogVideoById(request.getParameter("id"));
		model.addAttribute("video", video);

		Map map = new HashMap();
		map.put("id", video.getId());
		map.put("keyWord", video.getKeyWord());
		// 相关视频
		List<BlogVideo> lVideoList = bVideoService.getLikeVideo(map);
		request.setAttribute("lVideoList", lVideoList);
		return "face/videoDetail";
	}

	/**
	 * 闲谈随笔
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/jottings.html")
	public String jottings(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(10);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("createTime", request.getParameter("createTime"));
		PageView pageView = bJottingsService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("createTime"))) {
			buffer.append("&createTime=");
			buffer.append(request.getParameter("createTime"));
		}
		model.addAttribute("pager", pageView.toHtml(buffer));
		model.addAttribute("jList", pageView.getItems());
		return "face/jottings";
	}
	
	/**
	 * 口述历史
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/history.html")
	public String historyList(HttpServletRequest request, Model model) {
		List<BlogArticleType> articleTypeList = bArticleService.getAllArticleType();// 得到所有的文章类型

		PageView page = new PageView();
		page.setPageSize(3);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("title", request.getParameter("title"));
		map.put("type", request.getParameter("type"));
		PageView pageView = bArticleService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("title"))) {
			buffer.append("&title=");
			buffer.append(request.getParameter("title"));
		}
		if (!BlogUtil.isEmpty(request.getParameter("type"))) {
			buffer.append("&type=");
			buffer.append(request.getParameter("type"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());
		model.addAttribute("articleTypeList", articleTypeList);

		return "face/historyList";
	}

}
