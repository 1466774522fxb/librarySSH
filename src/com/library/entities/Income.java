package com.library.entities;

public class Income {
  private int id;
  private String borrowId;
  private float bookMoney;
  private float ticketMoney;
  private String createtime;
  private float returnMoney;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getBorrowId() {
	return borrowId;
}
public void setBorrowId(String borrowId) {
	this.borrowId = borrowId;
}
public float getBookMoney() {
	return bookMoney;
}
public void setBookMoney(float bookMoney) {
	this.bookMoney = bookMoney;
}
public float getTicketMoney() {
	return ticketMoney;
}
public void setTicketMoney(float ticketMoney) {
	this.ticketMoney = ticketMoney;
}
public String getCreatetime() {
	return createtime;
}
public void setCreatetime(String createtime) {
	this.createtime = createtime;
}
public float getReturnMoney() {
	return returnMoney;
}
public void setReturnMoney(float returnMoney) {
	this.returnMoney = returnMoney;
}
public Income(String borrowId, float bookMoney, float ticketMoney, float returnMoney,String createtime) {
	super();
	this.borrowId = borrowId;
	this.bookMoney = bookMoney;
	this.ticketMoney = ticketMoney;
	this.createtime = createtime;
	this.returnMoney=returnMoney;
}
public Income() {
	super();
}
  
}
