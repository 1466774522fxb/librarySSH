package com.library.service;

import java.util.List;

import com.library.dao.UserDao;
import com.library.entities.User;
import com.library.utils.MD5Util;

public class UserService {
   private UserDao userDao;
   public void setUserDao(UserDao userDao) {
	this.userDao = userDao;
   }
   public void delete(int id){
	   userDao.delete(id);
   }
   public List<User> getAll(){
	   return userDao.getAll();
   }
   public void add(String account,String name,String phone,String address,float balance,int grade,int type,String password){
	   userDao.add(account, phone, address, balance, grade, type, name, password);
   }
   public List<User> login(String account,String password){
	   return userDao.findUser(account, MD5Util.encode(password));
   }
   public boolean updateStatus(int id,int status){
	   int count=userDao.updateStatus(id, status);
	   if(count>0){
		   return true;
	   }else{
		   return false;
	   }
   }
   public String alterPassword(String account,String password,String newPwd,String reNewPwd){
	  if(password.trim().equals("")
			  ||newPwd.trim().equals("")||reNewPwd.trim().equals("")){
		  return "0";  //ÃÜÂë²»ÄÜÎª¿Õ
	  }else if(!newPwd.endsWith(reNewPwd)){
		  return "1";  
	  }else if(userDao.alterPassword(account, MD5Util.encode(password),  MD5Util.encode(newPwd))>0){
		  return "2";
	  }else{
		  return "3";
	  }
   }
   public String addMonney(String account,float balance){
	   if(balance<=0){
		   return "0";
	   }else if(userDao.addMonney(account, balance)>0){
		   return "1";
	   }else{
		   return "2";
	   }
   }
   public String alterInfo(String name,String phone,String address,String account){
	   if(userDao.alterInfo(name, phone, address, account)>0){
		   return "1";
	   }else{
		   return "0";
	   }
   }
   public List<User> findUser(String account){
	   return userDao.findOne(account);
   }
}
