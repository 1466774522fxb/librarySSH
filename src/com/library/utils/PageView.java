package com.library.utils;

public class PageView {
	public static String pageView(String url,int pageNum,int count,int page){
	 String view="<div class='text-center'>"+"<ul class='pagination'>"+"<li><a> "+count+" 条记录 "+page+"/"+pageNum+"页</a></li>";    
	if(page>1){
		 view+="<li><a href='"+url+1+"'>第一页</a></li>"+"<li><a href='"+url+(page-1)+"'>上一页</a></li>";
	}	
	 for(int i=1;i<=pageNum;i++){
			 if(page==i){
				 view+="<li><span class='current'>"+i+"</span></li>";
			 }else{
				 view+="<li><a href='"+url+i+"'>"+i+"</a></li>";
			 }
			
		 }
		 if(page<pageNum){
			 view+="<li><a href='"+url+(page+1)+"'>下一页</a></li>"+"<li><a href='"+url+pageNum+"'>最后一页</a></li>";
		 }
	 view+="</ul></div>";
	return view;
	}
	
}
