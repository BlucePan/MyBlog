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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.blog.BaseController;
import com.blog.model.BlogArticle;
import com.blog.model.BlogMusic;
import com.blog.model.BlogVideo;
import com.blog.service.BlogMusicService;
import com.blog.service.BlogSlideService;
import com.blog.service.BlogVideoService;
import com.blog.util.BlogUtil;
import com.blog.util.JsonBeang;
import com.blog.util.PageData;
import com.blog.util.PageView;
import com.blog.util.UploadUtil;

/**
 * 视频和音乐的控制器
 * 
 * @author panzhi
 * @date 2017-3-22
 * @version 1.0.0
 */
@Controller("/voice/manage/*")
public class VoiceController extends BaseController {
	private JsonBeang jb = new JsonBeang();

	// 视频列表
	@RequestMapping("/videoList.html")
	public String videoList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("title", request.getParameter("title"));
		map.put("isPublish", request.getParameter("isPublish"));
		PageView pageView = bVideoService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("title"))) {
			buffer.append("&title=");
			buffer.append(request.getParameter("title"));
		}
		if (!BlogUtil.isEmpty(request.getParameter("isPublish"))) {
			buffer.append("&isPublish=");
			buffer.append(request.getParameter("isPublish"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());

		return "background/video/videoList";
	}

	// 跳到增加页面
	@RequestMapping("/videoToAdd.html")
	public String videoToAdd(HttpServletRequest request, Model model) {
		return "background/video/addVideo";
	}

	// 增加闲谈
	@RequestMapping("/videoAdd.html")
	public String videoAdd(HttpServletRequest request, Model model) {
		BlogVideo bVideo = new BlogVideo();
		bVideo.setId(BlogUtil.getKey());
		bVideo.setCreateUserId(String.valueOf(getLoginUser(request).getId()));
		bVideo.setTitle(request.getParameter("title"));
		bVideo.setImage(request.getParameter("image"));
		bVideo.setVideoUrl(request.getParameter("videoUrl"));
		bVideo.setIsPublish(request.getParameter("isPublish"));
		bVideo.setKeyWord(request.getParameter("keyWord"));
		bVideoService.addBlogVideo(bVideo);
		return "forward:/voice/manage/videoList.html";
	}

	// 查看详情
	@RequestMapping("/videoDetail.html")
	public String videoDetail(HttpServletRequest request, Model model) {
		BlogVideo video = bVideoService.queryBlogVideoById(request.getParameter("id"));
		model.addAttribute("video", video);
		return "background/video/editVideo";
	}

	// 修改闲谈
	@RequestMapping("/videoUpdate.html")
	public String videoUpdate(BlogVideo bVideo, HttpServletRequest request, Model model) {
		bVideoService.updateBlogVideo(bVideo);
		return "forward:/voice/manage/videoList.html";
		// return "redirect:activityList.html";
	}

	// 删除闲谈
	@RequestMapping("/delVideo.html")
	public void delVideo(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id == null || id.equals("")) {
			jb.setStatus("000");
			jb.setMessage("非法操作");
		} else {
			bVideoService.deleteBlogVideo(id);
			jb.setStatus("100");
			jb.setMessage("操作成功");
		}
		BlogUtil.fromPrintJson(jb, response);
	}

	// 取消发布
	@ResponseBody
	@RequestMapping("/editVideoStatus.html")
	public String editVideoStatus(BlogVideo bVideo) {
		try {
			bVideoService.updateBlogVideo(bVideo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	/**
	 * 音乐模块
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	// 音乐列表
	@RequestMapping("/musicList.html")
	public String musicList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("createTime", request.getParameter("createTime"));
		PageView pageView = bMusicService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("createTime"))) {
			buffer.append("&createTime=");
			buffer.append(request.getParameter("createTime"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());

		return "background/music/musicList";
	}

	// 跳到增加页面
	@RequestMapping("/musicToAdd.html")
	public String musicToAdd(HttpServletRequest request, Model model) {
		return "background/music/addMusic";
	}

	// 增加音乐
	@RequestMapping("/musicAdd.html")
	public String musicAdd(HttpServletRequest request, Model model) {
		BlogMusic bMusic = new BlogMusic();
		bMusic.setId(BlogUtil.getKey());
		bMusic.setCreateUserId(String.valueOf(getLoginUser(request).getId()));
		bMusicService.addBlogMusic(bMusic);
		return "forward:/music/manage/musicList.html";
	}

	// 查看音乐详情
	@RequestMapping("/musicDetail.html")
	public String musicDetail(HttpServletRequest request, Model model) {
		BlogMusic music = bMusicService.queryBlogMusicById(request.getParameter("id"));
		model.addAttribute("music", music);
		return "background/music/editmusic";
	}

	// 修改音乐
	@RequestMapping("/musicUpdate.html")
	public String musicUpdate(BlogMusic bMusic, HttpServletRequest request, Model model) {
		bMusicService.updateBlogMusic(bMusic);
		return "forward:/music/manage/musicList.html";
		// return "redirect:activityList.html";
	}

	// 删除音乐
	@RequestMapping("/delMusic.html")
	public void delMusic(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if (id == null || id.equals("")) {
			jb.setStatus("000");
			jb.setMessage("非法操作");
		} else {
			bMusicService.deleteBlogMusic(id);
			jb.setStatus("100");
			jb.setMessage("操作成功");
		}
		BlogUtil.fromPrintJson(jb, response);
	}

	// 前台分页加载音乐列表
	@RequestMapping("/faceMusicList.html")
	public String faceMusicList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(10);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("createTime", request.getParameter("createTime"));
		PageView pageView = bMusicService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("createTime"))) {
			buffer.append("&createTime=");
			buffer.append(request.getParameter("createTime"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("mList", pageView.getItems());
		return "face/faceMusicList";
	}

	// 轮播图列表
	@RequestMapping("/slideList.html")
	public String slideList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("title", request.getParameter("title"));
		PageView pageView = bSlideService.findByPage(map, page);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("title"))) {
			buffer.append("&title=");
			buffer.append(request.getParameter("title"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());

		return "background/slide/slideList";
	}

	// 跳到增加页面
	@RequestMapping("/slideToAdd.html")
	public String slideToAdd(HttpServletRequest request, Model model) {
		return "background/slide/addSlide";
	}

	// 增加轮播图
	@RequestMapping("/slideAdd.html")
	public String slideAdd(HttpServletRequest request, Model model) {
		PageData pageData = new PageData();
		pageData.put("id", BlogUtil.getKey());
		pageData.put("title", request.getParameter("title"));
		pageData.put("url", request.getParameter("url"));
		pageData.put("image", request.getParameter("image"));
		bSlideService.addSlide(pageData);
		return "forward:/voice/manage/slideList.html";
	}

	// 查看轮播图
	@RequestMapping("/slideDetail.html")
	public String slideDetail(HttpServletRequest request, Model model) {
		PageData slide = bSlideService.queryBlogSlideById(request.getParameter("id"));
		model.addAttribute("slide", slide);
		return "background/slide/editSlide";
	}

	// 修改轮播图
	@RequestMapping("/slideUpdate.html")
	public String slideUpdate(BlogVideo bVideo, HttpServletRequest request, Model model) {
		PageData pageData = new PageData();
		pageData.put("id", request.getParameter("id"));
		pageData.put("title", request.getParameter("title"));
		pageData.put("url", request.getParameter("url"));
		pageData.put("image", request.getParameter("image"));
		bSlideService.updateSlide(pageData);
		return "redirect:slideList.html";
	}

	// 删除轮播图
	@ResponseBody
	@RequestMapping("/delSlide.html")
	public String delSlide(HttpServletRequest request, HttpServletResponse response) {
		String data = "";
		String id = request.getParameter("id");
		if (id == null || id.equals("")) {
			data = "erro";
		} else {
			bSlideService.delSlide(id);
			data = "success";
		}
		return data;
	}
	
	//标签列表
	@RequestMapping("/labelList.html")
	public String labelList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("name", request.getParameter("name"));
		PageView pageView = bSlideService.findLabelByPage(map, page);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("name"))) {
			buffer.append("&name=");
			buffer.append(request.getParameter("name"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());

		return "background/slide/labelList";
	}
	
	// 增加标签
	@RequestMapping("/labelAdd.html")
	public String labelAdd(HttpServletRequest request, Model model) {
		PageData pageData = new PageData();
		pageData.put("id", BlogUtil.getKey());
		pageData.put("name", request.getParameter("name"));
		bSlideService.addLabel(pageData);
		return "forward:/voice/manage/labelList.html";
	}
	
	// 修改标签
	@RequestMapping("/labelUpdate.html")
	public String labelUpdate(BlogVideo bVideo, HttpServletRequest request, Model model) {
		PageData pageData = new PageData();
		pageData.put("id", request.getParameter("id"));
		pageData.put("name", request.getParameter("name"));
		bSlideService.updateLabel(pageData);
		return "redirect:labelList.html";
	}

	// 删除标签
	@ResponseBody
	@RequestMapping("/delLabel.html")
	public String delLabel(HttpServletRequest request, HttpServletResponse response) {
		String data = "";
		String id = request.getParameter("id");
		if (id == null || id.equals("")) {
			data = "erro";
		} else {
			bSlideService.delLabel(id);
			data = "success";
		}
		return data;
	}
	
	//类目列表
	@RequestMapping("/typeList.html")
	public String typeList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("name", request.getParameter("name"));
		map.put("depth", 1);
		PageView pageView = bSlideService.findTypeByPage(map, page);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("name"))) {
			buffer.append("&name=");
			buffer.append(request.getParameter("name"));
		}
		buffer.append("&depth="+1);
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());

		return "background/slide/typeList";
	}
	
	// 增加类目
	@RequestMapping("/typeAdd.html")
	public String typeAdd(HttpServletRequest request, Model model) {
		String type=request.getParameter("type");
		String parentCode=request.getParameter("parentCode");
		String parentName=request.getParameter("parentName");
		PageData pageData = new PageData();		
		pageData.put("id", BlogUtil.getKey());
		pageData.put("articleName", request.getParameter("articleName"));		
		pageData.put("isShow", 1);
		if(type.equals("1")){ //父类
		pageData.put("depth", 1);
		pageData.put("catCode", request.getParameter("catCode"));
		pageData.put("parentCode", request.getParameter("catCode").substring(0, 3));
		bSlideService.addType(pageData);
		return "forward:/voice/manage/typeList.html";
		}else{ //二级类目
		pageData.put("depth", 2);
		pageData.put("parentCode", parentCode);
		pageData.put("catCode", parentCode+"."+((int)(Math.random()*1000)));
		bSlideService.addType(pageData);
		return "forward:/voice/manage/typeArticleList.html?parentCode="+parentCode+"&parentName="+parentName;
		}
	}
	
	// 修改类目
	@RequestMapping("/typeUpdate.html")
	public String typeUpdate(BlogVideo bVideo, HttpServletRequest request, Model model) {
		String type=request.getParameter("type");
		String parentCode=request.getParameter("parentCode");
		String parentName=request.getParameter("parentName");
		PageData pageData = new PageData();
		pageData.put("id", request.getParameter("id"));
		pageData.put("articleName", request.getParameter("articleName"));
		if(type.equals("1")){ //父类		
		pageData.put("catCode", request.getParameter("catCode"));
		pageData.put("parentCode", request.getParameter("catCode").substring(0, 3));
		bSlideService.updateType(pageData);
		return "forward:/voice/manage/typeList.html";
		}else{
		bSlideService.updateType(pageData);
		return "forward:/voice/manage/typeArticleList.html?parentCode="+parentCode+"&parentName="+parentName;	
		}
	}

	// 删除类目
	@ResponseBody
	@RequestMapping("/delType.html")
	public String delType(HttpServletRequest request, HttpServletResponse response) {
		String data = "";
		String id = request.getParameter("id");
		if (id == null || id.equals("")) {
			data = "erro";
		} else {
			bSlideService.delType(id);
			data = "success";
		}
		return data;
	}
	
	//类目列表
	@RequestMapping("/typeArticleList.html")
	public String typeArticleList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(15);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("name", request.getParameter("name"));
		map.put("parentCode", request.getParameter("parentCode"));
		PageView pageView = bSlideService.findTypeByPage(map, page);
		StringBuffer buffer = new StringBuffer();
		if (!BlogUtil.isEmpty(request.getParameter("name"))) {
			buffer.append("&name=");
			buffer.append(request.getParameter("name"));
		}if (!BlogUtil.isEmpty(request.getParameter("parentCode"))){
			buffer.append("&parentCode=");
			buffer.append(request.getParameter("parentCode"));
		}
		model.addAttribute("pager", pageView.getPagerStr(buffer));
		model.addAttribute("list", pageView.getItems());
		model.addAttribute("parentName", request.getParameter("parentName"));
		model.addAttribute("parentCode", request.getParameter("parentCode"));
		return "background/slide/typeArticleList";
	}
	
	//ajax加载类别
	@ResponseBody
	@RequestMapping("/selectType.html")
	public List selectType(HttpServletRequest request, HttpServletResponse response) {

		String catCode = request.getParameter("catCode");
		PageData pageData=new PageData();
		if(BlogUtil.isNotBlank(catCode)){
			pageData.put("parentCode", catCode);
			return bSlideService.selectType(pageData);
		}else{
			pageData.put("depth", 1);
			return bSlideService.selectType(pageData);
		}
	}

}
