package com.blog.model;

import java.io.Serializable;

public class BlogMenu implements Serializable {
	private String id;  //菜单id
	private String menuName;  //菜单名称
	private String resKey;  //资源KEY
	private String url;//菜单方法链接
	private String menuType;//菜单类型  1、目录  2、菜单  3、按钮
	private String priority;//菜单排序  1、2、3、4、5、6....
	private String superior;//上级菜单
	private String createTime;
	private String createUserId;
	private String updateTime;
	private String updateUserId;
	private String flag;   //1、启用、2禁用
	private String remake; //菜单描述
	private String iScommon;  // 是否公共菜单   yes  no
	private String imgUrl;//菜单图片链接
	
	private String    superiorName; //上级名称
	
	
	public String getSuperiorName() {
		return superiorName;
	}
	public void setSuperiorName(String superiorName) {
		this.superiorName = superiorName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getResKey() {
		return resKey;
	}
	public void setResKey(String resKey) {
		this.resKey = resKey;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getSuperior() {
		return superior;
	}
	public void setSuperior(String superior) {
		this.superior = superior;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getRemake() {
		return remake;
	}
	public void setRemake(String remake) {
		this.remake = remake;
	}
	public String getiScommon() {
		return iScommon;
	}
	public void setiScommon(String iScommon) {
		this.iScommon = iScommon;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	@Override
	public String toString() {
		return "BlogMenu [createTime=" + createTime + ", createUserId="
				+ createUserId + ", flag=" + flag + ", iScommon=" + iScommon
				+ ", id=" + id + ", imgUrl=" + imgUrl + ", menuName="
				+ menuName + ", menuType=" + menuType + ", priority="
				+ priority + ", remake=" + remake + ", resKey=" + resKey
				+ ", superior=" + superior + ", updateTime=" + updateTime
				+ ", updateUserId=" + updateUserId + ", url=" + url + "]";
	}

	


}
