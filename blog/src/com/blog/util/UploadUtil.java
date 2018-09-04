package com.blog.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MultipartFile;
/**
 * 
 * 附件上传
 * 
 * @author zhaoxh
 * @CreateTime 2016-5-20
 * @Email 100581581@qq.com
 * @version 1.0V
 */
public class UploadUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadUtil() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");  
        response.setContentType("text/html; charset=UTF-8");  
        PrintWriter out = response.getWriter();  
          
        //文件保存目录路径  
       String savePath = rootPath(request);
       //System.out.println("图片存储物理路径"+savePath);
        // 临时文件目录   
        String tempPath = dirTemp(request);  
          
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");  
        String ymd = sdf.format(new Date());  
        savePath += "/" + ymd + "/";  
        //创建文件夹  
        File dirFile = new File(savePath);  
        if (!dirFile.exists()) {  
            dirFile.mkdirs();  
        }  
          
        tempPath += "/" + ymd + "/";  
        //创建临时文件夹  
        File dirTempFile = new File(tempPath);  
        if (!dirTempFile.exists()) {  
            dirTempFile.mkdirs();  
        }  
          
        DiskFileItemFactory  factory = new DiskFileItemFactory();  
        factory.setSizeThreshold(20 * 1024 * 1024); //设定使用内存超过5M时，将产生临时文件并存储于临时目录中。     
        factory.setRepository(new File(tempPath)); //设定存储临时文件的目录。     
        ServletFileUpload upload = new ServletFileUpload(factory);  
        upload.setHeaderEncoding("UTF-8");  
        try {  
            List items = upload.parseRequest(request);  
           // System.out.println("items = " + items);  
            Iterator itr = items.iterator();  
              
            while (itr.hasNext())   
            {  
                FileItem item = (FileItem) itr.next();  
                String fileName = item.getName();  
                long fileSize = item.getSize();  
                if (!item.isFormField()) {  
                    String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();  
                    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");  
                    String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;  
                    try{  
                        File uploadedFile = new File(savePath, newFileName);  
                        
                        OutputStream os = new FileOutputStream(uploadedFile);  
                        InputStream is = item.getInputStream();  
                        byte buf[] = new byte[1024];//可以修改 1024 以提高读取速度  
                        int length = 0;    
                        while( (length = is.read(buf)) > 0 ){    
                            os.write(buf, 0, length);    
                        }    
                        //关闭流    
                        os.flush();  
                        os.close();    
                        is.close();    
                        System.out.println("上传成功！磁盘存储路径："+savePath+newFileName);  
                        //System.out.println("上传成功！数据库存储路径："+ymd+"/"+newFileName);
                        out.print(ymd+"/"+newFileName);
                    }catch(Exception e){  
                        e.printStackTrace();  
                    }  
                }         
            }   
              
        } catch (FileUploadException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        out.flush();  
        out.close(); 
	}
	
	public static String rootPath(HttpServletRequest request){
		//图片服务器存储物理路径  E:/apache-tomcat-7.0.32/webapps/imageService
		System.out.println(request.getParameter("context"));
		System.out.println(request);
		System.out.println(request.getSession());
		String path=request.getSession().getServletContext().getRealPath("uploadFiles").replace("blog", "imageService");

		return path;
		
	} 
	
	public static String dirTemp(HttpServletRequest request){
		//临时文件路径
		String path=request.getSession().getServletContext().getRealPath("temFiles").replace("blog", "imageService");

		return path;
		
	} 
	public static String saveFile(MultipartFile file,HttpServletRequest request){

        String fileName = file.getOriginalFilename();  //获取图片的文件名
        String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase(); // 获取图片的扩展名
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");  
        String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + extensionName; //新的图片文件名 = 获取时间戳+"_"图片扩展名
		
		String savePath = rootPath(request);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");  
        String ymd = sdf.format(new Date());  
        savePath += "/" + ymd + "/";  
        //创建文件夹  
        File dirFile = new File(savePath);  
        if (!dirFile.exists()) {  
            dirFile.mkdirs();  
        }
        try {
            FileOutputStream out = new FileOutputStream(savePath + "/"
                    + newFileName);
            // 写入文件
            out.write(file.getBytes());
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return ymd+"/"+newFileName;
		
	} 
}
