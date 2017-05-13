package com.library.entities;

public class Type {
   private int id; //类型Id
   private String typeName; //类型名称
   private String time;//创建时间
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getTypeName() {
	return typeName;
}
public void setTypeName(String typeName) {
	this.typeName = typeName;
}
public Type(String typeName,String time) {
	super();
	this.typeName = typeName;
	this.time=time;
}
public Type() {
	super();
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
   
}
