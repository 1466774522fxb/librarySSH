package com.library.actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.library.entities.User;
import com.library.service.UserService;
import com.library.utils.MD5Util;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements RequestAware{
    private UserService userService;
    private Map<String, Object> request;
    private InputStream inputStream;
    public void setUserService(UserService userService) {
		this.userService = userService;
	}
    public String list(){
    	request.put("user", userService.getAll());
    	return "list";
    }
    private int id;
    private int type;
    private String account;
    private String password;
    private String name;
    private String phone;
    private String address;
    private String op;
    private String newPwd;
    private String reNewPwd;
    private float balance;
    
    public void  setId(int id){
    	this.id=id;
    }
    public void setOp(String op) {
		  this.op=op;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String getReNewPwd() {
		return reNewPwd;
	}
	public void setReNewPwd(String reNewPwd) {
		this.reNewPwd = reNewPwd;
	}
	 public void setBalance(float balance) {
			this.balance = balance;
		}
	public String delete(){
    	userService.delete(id);
    	return SUCCESS;
    }
    public String add() throws UnsupportedEncodingException{
    	List<User> users=userService.findUser(account.trim());
    	if(users.size()>0){
    		inputStream=new ByteArrayInputStream("0".getBytes("UTF-8"));
    	}else{
    		userService.add(account.trim(), name, phone, address, 0, 0, 0, MD5Util.encode(password));
    		inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
    	}
    	//inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
		return "ajax-success";
    }
    public String advs() throws UnsupportedEncodingException{
    	inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
	
	return "ajax-success";
    }
    public String login() throws UnsupportedEncodingException{
    	String status="";
    	 if(account.trim().equals("")){
    		 status="0";
	  	  }else if(password.trim().equals("")){
	  		 status="1";
	  	  }else {
	  		 List<User> users=userService.login(account, password);
	  		 if(users==null || users.size()==0){
	  			status="2";
	  		 }else{
	  			HttpServletRequest request = ServletActionContext.getRequest();
	    		HttpSession session = request.getSession();
	    		session.setAttribute("ACCOUNT", account);
	    		session.setAttribute("ID", users.get(0).getId());
	    		if( users.get(0).getType()==1){
	    			status="4";
	    		}else{
	    			status="3";
	    		}
	    		
	  	     }
	  	  }
    	inputStream=new ByteArrayInputStream(status.getBytes("UTF-8"));
		return "ajax-success";
    }
    public String logOut(){
    	HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("ACCOUNT");
		session.removeAttribute("ID");
		return "logout";
    }
    public String statusNo() throws UnsupportedEncodingException{
    	if(userService.updateStatus(id, 1)){
    	inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
    	}else{
    		inputStream=new ByteArrayInputStream("0".getBytes("UTF-8"));
    	}
    	return "ajax-success";
    }
    public String statusOk() throws UnsupportedEncodingException{
    	if(userService.updateStatus(id, 0)){
        	inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
        }else{
        	inputStream=new ByteArrayInputStream("0".getBytes("UTF-8"));
        		
        }
        return "ajax-success";
    }
   
	public String Center(){
		request.put("userCenter", "click");
		request.put("userCenterLine", "<p class='line-top'></p>");
		HttpServletRequest requests = ServletActionContext.getRequest();
		HttpSession session = requests.getSession();
    	if(op==null||op.equals("info")){
    		request.put("user",userService.findUser((String)session.getAttribute("ACCOUNT")));
    		request.put("op", 1);
    	}else if(op.equals("alter")){
    		request.put("user",userService.findUser((String)session.getAttribute("ACCOUNT")));
    		request.put("op", 2);
    	}else if(op.equals("recharge")){
    		request.put("op", 3);
    	}else if(op.equals("pwd")){
    		request.put("op", 4);
    	}
    	
    	return "center";
    }
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public String password() throws UnsupportedEncodingException{
		HttpServletRequest requests = ServletActionContext.getRequest();
		HttpSession session = requests.getSession();
		String status=userService.alterPassword((String)session.getAttribute("ACCOUNT"), password, newPwd, reNewPwd);
        inputStream=new ByteArrayInputStream(status.getBytes("UTF-8"));
		return "ajax-success";
	}
	public String  balance( ) throws UnsupportedEncodingException {
		HttpServletRequest requests = ServletActionContext.getRequest();
		HttpSession session = requests.getSession();
		String status=userService.addMonney((String)session.getAttribute("ACCOUNT"), balance);
		inputStream=new ByteArrayInputStream(status.getBytes("UTF-8"));
		return "ajax-success";
	}
	public String info() throws UnsupportedEncodingException{
		HttpServletRequest requests = ServletActionContext.getRequest();
		HttpSession session = requests.getSession();
		String status=userService.alterInfo(name, phone, address, (String)session.getAttribute("ACCOUNT"));
		inputStream=new ByteArrayInputStream(status.getBytes("UTF-8"));
		return "ajax-success";
	}
   
}
