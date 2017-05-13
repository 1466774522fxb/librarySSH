package com.library.dao;

import java.util.List;

import com.library.entities.Income;

public class IncomeDao extends BaseDao{
   public int add(Income income){
	   getSession().save(income);
	   return 1;
   }
   public List<Income> getAll(){
	   String hql="from Income order by createtime desc";
	   return getSession().createQuery(hql).list();
   }
}
