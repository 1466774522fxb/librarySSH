package com.library.entities;

public class Banner {
	private int id;
	private String url;
	private int status;
	private String name;
	private String img;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Banner(String name, String url, String img,int status) {
		super();
		this.url = url;
		this.status = status;
		this.name = name;
		this.img=img;
	}
	public Banner(){
		super();
	}
}
