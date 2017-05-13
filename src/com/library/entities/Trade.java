package com.library.entities;

public class Trade {
      private int id; //Id
      private String number; //交易编号
      private Books books; //图书
      private String borrowDate; //借书日期
      private String returnDate; //应还日期
      private String trueDate;  //实还日期
      private float money;     //押金
      private int count;
      private User user;   //会员
      private String sendAddress;
      private String sendPhone;
      private String reMarks;
      private int cheap;//优惠  0:无     1:有
      private int state;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Books getBooks() {
		return books;
	}
	public void setBooks(Books books) {
		this.books = books;
	}
	public String getBorrowDate() {
		return borrowDate;
	}
	public void setBorrowDate(String borrowDate) {
		this.borrowDate = borrowDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getTrueDate() {
		return trueDate;
	}
	public void setTrueDate(String trueDate) {
		this.trueDate = trueDate;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getSendAddress() {
		return sendAddress;
	}
	public void setSendAddress(String sendAddress) {
		this.sendAddress = sendAddress;
	}
	public String getSendPhone() {
		return sendPhone;
	}
	public void setSendPhone(String sendPhone) {
		this.sendPhone = sendPhone;
	}
	
	public String getReMarks() {
		return reMarks;
	}
	public void setReMarks(String reMarks) {
		this.reMarks = reMarks;
	}
	public int getCheap() {
		return cheap;
	}
	public void setCheap(int cheap) {
		this.cheap = cheap;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Trade( String number, Books books, String borrowDate, String returnDate, String trueDate, float money,
			int count, User user, String sendAddress, String sendPhone, String reMarks,int state,int cheap) {
		super();
		this.number = number;
		this.books = books;
		this.borrowDate = borrowDate;
		this.returnDate = returnDate;
		this.trueDate = trueDate;
		this.money = money;
		this.count = count;
		this.user = user;
		this.sendAddress = sendAddress;
		this.sendPhone = sendPhone;
		this.reMarks = reMarks;
		this.state=state;
		this.cheap=cheap;
	}
	public Trade() {
		super();
	}
}
