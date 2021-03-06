package com.blog.model;

import java.io.Serializable;
/**
 * 文章博客表
 * @author panzhi
 * @date 2017-3-15  
 * @version 1.0.0
 */
public class BlogArticle implements Serializable {
	private static final long serialVersionUID = 1033095560900286907L;
	private String id ; //文章id
	private String title; //标题
	private String image; //文章图片
	private String keyWord;//关键词
	private String remake; //文章摘要
	private String createTime; //创建时间
	private String createUserId; //创建者
	private String updateUserId; //修改者
	private String updateTime; //修改时间
	private String catCode; //文章类别
	private String  label;//标签
	private Integer browse; //浏览量
	private Integer popularity;//人气
	private String context;//内容
	private Integer top;//置顶
	private String articleName; //文章类型
	private String createUser;  //创建者
	private String isNext; //判断上一篇下一篇

	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getKeyWord() {
		return keyWord;
	}public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	public String getIsNext() {
		return isNext;
	}public void setIsNext(String isNext) {
		this.isNext = isNext;
	}
	
	public String getCreateUser() {
		return createUser;
	}public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	
	public String getArticleName() {
		return articleName;
	}public void setArticleName(String articleName) {
		this.articleName = articleName;
	}
	
	public String getId() {
		return id;
	}public void setId(String id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}public void setTitle(String title) {
		this.title = title;
	}
	
	public String getImage() {
		return image;
	}public void setImage(String image) {
		this.image = image;
	}
	
	public String getRemake() {
		return remake;
	}public void setRemake(String remake) {
		this.remake = remake;
	}
	
	public String getCreateTime() {
		return createTime;
	}public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public String getCreateUserId() {
		return createUserId;
	}public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	
	public String getUpdateUserId() {
		return updateUserId;
	}public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	
	public String getUpdateTime() {
		return updateTime;
	}public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
	public String getCatCode() {
		return catCode;
	}
	public void setCatCode(String catCode) {
		this.catCode = catCode;
	}
	public Integer getBrowse() {
		return browse;
	}public void setBrowse(Integer browse) {
		this.browse = browse;
	}
	
	public Integer getPopularity() {
		return popularity;
	}public void setPopularity(Integer popularity) {
		this.popularity = popularity;
	}
	
	public String getContext() {
		return context;
	}public void setContext(String context) {
		this.context = context;
	}
	
	public Integer getTop() {
		return top;
	}public void setTop(Integer top) {
		this.top = top;
	}
	
	@Override
	public String toString() {
		return "BlogArticle [browse=" + browse + ", context=" + context
				+ ", createTime=" + createTime + ", createUserId="
				+ createUserId + ", id=" + id + ", image=" + image
				+ ", popularity=" + popularity + ", remake=" + remake
				+ ", title=" + title + ", top=" + top + ", catCode=" + catCode
				+ ", updateTime=" + updateTime + ", updateUserId="
				+ updateUserId + "]";
	}
		
}
