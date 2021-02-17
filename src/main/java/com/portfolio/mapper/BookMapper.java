package com.portfolio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.portfolio.domain.BookVo;

public interface BookMapper {
	
	public void addBook(BookVo bookVo);
	
	public BookVo getBookInfo(int num);
	
	public List<BookVo> getBookInfoByNum(int noNum);
	
	public BookVo getBookInfoByNumAndId(@Param("num") int num, @Param("id") String id);
	
	public List<BookVo> getBookInfoById(String id);
	
	public BookVo getBookInfoByIdAndNoNum(@Param("id") String id, @Param("noNum") int noNum);
	
	public int updateBookInfo(BookVo bookVo);
	
	public int deleteBookInfo(int num);
	
	public int deleteBookById(String id);
	
	public int deleteBookByNoNum(int noNum);
}
