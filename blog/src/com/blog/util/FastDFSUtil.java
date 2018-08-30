package com.blog.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.csource.common.MyException;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.multipart.MultipartFile;


/**
 * FastDFS 上传文件到文件服务器
 * @author  panzhi
 * @date    2018年8月25日
 * @version 1.0.0
 */
public class FastDFSUtil {
	private final static Logger log=Logger.getLogger(FastDFSUtil.class);
	
	/**
	 * 通过MultipartFile的方式结合fast上传
	 * @param file  文件流
	 * @param request 
	 * @return Map<String,Object> code-返回代码, group-文件组, msg-文件路径/错误信息
	 */
	public static String saveFile(MultipartFile file,HttpServletRequest request){
		
		byte[] file_buff = null;
		String path="";
		try {
			file_buff = file.getBytes();
			//1.创建classPathResouce对象，用于加载配置文件
			ClassPathResource resource = new ClassPathResource("fdfs_client.conf");
			//2.初始化配置文件
			ClientGlobal.init(resource.getClassLoader().getResource("fdfs_client.conf").getPath());
			//3.获取跟踪服务器的客户端 
			TrackerClient trackerClient = new TrackerClient();
			//4.通过跟踪服务器的客户端获取服务端 
			TrackerServer trackerServer = trackerClient.getConnection();
			//5通过跟踪服务器的服务端获取存储服务器的客户端 
			StorageClient1 storageClient1 = new StorageClient1(trackerServer,null);
			//6.将附件上传至FastDFS
			String  file_ext_name=FilenameUtils.getExtension(file.getName());
			path = storageClient1.upload_file1(file_buff, file_ext_name, null);
			System.out.println(">>>>>>>>>>>>>>上传路径为："+path);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return path;
	} 

}
