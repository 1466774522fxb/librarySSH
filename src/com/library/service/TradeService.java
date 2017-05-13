package com.library.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.library.dao.IncomeDao;
import com.library.dao.TradeDao;
import com.library.dao.UserDao;
import com.library.entities.Books;
import com.library.entities.Income;
import com.library.entities.Trade;
import com.library.entities.User;
import com.library.utils.DateSum;

public class TradeService {
     private TradeDao tradeDao;
     private IncomeDao incomeDao;
     private  UserDao userDao;
     SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public void setIncomeDao(IncomeDao incomeDao) {
		this.incomeDao = incomeDao;
	}
	public void setTradeDao(TradeDao tradeDao) {
		this.tradeDao = tradeDao;
	}
     public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public List<Trade> getAll(){
    	 return tradeDao.getAll();
     }
    public void add(String number,Books books,String borrowDate,String returnDate,String trueDate,float money,int count,User user,String address,String phone,String reMarks,int cheap){
    	 Trade trade=new Trade( number, books, borrowDate, returnDate, trueDate, money, count, user, address, phone, reMarks,0,cheap);
         tradeDao.add(trade);
     }
    public List<Trade> findTrade(int userId,int offset, int pageSize){
    	return tradeDao.findTrade(userId,offset,pageSize);
    }
    public int updateStatus(String number,String trueDate){
    	return tradeDao.updateStatus(number,trueDate);
    }
    public List<Trade> findNumber(String number){
    	return tradeDao.findNumber(number);
    }
    public List<Income> Income(){
    	return incomeDao.getAll();
    }
    public int addIncome(String number,Date date,String account) throws ParseException{
       List<Trade> trades=findNumber(number);
  	   Trade trade= trades.get(0);
  	   String nowDate=format.format(date);
  	   int days= DateSum.daysBetween(trade.getBorrowDate(), trade.getReturnDate());
  	   int factDay=DateSum.daysBetween(trade.getBorrowDate(), nowDate);
  	   float money=0;
  	   float ticketMoney=0;
  	   int bookCount=trade.getCount();
  	   float price = (float) 0.2;
  	   if(trade.getCheap()==1){
  		 price=(float) 0.1;
  	   }
  	   if(factDay>days){
  		   money=(float) (bookCount*days*price);
  		   ticketMoney=(float)(bookCount*(factDay-days)*price*2);
  	   }else{
  		   money=(float) (bookCount*factDay*price);
  		   ticketMoney=0;
  	   }
  	   float returnMoney=trade.getMoney()-money-ticketMoney;
  	   if(returnMoney<0)returnMoney=0;
  	   if(incomeDao.add(new Income(number, money, ticketMoney,returnMoney, nowDate))>0){
  		   return userDao.addMonney(account, returnMoney);
  	   }else{
  		   return 0;
  	   }
    }
    public int tradeCount(int userId){
    	return tradeDao.tradeCount(userId);
    }
    public int updateState(String number){
    	return tradeDao.updateStatus(number);
    }
}
