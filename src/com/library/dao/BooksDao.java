package com.library.dao;

import java.util.List;

import com.library.entities.Books;
import com.library.entities.Type;

public class BooksDao extends BaseDao {
  public void add(String iSBN,String bookName,String author,String publish,Type type,String createTime,int counts,int loanCount,String summary,int status,String bookImg){
  Books books=new Books(iSBN, bookName, author, publish, type,createTime, counts, loanCount,summary,status,bookImg);
	  getSession().save(books);
	  
  }
  public void delete(int id){
	  String hql="delete from Books where id=?";
	 int status= getSession().createQuery(hql).setInteger(1, id).executeUpdate();
  }
  public int updateStatus(String ISBN,int status){
	  String hql="update  Books set status=? where ISBN=?";
	 int count= getSession().createQuery(hql).setInteger(0, status)
	  .setString(1, ISBN).executeUpdate();
	 return count;
  }
  public List<Books> getAll(){
	String hql="from Books  b Left outer join fetch b.type ";
	List<Books> books= getSession().createQuery(hql).list();
	return books;
  }
  public List<Books> getBooks(int classId,int offset,int pageSize){
	  String hql="from Books  b Left outer join fetch b.type where classId=? and status=1";
	  List<Books> books= getSession().createQuery(hql).setInteger(0, classId).setFirstResult(offset).setMaxResults(pageSize).list();
	  return books;
  }
  public List<Books> getBooksId(String ISBN){
	  String hql="from Books where ISBN=?";
	  List<Books> books= getSession().createQuery(hql).setString(0, ISBN).list();
	  return books;
  }
  public int upadateBookNum(String ISBN,int counts){
	  String hql="update  Books set loanCount=loanCount+? where ISBN=? and counts>=loanCount+?";
		 int count= getSession().createQuery(hql).setInteger(0, counts)
		  .setString(1, ISBN).setInteger(2, counts).executeUpdate();
		 return count;
  }
  public int updateLeanCount(String ISBN,int counts){
	  String hql="update  Books set loanCount=loanCount-? where ISBN=? ";
		 int count= getSession().createQuery(hql).setInteger(0, counts)
		  .setString(1, ISBN).executeUpdate();
		 return count;
  }
  public List<Books> getAllPage(int offset,int pageSize,boolean isCheap){
	  String hql="";
	  if(isCheap){
		  hql="from Books  b Left outer join fetch b.type where isCheap=1 and status=1";
	  }else{
		  hql="from Books  b Left outer join fetch b.type where status=1";
	  }
	  return getSession().createQuery(hql).setFirstResult(offset).setMaxResults(pageSize).list();
  }
  public int isCheap(String ISBN,int status){
	  String hql="update Books set isCheap=? where ISBN=?";
	  return getSession().createQuery(hql).setInteger(0, status).setString(1, ISBN).executeUpdate();
  }
  public int getAllPage(boolean isCheap,int classId){
	  String hql="";
	  if(isCheap){
		  hql="select count(*) from Books  where isCheap=1 and status=1";
	  }else{
		  if(classId==0){
			  hql="select count(*) from Books where status=1";
		  }else{
			  hql="select count(*) from Books where status=1 and classId="+classId;
		  }
		 
	  }
     return ((Number)getSession().createQuery(hql).iterate().next()).intValue();
  }
}
