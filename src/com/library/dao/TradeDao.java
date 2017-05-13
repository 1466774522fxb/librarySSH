package com.library.dao;

import java.util.List;

import com.library.entities.Trade;

public class TradeDao extends BaseDao{
   public List<Trade> getAll(){
	   String hql="from Trade  t Left outer join fetch t.books  Left outer join fetch t.user";
	   return getSession().createQuery(hql).list();
   }
   public void add(Trade trade){
	   getSession().save(trade);
   }
   public List<Trade> findTrade(int userId,int offset,int pageSize){
	   String hql=" from Trade  t Left outer join fetch t.books  Left outer join fetch t.user where userId=?";
	   return getSession().createQuery(hql).setInteger(0, userId).setFirstResult(offset).setMaxResults(pageSize).list();
   }
  public int tradeCount(int userId){
	   String hql="select count(*) from Trade  where userId=?";
	   return  ((Number)getSession().createQuery(hql).setInteger(0, userId).iterate().next()).intValue();
  }
   public int updateStatus(String number,String trueDate){
	   String hql="update Trade set state=1,trueDate=? where number=?";
	   return getSession().createQuery(hql).setString(0, trueDate).setString(1, number).executeUpdate();
   }
   public List<Trade> findNumber(String number){
	   String hql="from Trade where number=?";
	  return getSession().createQuery(hql).setString(0, number).list();
   }
   public int updateStatus(String number){ //Ã·Ωªªπ‘ƒ…Í«Î
	   String hql="update Trade set state=2 where number=?";
	   return getSession().createQuery(hql).setString(0, number).executeUpdate();
   }
}
