package com.library.service;

import java.io.File;
import java.util.List;

import com.library.dao.TypeDao;
import com.library.entities.Banner;
import com.library.entities.Type;
import com.library.utils.FileUpload;

public class TypeService {
   private TypeDao typeDao;
   public void setTypeDao(TypeDao typeDao) {
	this.typeDao = typeDao;
   }
   public List<Type> getAll(){
	   return typeDao.getAll();
   }
   public boolean addType(String typeName,String time){
	  Type type=new Type(typeName,time);
	   if(typeDao.add(type)>0){
		   return true;
	   }else{
		   return false;
	   }
   }
   public boolean addBanner(File myfile,String bannerName,String bannerUrl,int status){
	   FileUpload upload=new FileUpload();
	   String img=upload.uploadFile(myfile, "public/uploads");
	   if(typeDao.addBanner(new Banner(bannerName, bannerUrl,img, status))>0){
		   return true;
	   }else{
		   return false;
	   }
   }
   public List<Banner> getBannerList(boolean isAll){
	   return typeDao.bannerList(isAll);
   }
   public boolean delBanner(int id){
	   if(typeDao.delBanner(id)>0){
		   return true;
	   }else{
		   return false;
	   }
   }
   public int updateStatus(int id,int status){
	  return typeDao.bannerStatus(id, status);
   }
}
