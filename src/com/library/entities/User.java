package com.library.entities;

public class User {
  private int id;  //Id
  private String account;  //用户名
  private String name;     //姓名
  private String phone;   //电话
  private String address; //地址
  private float balance;  //余额
  private int grade;      //等级
  private int type;      //类型 如：会员，管理员
  private String password; //密码
  private int status;//状态 0：禁用 1：正常
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public float getBalance() {
	return balance;
}
public void setBalance(float balance) {
	this.balance = balance;
}
public int getGrade() {
	return grade;
}
public void setGrade(int grade) {
	this.grade = grade;
}
public int getType() {
	return type;
}
public void setType(int type) {
	this.type = type;
}
public User() {
	super();
}
public User(String account, String name, String phone, String address, float balance, int grade, int type,
		String password) {
	super();
	this.account = account;
	this.name = name;
	this.phone = phone;
	this.address = address;
	this.balance = balance;
	this.grade = grade;
	this.type = type;
	this.password = password;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
}
