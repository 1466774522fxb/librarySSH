package com.library.actions;

import java.awt.print.Book;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.library.entities.Books;
import com.library.entities.Trade;
import com.library.entities.User;
import com.library.service.BooksService;
import com.library.service.TradeService;
import com.library.utils.DateSum;
import com.library.utils.PageView;

public class TradeAction implements RequestAware{
   private TradeService tradeService;
   private BooksService booksService;
   private Map<String,Object> request;
   private InputStream inputStream;
   private String ISBN;
   private String returnDate;
   private int count;
   private float money;
   private String phone;
   private String address;
   private String reMarks;
   private String number;
   private int month;
   private int cheap;
   private int page;
   SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	 }
	public void setBooksService(BooksService booksService) {
		this.booksService = booksService;
	}
   public void setISBN(String ISBN) {
	this.ISBN = ISBN;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setReMarks(String reMarks) {
		this.reMarks = reMarks;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public void setCheap(int cheap) {
		this.cheap = cheap;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String List(){
		   request .put("trade", tradeService.getAll());
		   return "list";
	}
	 
	  /*下订单*/
   public String add() throws UnsupportedEncodingException{
	  Date date=new Date();
	  String number=String.valueOf(date.getTime())+"2";
	  Books books=new Books();
	  books.setISBN(ISBN);;
	  String borrowDate=format.format(date);
	  User user=new User();
	  user.setId(2);
	  if(returnDate == null){
		 String year=borrowDate.substring(0, 4);
		 String months=borrowDate.substring(5,7);
		 String days=borrowDate.substring(8,10);
		 int monthCount=Integer.valueOf(months)+month;
		 year=String.valueOf((Integer.valueOf(months)+(monthCount/12)));
		 monthCount=monthCount%12;
		 if(monthCount<10){
			 months="0"+String.valueOf(monthCount);
		 }
		 returnDate=year+"-"+months+"-"+days;
	  }
	  if(booksService.upadateBookNum(ISBN, count)<=0){
		  inputStream=new ByteArrayInputStream("0".getBytes("UTF-8"));
	  }else{
		  tradeService.add(number, books, borrowDate, returnDate, "", money, count, user, address, phone, reMarks,cheap);
		  inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
	  }
	  return "ajax-success";
   }
   /*
    * 显示个人订单*/
   public String Bill(){ 
	   HttpServletRequest requests = ServletActionContext.getRequest();
		HttpSession session = requests.getSession();
	    int id=(int)session.getAttribute("ID");
	    int count=tradeService.tradeCount(id);
	    int pageNum=0;
		  if(count%6==0){
			  pageNum=count/6;
		  }else{
			  pageNum=count/6+1;
		  }
		  if(page==0) page=1;
	   request.put("tradeBill", "click");
	   request.put("tradeBillLine", "<p class='line-top'></p>");
	   request.put("trade", tradeService.findTrade(id,(page-1)*6, 6));
	   request.put("pageView",PageView.pageView("tradeBill?page=", pageNum,count,page));
	   return "bill";
   }
   
   public String inputBook() throws UnsupportedEncodingException, ParseException{
	     Date date =new Date();
	     HttpServletRequest requests = ServletActionContext.getRequest();
		 HttpSession session = requests.getSession();
	    if( tradeService.updateStatus(number,format.format(date))>0
	    		&&booksService.updateLeanCount(ISBN, count)>0
	    		&&tradeService.addIncome(number, date,session.getAttribute("ACCOUNT").toString())>0){
		  inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
	    }else{
		  inputStream=new ByteArrayInputStream("0".getBytes("UTF-8"));
	    }
	 
	   return "ajax-success";
   }
  
    /* 交易金额记录*/
   public String Income(){
	 request.put("income", tradeService.Income()) ;
	   return "income";
   }
   public String SubmitReturn() throws UnsupportedEncodingException{
	   if(tradeService.updateState(number)==1){
		  inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
	    }else{
		  inputStream=new ByteArrayInputStream("0".getBytes("UTF-8"));
	    }
	 
	   return "ajax-success";
   }
   
@Override
public void setRequest(Map<String, Object> arg0) {
	// TODO Auto-generated method stub
	this.request=arg0;
}
}
