package com.library.actions;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.library.service.TypeService;

public class TypeAction implements RequestAware {
    private TypeService typeService;
    private InputStream inputStream;
    private int id;
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private Map<String, Object> request;
	private String typeName;
	private String bannerName;
	private String bannerUrl;
	private File myFile;
	private int status;
	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	
	public void setBannerName(String bannerName) {
		this.bannerName = bannerName;
	}
	public void setBannerUrl(String bannerUrl) {
		this.bannerUrl = bannerUrl;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String list(){
		request.put("types",typeService.getAll());
		return "list";
	}
	public String add(){
		String time=format.format(new Date());
		if(typeService.addType(typeName, time)){
			return "add";
		}else{
			return "fail";
		}
		
	}
	public String addPage(){
		request.put("types",typeService.getAll());
		return "page";
	  }
   public String Banner(){
	   request.put("banner", typeService.getBannerList(true));
	   return "banner";
   }
   public String addBanner(){
	  if(typeService.addBanner(myFile,bannerName, bannerUrl, status)){
		  return "addBanner";
	  }
	  return "addBanner";
   }
   public String del_Banner() throws UnsupportedEncodingException{
	   if(typeService.delBanner(id)){
		   inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
	   }else{
		   inputStream=new ByteArrayInputStream("0".getBytes("UTF-8"));
	   }
	   return "ajax-success";
   }
   public String home(){
	   request.put("home", "click");
	   request.put("homeLine", "<p class='line-top'></p>");
	   request.put("banner", typeService.getBannerList(false));
	   request.put("type", typeService.getAll());
	   return "home";
   }
   public String stop_Banner() throws UnsupportedEncodingException{
	  System.out.println(">>>>>>>"+id);
	   int state=typeService.updateStatus(id, 0);
	   System.out.println(">>>>sdfasf>>>"+id);
	   inputStream=new ByteArrayInputStream(String.valueOf(state).getBytes("UTF-8"));
        return "ajax-success";
   }
   public String open_Banner() throws UnsupportedEncodingException{
	   int state=typeService.updateStatus(id, 1);
	  
	    inputStream=new ByteArrayInputStream(String.valueOf(state).getBytes("UTF-8"));
        return "ajax-success";
   }
}
