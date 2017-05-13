package com.library.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.library.entities.User;

public class BaseDao {
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
    public Session getSession(){
    	return this.sessionFactory.getCurrentSession();
    }
   
}
