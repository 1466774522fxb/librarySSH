package com.library.entities;

public class Books {
   private int id;//ID
   private String ISBN; //编号
   private String bookName;//书名
   private String author; //作者
   private String publish; //出版社
   private Type type; //类型
   private String createTime; //出版日期
   private int counts;//总数量
   private int loanCount;//借出数量
   private String summary;//简介
   private int status;//书的状态 0表示下架 ，1上架
   private String  bookImg;  //图书图片
   private int classId; //分类Id
   private int isCheap; //优惠
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getISBN() {
	return ISBN;
}
public void setISBN(String iSBN) {
	ISBN = iSBN;
}
public String getBookName() {
	return bookName;
}
public void setBookName(String bookName) {
	this.bookName = bookName;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getPublish() {
	return publish;
}
public void setPublish(String publish) {
	this.publish = publish;
}

public String getCreateTime() {
	return createTime;
}
public Type getType() {
	return type;
}
public void setType(Type type) {
	this.type = type;
}
public void setCreateTime(String createTime) {
	this.createTime = createTime;
}
public int getCounts() {
	return counts;
}
public void setCounts(int counts) {
	this.counts = counts;
}
public int getLoanCount() {
	return loanCount;
}
public void setLoanCount(int loanCount) {
	this.loanCount = loanCount;
}
public String getSummary() {
	return summary;
}
public void setSummary(String summary) {
	this.summary = summary;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public String getBookImg() {
	return bookImg;
}
public void setBookImg(String bookImg) {
	this.bookImg = bookImg;
}
public int getClassId() {
	return classId;
}
public void setClassId(int classId) {
	this.classId = classId;
}
public int getIsCheap() {
	return isCheap;
}
public void setIsCheap(int isCheap) {
	this.isCheap = isCheap;
}
public Books(String iSBN, String bookName, String author, String publish,Type type, String createTime, int counts,
		int loanCount,String summary,int status,String bookImg) {
	super();
	ISBN = iSBN;
	this.bookName = bookName;
	this.author = author;
	this.publish = publish;
	this.type=type;
	this.createTime = createTime;
	this.counts = counts;
	this.loanCount = loanCount;
	this.summary=summary;
	this.status=status;
	this.bookImg=bookImg;
}
public Books() {
	super();
}
}
