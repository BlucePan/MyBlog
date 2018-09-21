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
		PageData pageData=new PageData();
		List<BlogArticle> bArticleList = bArticleService.getRecommendArticle();
		model.addAttribute("bArticleList", bArticleList); // 首页推荐文章
		List<BlogArticle> nArticleList = bArticleService.getNewArticle(pageData);
		model.addAttribute("nArticleList", nArticleList); // 首页最新文章
		List<BlogArticle> sArticleList = bArticleService.getSeniorityArticle(pageData);
		model.addAttribute("sArticleList", sArticleList); // 首页排行文章
		List<PageData> bSlideList = bSlideService.queryAllSlide(new PageData());
		model.addAttribute("bSlideList", bSlideList); // 首页轮播图
		List<PageData> labelList =bSlideService.ariticleLabelGroup(pageData); 
		model.addAttribute("labelList", labelList); //获取有文章的标签
		return "face/home";
	}
	/**
	 * 跳转类目
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/chose.html")
	public String chose(HttpServletRequest request, Model model) {
		String catCode=request.getParameter("catCode");
		String label=request.getParameter("label");
		if(catCode.contains("002.010")){//技术分享
			return  !BlogUtil.isEmpty(label) ? "redirect:/article.html?catCode="+catCode+"&label="+label : "redirect:/article.html?catCode="+catCode;
		}else if(catCode.contains("002.020")){//口述历史
			return  !BlogUtil.isEmpty(label) ? "redirect:/history.html?catCode="+catCode+"&label="+label : "redirect:/history.html?catCode="+catCode;
		}else if(catCode.contains("002.030")){//生活百态
			return  !BlogUtil.isEmpty(label) ? "redirect:/funny.html?catCode="+catCode+"&label="+label : "redirect:/funny.html?catCode="+catCode;
		}
		return null;
	}
	

	/**
	 * 技术分享
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/article.html")
	public String articleList(HttpServletRequest request, Model model) {
		String parentCode="002.010";
		String searchName="技术分享";
		PageData pageData=new PageData();
		pageData.put("parentCode", parentCode);
		List<PageData> articleTypeList=bSlideService.selectType(pageData);//得到当前分类的文章类型
		List<PageData> labelList =bSlideService.ariticleLabelGroup(pageData);//得到当前分类的文章标签
		
		PageView page = new PageView();
		page.setPageSize(3);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		String catCode=request.getParameter("catCode");
		Map map = new HashMap();		
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(parentCode)) {
			map.put("parentCode", parentCode);
			buffer.append("&parentCode="+parentCode);
			model.addAttribute("parentCode",parentCode);
		}if(!BlogUtil.isEmpty(catCode) && catCode.length()>8){
			map.put("catCode", catCode);
			buffer.append("&catCode="+catCode);
			PageData articleType=bSlideService.queryTypeByCatCode(catCode);
			searchName=articleType.getString("articleName");
		}if(!BlogUtil.isEmpty(request.getParameter("title"))) {
			map.put("title", request.getParameter("title"));
			buffer.append("&title="+request.getParameter("title"));
			searchName=request.getParameter("title");
		}if(!BlogUtil.isEmpty(request.getParameter("label"))) {
			map.put("label", request.getParameter("label"));
			buffer.append("&label="+request.getParameter("label"));
			PageData labelType=bSlideService.queryLabelByLabel(request.getParameter("label"));
			searchName=labelType.getString("name");
		}
		PageView pageView = bArticleService.findByPage(page, map);
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());
		model.addAttribute("articleTypeList", articleTypeList);
		model.addAttribute("labelList", labelList);
		model.addAttribute("searchName",searchName);
		return "face/articleList";
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
		String parentCode="002.020";
		String searchName="口述历史";
		PageData pageData=new PageData();
		pageData.put("parentCode", parentCode);
		List<PageData> articleTypeList=bSlideService.selectType(pageData);//得到当前分类的文章类型
		List<PageData> labelList =bSlideService.ariticleLabelGroup(pageData);//得到当前分类的文章标签
		
		PageView page = new PageView();
		page.setPageSize(3);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		String catCode=request.getParameter("catCode");
		Map map = new HashMap();		
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(parentCode)) {
			map.put("parentCode", parentCode);
			buffer.append("&parentCode="+parentCode);
			model.addAttribute("parentCode",parentCode);
		}if(!BlogUtil.isEmpty(catCode) && catCode.length()>8){
			map.put("catCode", catCode);
			buffer.append("&catCode="+catCode);
			PageData articleType=bSlideService.queryTypeByCatCode(catCode);
			searchName=articleType.getString("articleName");
		}if(!BlogUtil.isEmpty(request.getParameter("title"))) {
			map.put("title", request.getParameter("title"));
			buffer.append("&title="+request.getParameter("title"));
			searchName=request.getParameter("title");
		}if(!BlogUtil.isEmpty(request.getParameter("label"))) {
			map.put("label", request.getParameter("label"));
			buffer.append("&label="+request.getParameter("label"));
			PageData labelType=bSlideService.queryLabelByLabel(request.getParameter("label"));
			searchName=labelType.getString("name");
		}
		PageView pageView = bArticleService.findByPage(page, map);
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());
		model.addAttribute("articleTypeList", articleTypeList);
		model.addAttribute("labelList", labelList);
		model.addAttribute("searchName",searchName);
		return "face/historyList";
	}
	
	/**
	 * 生活百态
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/funny.html")
	public String funnyList(HttpServletRequest request, Model model) {
		String parentCode="002.030";
		String searchName="生活百态";
		PageData pageData=new PageData();
		pageData.put("parentCode", parentCode);
		List<PageData> articleTypeList=bSlideService.selectType(pageData);//得到当前分类的文章类型
		List<PageData> labelList =bSlideService.ariticleLabelGroup(pageData);//得到当前分类的文章标签
		
		PageView page = new PageView();
		page.setPageSize(3);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		String catCode=request.getParameter("catCode");
		Map map = new HashMap();		
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(parentCode)) {
			map.put("parentCode", parentCode);
			buffer.append("&parentCode="+parentCode);
			model.addAttribute("parentCode",parentCode);
		}if(!BlogUtil.isEmpty(catCode) && catCode.length()>8){
			map.put("catCode", catCode);
			buffer.append("&catCode="+catCode);
			PageData articleType=bSlideService.queryTypeByCatCode(catCode);
			searchName=articleType.getString("articleName");
		}if(!BlogUtil.isEmpty(request.getParameter("title"))) {
			map.put("title", request.getParameter("title"));
			buffer.append("&title="+request.getParameter("title"));
			searchName=request.getParameter("title");
		}if(!BlogUtil.isEmpty(request.getParameter("label"))) {
			map.put("label", request.getParameter("label"));
			buffer.append("&label="+request.getParameter("label"));
			PageData labelType=bSlideService.queryLabelByLabel(request.getParameter("label"));
			searchName=labelType.getString("name");
		}
		PageView pageView = bArticleService.findByPage(page, map);
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());
		model.addAttribute("articleTypeList", articleTypeList);
		model.addAttribute("labelList", labelList);
		model.addAttribute("searchName",searchName);
		return "face/funnyList";
	}
	
	/**
	 * 全局搜索
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/search.html")
	public String searchList(HttpServletRequest request, Model model) {
		String searchName="未知";
		PageData pageData=new PageData();
		List<PageData> articleTypeList=bSlideService.selectType(pageData);//得到当前分类的文章类型
		List<PageData> labelList =bSlideService.ariticleLabelGroup(pageData);//得到当前分类的文章标签
		PageView page = new PageView();
		page.setPageSize(3);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		String catCode=request.getParameter("catCode");
		Map map = new HashMap();		
		StringBuffer buffer = new StringBuffer();
        if(!BlogUtil.isEmpty(catCode)){
			map.put("catCode", catCode);
			buffer.append("&catCode="+catCode);
			PageData articleType=bSlideService.queryTypeByCatCode(catCode);
			searchName=articleType.getString("articleName");
		}if(!BlogUtil.isEmpty(request.getParameter("title"))) {
			map.put("title", request.getParameter("title"));
			buffer.append("&title="+request.getParameter("title"));
			searchName=request.getParameter("title");
		}if(!BlogUtil.isEmpty(request.getParameter("label"))) {
			map.put("label", request.getParameter("label"));
			buffer.append("&label="+request.getParameter("label"));
			PageData labelType=bSlideService.queryLabelByLabel(request.getParameter("label"));
			searchName=labelType.getString("name");
		}
		PageView pageView = bArticleService.findByPage(page, map);
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());
		model.addAttribute("articleTypeList", articleTypeList);
		model.addAttribute("labelList", labelList);
		model.addAttribute("searchName",searchName);
		return "face/resultList";
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
	//	blogArticle.setType(Integer.valueOf(request.getParameter("type")));
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
	
	// 右边公共文章展示
	@RequestMapping("/faceRightArticleList.html")
	public String faceRightArticleList(HttpServletRequest request, Model model) {
		// 跳往主页
		PageData pageData=new PageData();
		pageData.put("parentCode", request.getParameter("catCode"));
		List<BlogArticle> nArticleList = bArticleService.getNewArticle(pageData);
		model.addAttribute("nArticleList", nArticleList); // 首页最新文章
		List<BlogArticle> sArticleList = bArticleService.getSeniorityArticle(pageData);
		model.addAttribute("sArticleList", sArticleList); // 首页排行文章

		return "face/faceRight";
	}

}
