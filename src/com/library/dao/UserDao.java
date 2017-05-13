package com.library.dao;

import java.io.InputStream;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.library.entities.User;

public class UserDao {
	
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
    public Session getSession(){
    	return this.sessionFactory.getCurrentSession();
    }
    public void delete(int id){
    	String hql="delete from User where id=?";
    	getSession().createQuery(hql).setInteger(0, id).executeUpdate();
    }
    public List<User> getAll(){
    	//String hql="from User u Left outer join fetch u.department";
    	String hql="from User where type!=1";
    	return getSession().createQuery(hql).list();
    	
    }
    public void add(String account,String phone,String address,float balance,int grade,int type ,String name,String password){
    	User user =new User(account,name,phone,address,balance,grade,type, password);
    	getSession().save(user);
    }
    public int updateStatus(int id,int status){
    	String hql="update User set status=? where id=?";
    	return getSession().createQuery(hql).setInteger(0,status).setInteger(1,id)
    			.executeUpdate();
    }
    public List<User> findUser(String account,String password){
    	String hql="from User where account=? and password=?";
    	return getSession().createQuery(hql).setString(0,account).setString(1, password).list();
    }
    
    public  int alterPassword(String account ,String password,String newPwd){
    	String hql="update User set password=? where password=? and  account =?";
    	return getSession().createQuery(hql).setString(0,newPwd)
    			                             .setString(1, password)
    			                             .setString(2, account).executeUpdate();
    }
    public int addMonney(String account,float balance){
    	System.out.println(balance+">>>>>>>>>>>"+account);
    	String hql="update User set balance=balance+? where account =?";
    	return getSession().createQuery(hql).setFloat(0, balance)
                .setString(1, account).executeUpdate();
    }
    public int alterInfo(String name,String phone,String address,String account){
    	String hql="update User set name=?,phone=?,address=? where account=?";
    	return getSession().createQuery(hql).setString(0, name)
                .setString(1, phone).setString(2, address).setString(3, account).executeUpdate();
    }
    public List<User> findOne(String account){
    	String hql="from User where account=?";
    	return getSession().createQuery(hql).setString(0,account).list();
    }
    
}
