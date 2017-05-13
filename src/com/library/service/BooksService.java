package com.library.service;

import java.util.List;

import com.library.dao.BooksDao;
import com.library.dao.TypeDao;
import com.library.entities.Books;
import com.library.entities.Type;


public class BooksService {
     private BooksDao booksDao;
     public void setBooksDao(BooksDao booksDao) {
		this.booksDao = booksDao;
	} 
     public void add(String iSBN,String  bookName,String author,String publish,Type type,String createTime,int counts,int loanCount,String summary,int status,String bookImg){
    	booksDao.add(iSBN, bookName, author, publish,type, createTime, counts, loanCount,summary,status,bookImg);
    }
    public void delete(int id){
    	booksDao.delete(id);
    }
    public int updateStatus(String ISBN,int status){
    	int count=booksDao.updateStatus(ISBN, status);
    	return count;
    }
    public List<Books> getAll(){
    	return booksDao.getAll();
    } 
    public List<Books> getBooks(int classId,int offset,int pageSize){
    	return booksDao.getBooks(classId,offset,pageSize);
    }
    public List<Books> getBooksId(String ISBN){
    	return booksDao.getBooksId(ISBN);
    }
    public int upadateBookNum(String ISBN,int counts){
    	return booksDao.upadateBookNum(ISBN, counts);
    }
    public int updateLeanCount(String ISBN,int counts){
    	return booksDao.updateLeanCount(ISBN, counts);
    }
    public List<Books> getAllPage(int offset,int pageSize,boolean isCheap){
    	return booksDao.getAllPage(offset, pageSize,isCheap);
    }
    public int isCheap(String ISBN,int status){
    	return booksDao.isCheap(ISBN,status);
    }
    public int getAllPage(boolean isCheap,int classId){
    	return booksDao.getAllPage(isCheap,classId);
    }
}
