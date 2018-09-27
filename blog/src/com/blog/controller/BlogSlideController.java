package com.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.blog.BaseController;
import com.blog.service.BlogSlideService;
import com.blog.util.JsonBeang;
import com.blog.util.PageData;
import com.blog.util.PageView;

@Controller
public class BlogSlideController extends BaseController {
	private JsonBeang jb;

	@ResponseBody
	@RequestMapping(value = "/api/slideList.html")
	public JsonBeang goodsList(HttpServletRequest request) {
		jb = new JsonBeang();
		try {
			PageData pd = new PageData();
			List<PageData> slideList = blogSlideService.queryAllSlide(pd);
			jb.setList(slideList);
			jb.setMessage("获取成功");
			jb.setStatus("200");
		} catch (Exception e) {
			jb.setMessage("服务器异常");
			jb.setStatus("500");
			e.printStackTrace();
		}
		return jb;
	}
	
	@ResponseBody
	@RequestMapping(value = "/api/demo.html")
	public JsonBeang demo(HttpServletRequest request) {
		jb = new JsonBeang();
		try {
			PageData pd = new PageData();
			List<PageData> slideList = blogSlideService.queryAllSlide(pd);
			jb.setList(slideList);
			jb.setMessage("获取成功");
			jb.setStatus("200");
		} catch (Exception e) {
			jb.setMessage("服务器异常");
			jb.setStatus("500");
			e.printStackTrace();
		}
		return jb;
	}

}
