package com.blog.controller;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.BaseController;
import com.blog.util.UploadUtil;

/**
 * 文件删除
 * 
 * @author panzhi
 * @date 2018年9月6日
 * @version 1.0.0
 */
@Controller
@RequestMapping("/upload")
public class UploadController extends BaseController {

	@ResponseBody
	@RequestMapping("/deleteFile.html")
	public String deleteFile(HttpServletRequest request) {
		System.out.println(request.getParameter("imgUrl") + "==");
		String path = UploadUtil.rootPath(request);
		String imgUrl = request.getParameter("imgUrl");
		String dbPath = path + "/" + imgUrl;
		File file = new File(dbPath);
		if (file.exists() && file.isFile()) {
			if (file.delete()) {
				System.out.println("删除单个文件" + dbPath + "成功！");
				return "success";
			} else {
				System.out.println("删除单个文件" + dbPath + "失败！");
				return "fail";
			}
		} else {
			System.out.println("删除单个文件失败：" + dbPath + "不存在！");
			return "error";
		}

	}

}
