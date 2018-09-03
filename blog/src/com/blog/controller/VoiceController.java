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
 * 	视频和音乐的控制器
 * @author panzhi
 * @date 2017-3-22  
 * @version 1.0.0
 */
@Controller("/voice/manage/*")
public class VoiceController extends BaseController {

	@Resource
	private BlogVideoService bVideoService;
	@Resource
	private BlogMusicService bMusicService;
	@Resource
	private BlogSlideService bSlideService;
	
	private JsonBeang jb = new JsonBeang();
	
	//视频列表
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
		if(!BlogUtil.isEmpty(request.getParameter("title"))){
			buffer.append("&title=");
			buffer.append(request.getParameter("title"));
		}if(!BlogUtil.isEmpty(request.getParameter("isPublish"))){
			buffer.append("&isPublish=");
			buffer.append(request.getParameter("isPublish"));
		}  
		model.addAttribute("pager",pageView.getPagerStr(buffer));
        model.addAttribute("list", pageView.getItems());
			
		return "background/video/videoList";
	}
	//跳到增加页面	
	@RequestMapping("/videoToAdd.html")
	public String videoToAdd(HttpServletRequest request, Model model) {
		return "background/video/addVideo";
	}
	//增加闲谈
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
	//查看详情
	@RequestMapping("/videoDetail.html")
	public String videoDetail(HttpServletRequest request, Model model) {
		BlogVideo video = bVideoService.queryBlogVideoById(request.getParameter("id"));
		model.addAttribute("video", video);
		return "background/video/editVideo";
	}
	//修改闲谈
	@RequestMapping("/videoUpdate.html")
	public String videoUpdate(BlogVideo bVideo,HttpServletRequest request, Model model) {
		bVideoService.updateBlogVideo(bVideo);
		return "forward:/voice/manage/videoList.html";
		//	return "redirect:activityList.html";
	}
	//删除闲谈
	@RequestMapping("/delVideo.html")
	public void delVideo(HttpServletRequest request,HttpServletResponse response){
		String id=request.getParameter("id");
		if (id == null || id.equals("") ) {
			 jb.setStatus("000");
			 jb.setMessage("非法操作");
		}else{		
			bVideoService.deleteBlogVideo(id);
			jb.setStatus("100");
			jb.setMessage("操作成功");
		}
		BlogUtil.fromPrintJson(jb, response);
	}
	
	//取消发布
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
	
	
	//前台分页加载闲谈列表
	@RequestMapping("/faceVideoList.html")
	public String faceVideoList(HttpServletRequest request, Model model) {
		PageView page = new PageView();
		page.setPageSize(8);
		page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
		Map map = new HashMap();
		map.put("createTime", request.getParameter("createTime"));
		PageView pageView = bVideoService.findByPage(page, map);
		StringBuffer buffer = new StringBuffer();
		if(!BlogUtil.isEmpty(request.getParameter("createTime"))){
			buffer.append("&createTime=");
			buffer.append(request.getParameter("createTime"));
		}  
		model.addAttribute("pager",pageView.getPagerStr(buffer));
        model.addAttribute("list", pageView.getItems());	
		return "face/faceVideoList";
	}
	
	//查看详情
	@RequestMapping("/faceVideoDetail.html")
	public String faceVideoDetail(HttpServletRequest request, Model model) {
		BlogVideo video = bVideoService.queryBlogVideoById(request.getParameter("id"));
		model.addAttribute("video", video);
		
		  Map map=new HashMap();
		  map.put("id", video.getId());
		  map.put("keyWord", video.getKeyWord());
		  //相关视频
	      List<BlogVideo> lVideoList=bVideoService.getLikeVideo(map);
	      request.setAttribute("lVideoList", lVideoList);
		return "face/videoDetail";
	}
	
	
	
//音乐模块
	
	//音乐列表
		@RequestMapping("/musicList.html")
		public String musicList(HttpServletRequest request, Model model) {
			PageView page = new PageView();
			page.setPageSize(15);
			page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
			Map map = new HashMap();
			map.put("createTime", request.getParameter("createTime"));
			PageView pageView = bMusicService.findByPage(page, map);
			StringBuffer buffer = new StringBuffer();
			if(!BlogUtil.isEmpty(request.getParameter("createTime"))){
				buffer.append("&createTime=");
				buffer.append(request.getParameter("createTime"));
			}  
			model.addAttribute("pager",pageView.getPagerStr(buffer));
	        model.addAttribute("list", pageView.getItems());
				
			return "background/music/musicList";
		}
		//跳到增加页面	
		@RequestMapping("/musicToAdd.html")
		public String musicToAdd(HttpServletRequest request, Model model) {
			return "background/music/addMusic";
		}
		//增加音乐
		@RequestMapping("/musicAdd.html")
		public String musicAdd(HttpServletRequest request, Model model) {
			BlogMusic bMusic = new BlogMusic();
			bMusic.setId(BlogUtil.getKey());
			bMusic.setCreateUserId(String.valueOf(getLoginUser(request).getId()));
			bMusicService.addBlogMusic(bMusic);
			return "forward:/music/manage/musicList.html";
		}
		//查看音乐详情
		@RequestMapping("/musicDetail.html")
		public String musicDetail(HttpServletRequest request, Model model) {
			BlogMusic music = bMusicService.queryBlogMusicById(request.getParameter("id"));
			model.addAttribute("music", music);
			return "background/music/editmusic";
		}
		//修改音乐
		@RequestMapping("/musicUpdate.html")
		public String musicUpdate(BlogMusic bMusic,HttpServletRequest request, Model model) {
			bMusicService.updateBlogMusic(bMusic);
			return "forward:/music/manage/musicList.html";
			//	return "redirect:activityList.html";
		}
		//删除音乐
		@RequestMapping("/delMusic.html")
		public void delMusic(HttpServletRequest request,HttpServletResponse response){
			String id=request.getParameter("id");
			if (id == null || id.equals("") ) {
				 jb.setStatus("000");
				 jb.setMessage("非法操作");
			}else{		
				bMusicService.deleteBlogMusic(id);
				jb.setStatus("100");
				jb.setMessage("操作成功");
			}
			BlogUtil.fromPrintJson(jb, response);
		}
		
		//前台分页加载音乐列表
		@RequestMapping("/faceMusicList.html")
		public String faceMusicList(HttpServletRequest request, Model model) {
			PageView page = new PageView();
			page.setPageSize(10);
			page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
			Map map = new HashMap();
			map.put("createTime", request.getParameter("createTime"));
			PageView pageView = bMusicService.findByPage(page, map);
			StringBuffer buffer = new StringBuffer();
			if(!BlogUtil.isEmpty(request.getParameter("createTime"))){
				buffer.append("&createTime=");
				buffer.append(request.getParameter("createTime"));
			}  
			model.addAttribute("pager",pageView.getPagerStr(buffer));
	        model.addAttribute("mList", pageView.getItems());	
			return "face/faceMusicList";
		}
	
	
		//轮播图列表
		@RequestMapping("/slideList.html")
		public String slideList(HttpServletRequest request, Model model) {
			PageView page = new PageView();
			page.setPageSize(15);
			page.setCurrentPage(request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")));
			Map map = new HashMap();
			map.put("title", request.getParameter("title"));
			PageView pageView = bSlideService.findByPage(map, page);
			StringBuffer buffer = new StringBuffer();
			if(!BlogUtil.isEmpty(request.getParameter("title"))){
				buffer.append("&title=");
				buffer.append(request.getParameter("title"));
			}
			model.addAttribute("pager",pageView.getPagerStr(buffer));
	        model.addAttribute("list", pageView.getItems());
				
			return "background/slide/slideList";
		}
		//跳到增加页面	
		@RequestMapping("/slideToAdd.html")
		public String slideToAdd(HttpServletRequest request, Model model) {
			return "background/slide/addSlide";
		}
		//增加轮播图
		@RequestMapping("/slideAdd.html")
		public String slideAdd(HttpServletRequest request, Model model) {
			PageData pageData=new PageData();
			pageData.put("id", BlogUtil.getKey());
			pageData.put("title", request.getParameter("title"));
			pageData.put("url", request.getParameter("url"));
		    pageData.put("image", request.getParameter("image"));
			bSlideService.addSlide(pageData);
			return "forward:/voice/manage/slideList.html";
		}
		//查看轮播图
		@RequestMapping("/slideDetail.html")
		public String slideDetail(HttpServletRequest request, Model model) {
			PageData slide = bSlideService.queryBlogSlideById(request.getParameter("id"));
			model.addAttribute("slide", slide);
			return "background/slide/editSlide";
		}
		//修改轮播图
		@RequestMapping("/slideUpdate.html")
		public String slideUpdate(BlogVideo bVideo,HttpServletRequest request, Model model) {
			PageData pageData=new PageData();
			pageData.put("id", request.getParameter("id"));
			pageData.put("title", request.getParameter("title"));
			pageData.put("url", request.getParameter("url"));
			pageData.put("image", request.getParameter("image"));
			bSlideService.updateSlide(pageData);
				return "redirect:slideList.html";
		}
		//删除轮播图
		@ResponseBody
		@RequestMapping("/delSlide.html")
		public String delSlide(HttpServletRequest request,HttpServletResponse response){
			String data = "";
			String id=request.getParameter("id");
			if (id == null || id.equals("") ) {
				data="erro";
			}else{		
				bSlideService.delSlide(id);
				data="success";
			}
			return  data;
		}
	
	
	
	
	
	
	
	
	
	
}
