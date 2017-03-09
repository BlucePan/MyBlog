package com.blog.util;

import java.util.List;

/**
 * 
 * 分页封装函数
 * @author: zhaoxh
 * @date: 2016-6-14
 * @Email: 1005841581@qq.com
 * @version: 1.0V
 */

public class PageView {

	private int pageSize = 5;//每页显示记录数 
	
	private List<?> items;
	
	private int totalCount; //总记录数     

	private int totalPage;//总页数 
	
	private int currentPage;//当前页
    
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<?> getItems() {
		return items;
	}

	public void setItems(List<?> items) {
		this.items = items;
	}

	public int getTotalCount() {
		return totalCount;
	}


    public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		
		if (totalCount % this.pageSize == 0) {
			this.totalPage = totalCount / this.pageSize;
		} else {
			this.totalPage = totalCount / this.pageSize + 1;
		}
		return this.totalPage;
	}

	public int getStart(){
		if (currentPage>getTotalPage()) currentPage=1;
		return (currentPage-1)*pageSize;
		
	}
	
	/**
	 * 分页导航
	 * @return
	 */
	public String  getPagerStr(StringBuffer buffer) {
		StringBuilder sb=new StringBuilder();
		
		int pageCount=getTotalPage();//总页数
		int a_total=5;      //分页条中有多少个超链接
		sb.append("<li>共"+totalCount+"条数据    ");
		
		if(pageCount>0){
			sb.append(" 页次"+currentPage+"/"+pageCount+"页");
		}
		sb.append("</li>");
		if(totalCount>0){
			int a_padding=(int)Math.ceil(a_total/2);  //中间的那个超链接距离边缘链接的间隔a的个数 例如：共11个分页 那么这个就是5

			if(pageCount-currentPage<=a_padding&&currentPage>a_padding+1)
			{
				a_padding=a_total-(pageCount-currentPage);
			}

			int start=currentPage-a_padding,
			end=start+a_total;
			if(buffer.length()>0){
				if(currentPage-1>0){
					sb.append("<li><a href=?page=1"+buffer+">首页</a></li>");
					sb.append("<li><a href=?page="+(currentPage-1)+buffer+">上一页</a></li>");
				}
				if(pageCount>0){
					for (int i = start; i <=end; i++) {
						
						if(i<=0){end+=Math.abs(i);i=1;	}
						sb.append(" <li><a href=?page="+i+buffer+" "+(i==currentPage?"class=\"thisclass\"":"")+"> "+i+"</a></li>");
				
						if(i==pageCount){break;}
			
					}
				}
				
		
				if(currentPage-pageCount<0){
					sb.append("<li><a href=?page="+(currentPage+1)+buffer+">下一页</a></li>");
					sb.append("<li><a href=?page="+pageCount+buffer+">尾页</a></li>");
				}
			}else{
				if(currentPage-1>0){
					sb.append("<li><a href=?page=1>首页</a></li>");
					sb.append("<li><a href=?page="+(currentPage-1)+">上一页</a></li>");
				}

				for (int i = start; i <=end; i++) {

					if(i<=0){end+=Math.abs(i);i=1;	}
					sb.append("<li><a href=?page="+i+" "+(i==currentPage?" class=\"thisclass\"":"")+">"+i+"</a></li>");
			
					if(i==pageCount){break;}

				}

				if(currentPage-pageCount<0){
					sb.append("<li><a href=?page="+(currentPage+1)+">下一页</a></li>");
					sb.append("<li><a href=?page="+pageCount+">尾页</a></li>");
				}
			}
		}
		
		return sb.toString();
		
		
	}
    
}
