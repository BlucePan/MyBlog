package com.blog.util;

public class SplitUtil {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String a="abc,dasdas,dsadasdasd";
		   String [] m=a.split(",");
		   System.out.println("----"+m.length);
		   for (int i = 0; i < m.length; i++) {
			System.out.println(m[i]);
		}
	}

}
