 package com.library.actions;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.library.entities.Type;
import com.library.service.BooksService;
import com.library.service.TypeService;
import com.library.service.UserService;
import com.library.utils.FileUpload;
import com.library.utils.PageView;

public class BooksAction implements RequestAware{
  private BooksService booksService;
  private TypeService typeService;
  private InputStream inputStream;
  private Map<String, Object> request;
  private int id;
  private String ISBN;
  private String bookName;
  private String author;
  private String publish;
  private Type type;
  private String createTime;
  private int counts;
  private String summary;
  private int status;
  private int classId;
  private File myFile;
  private UserService userService;
  private int page;
  public void setPage(int page) {
	this.page = page;
  }

  public void setBooksService(BooksService booksService) {
	this.booksService = booksService;
  }
  public void setTypeService(TypeService typeService) {
	this.typeService = typeService;
  }
  public void setUserService(UserService userService) {
	this.userService = userService;
  }
  public String List(){
	 request.put("books", booksService.getAll());
	 return "list";
  }
  public void setId(int id) {
	this.id = id;
  }
  public void setISBN(String ISBN) {
		this.ISBN = ISBN;
  }
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public void setSummary(String summary) {
			this.summary = summary;
	}
	public InputStream getInputStream() {
		return inputStream;
	}

public String Add(){
	 FileUpload upLoad=new FileUpload();
	 String bookImg=upLoad.uploadFile(myFile, "public/uploads");
	 Type type=new Type();
	 type.setId(classId);
	 booksService.add(ISBN, bookName, author, publish,type, createTime, counts, 0,summary,status,bookImg);
	 return "add";
  }
  public String Up(){ //ио╪э
	int count= booksService.updateStatus(ISBN, 1);
	 if(count>0){
		 return "update";
	 }else{
		 return "fail";
	 }
  }
  public String Down(){
	  int count= booksService.updateStatus(ISBN, 0);
		 if(count>0){
			 return "update";
		 }else{
			 return "fail";
		 }
  }
  public String Class(){
	  request.put("booksClass", "click");
	  request.put("booksClassLine", "<p class='line-top'></p>");
	  request.put("type", typeService.getAll());
	  int count=booksService.getAllPage(false,classId);
	  int pageNum=0;
	  if(count%6==0){
		  pageNum=count/6;
	  }else{
		  pageNum=count/6+1;
	  }
	  if(page==0) page=1;
	  if(classId==0){
		  request.put("bookType", 0);
		  request.put("bookCounts", count);
		  request.put("books",  booksService.getAllPage((page-1)*6, 6,false));
	  }else{
		  request.put("bookType",classId);
		  request.put("books", booksService.getBooks(classId,(page-1)*6, 6));
	  }
	  request.put("pageView",PageView.pageView("booksClass?classId="+classId+"&page=", pageNum,count,page));
	  return "class";
  }
  public String Cheap(){
	  int count=booksService.getAllPage(true,0);
	  int pageNum=0;
	  if(count%9==0){
		  pageNum=count/9;
	  }else{
		  pageNum=count/9+1;
	  }
	  if(page==0) page=1;
	  request.put("booksCheap", "click");
	  request.put("booksCheapLine", "<p class='line-top'></p>");
	  request.put("books", booksService.getAllPage((page-1)*9, 9,true));
	  request.put("pageView",PageView.pageView("booksClass?page=", pageNum,count,page));
	  return "cheap";
  }
  public String isCheap() throws UnsupportedEncodingException{
	  if(booksService.isCheap(ISBN,1)>0){
		  inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
	  }else{
		  inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
	  }
	  return "ajax-success";
  }
  public String common() throws UnsupportedEncodingException{
	  if(booksService.isCheap(ISBN,0)>0){
		  inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
	  }else{
		  inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
	  }
	  return "ajax-success";
  }
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request=arg0;
	}
	public String Borrow(){
		HttpServletRequest requests = ServletActionContext.getRequest();
		HttpSession session = requests.getSession();
		String accunt=session.getAttribute("ACCOUNT").toString();
		 request.put("user",userService.findUser(accunt));
		 request.put("books", booksService.getBooksId(ISBN));
		return "borrow";
	}
}
