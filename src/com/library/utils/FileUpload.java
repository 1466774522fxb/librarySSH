package com.library.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

public class FileUpload{
	private static final long serialVersionUID = 572146812454l ;
	private static final int BUFFER_SIZE = 16 * 1024 ;
	//ע�⣬�ļ��ϴ�ʱ<s:file/>ͬʱ��myFile��myFileContentType,myFileFileName��
	//����ͬʱҪ�ṩmyFileContentType,myFileFileName��set����
	private static File myFile; //�ϴ��ļ�
	private String contentType;//�ϴ��ļ�����
	private String fileName; //�ϴ��ļ���
	private static String imageFileName;
	private String caption;//�ļ�˵������ҳ�����԰�
	public void setMyFileContentType(String contentType) {
	System.out.println("�ļ����� : " + contentType);
	this .contentType = contentType;
	}
	public void setMyFileFileName(String fileName) {
	System.out.println("�ļ����� : " + fileName);
	this .fileName = fileName;
	}
	public void setMyFile(File myFile) {
	this .myFile = myFile;
	}
	public String getImageFileName() {
	return imageFileName;
	}
	public String getCaption() {
	return caption;
	}
	public void setCaption(String caption) {
	this .caption = caption;
	}
	private static void copy(File src, File dst) {
		try {
			InputStream in = null ;
			OutputStream out = null ;
			try {
				in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE);
				out = new BufferedOutputStream( new FileOutputStream(dst), BUFFER_SIZE);
				byte [] buffer = new byte [BUFFER_SIZE];
				while (in.read(buffer) > 0 ) {
				   out.write(buffer);
			    }
			} finally {
				if ( null != in) {
				   in.close();
				}
				if ( null != out) {
				   out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}
	public  String uploadFile(File myFile,String uploadPath){
		setMyFile(myFile);
		setMyFileFileName(myFile.getName());
		imageFileName = new Date().getTime() + getExtention(fileName);
		File imageFile = new File(ServletActionContext.getServletContext().getRealPath(uploadPath ) + "/" + imageFileName);
		copy(myFile, imageFile);
		return imageFileName;
	}
	/*@Override
	public String execute() {
		imageFileName = new Date().getTime() + getExtention(fileName);
		File imageFile = new File(ServletActionContext.getServletContext().getRealPath("UploadImages" ) + "/" + imageFileName);
		copy(myFile, imageFile);
		return SUCCESS;
	}*/
}
