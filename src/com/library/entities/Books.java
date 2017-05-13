package com.library.entities;

public class Books {
   private int id;//ID
   private String ISBN; //���
   private String bookName;//����
   private String author; //����
   private String publish; //������
   private Type type; //����
   private String createTime; //��������
   private int counts;//������
   private int loanCount;//�������
   private String summary;//���
   private int status;//���״̬ 0��ʾ�¼� ��1�ϼ�
   private String  bookImg;  //ͼ��ͼƬ
   private int classId; //����Id
   private int isCheap; //�Ż�
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
