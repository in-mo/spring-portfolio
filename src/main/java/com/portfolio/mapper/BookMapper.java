package com.portfolio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.portfolio.domain.BookVo;

public interface BookMapper {
	
	public void addBook(BookVo bookVo);
	
	public List<BookVo> getBookInfoByNum(int noNum);
	
	public BookVo getBookInfoByNumAndId(@Param("num") int num, @Param("id") String id);
	
	public List<BookVo> getBookInfoById(String id);
	
	public int updateBookInfo(BookVo bookVo);
	
	public int deleteBookInfo(int num);
}
