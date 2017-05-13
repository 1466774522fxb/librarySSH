package com.library.dao;

import java.util.List;

import com.library.entities.Banner;
import com.library.entities.Type;

public class TypeDao extends BaseDao {
   public List<Type> getAll(){
	   String hql="from Type";
	   return getSession().createQuery(hql).list();
   }
   public int add(Type type){
	   getSession().save(type);
	   return 1;
   }
  public int addBanner(Banner banner){
	  getSession().save(banner);
	  return 1;
  }
  public List<Banner> bannerList(boolean isAll){
	   String hql="";
	   if(isAll){
		   hql="from Banner ";
	   }else{
		   hql="from Banner where status=1";
	   }
	  return getSession().createQuery(hql).list();
  }
  public int delBanner(int id){
	  String hql="delete from Banner where id=?";
	  return getSession().createQuery(hql).setInteger(0, id).executeUpdate();
  }
  public int bannerStatus(int id,int status){
	  String hql="update Banner set status=? where id=?";
	  return getSession().createQuery(hql).setInteger(0, status).setInteger(1,id).executeUpdate();
	  
  }
}
