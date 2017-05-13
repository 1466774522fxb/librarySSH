package com.library.utils;

public class PageView {
	public static String pageView(String url,int pageNum,int count,int page){
	 String view="<div class='text-center'>"+"<ul class='pagination'>"+"<li><a> "+count+" ����¼ "+page+"/"+pageNum+"ҳ</a></li>";    
	if(page>1){
		 view+="<li><a href='"+url+1+"'>��һҳ</a></li>"+"<li><a href='"+url+(page-1)+"'>��һҳ</a></li>";
	}	
	 for(int i=1;i<=pageNum;i++){
			 if(page==i){
				 view+="<li><span class='current'>"+i+"</span></li>";
			 }else{
				 view+="<li><a href='"+url+i+"'>"+i+"</a></li>";
			 }
			
		 }
		 if(page<pageNum){
			 view+="<li><a href='"+url+(page+1)+"'>��һҳ</a></li>"+"<li><a href='"+url+pageNum+"'>���һҳ</a></li>";
		 }
	 view+="</ul></div>";
	return view;
	}
	
}
