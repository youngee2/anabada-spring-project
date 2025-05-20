package com.example.demo.utils;

public class BoardPage {
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		String pagingStr ="";
		int totalPages = (int) (Math.ceil(((double)totalCount/pageSize)));
		
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;
		
		if(pageTemp !=1) {
			pagingStr += "<a href='"+reqUrl+"?pageNum=1'> << </a>";
			pagingStr += "&nbsp;&nbsp;";
			pagingStr += "<a href='" + reqUrl +"?pageNum="+(pageTemp -1)+"'> 이전 </a>";
		}
		
		int blockCount = 1;
		
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				pagingStr += "&nbsp;"+pageTemp+"&nbsp;";
			}else {
				pagingStr += "&nbsp;<a href='"+reqUrl+"?pageNum="+pageTemp+"'>"+pageTemp+"</a>&nbsp;";
				
			}
			pageTemp ++;
			blockCount ++;
		}
		
		if(pageTemp<=totalPages) {
			pagingStr +="<a href ='"+reqUrl+"?pageNum="+pageTemp+"'> 다음 </a>";
			pagingStr += "&nbsp;&nbsp;";
			pagingStr +="<a href='"+reqUrl+"?pageNum="+totalPages+"'> >> </a>";
		}
		
		
		
		return pagingStr;
	}
	
}
