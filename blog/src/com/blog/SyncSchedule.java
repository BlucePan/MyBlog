package com.blog;


import com.blog.util.BlogUtil;
import java.util.Date;



public class SyncSchedule {
	private boolean syncing = false;
	
	
	
	@SuppressWarnings("deprecation")
	public void doSchedule() throws Exception {
		Date date = BlogUtil.getDateTime();
		if ((date.getHours() == 15) && (date.getMinutes() == 25) && (date.getSeconds() == 0) && (!this.syncing)) {
			System.out.println("----------------------------------------------");
		      this.syncing = true;
		      this.syncing = false;
		}
	}
	
	//测试定时器
	public void springTask(){
		System.out.println("测试定时器行不行");
	}

	
}
