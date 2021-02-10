package com.portfolio.mapper;

import java.util.List;

import com.portfolio.domain.FaqVo;
import com.portfolio.domain.QnaVo;

public interface ServiceCenterMapper {
	
	// Faq
	
	public void addFaqContent(FaqVo faqVo);
	
	public int getFaqCountAll();
	
	public List<FaqVo> getFaqContents(int startRow);
	
	public FaqVo getFaqContentByNum(int num);
	
	public void updateFaqReadcount(int num);
	
	public void updateFaqContent(FaqVo faqVo);
	
	public void deleteFaqContent(int num);
	
	// Qna
	
	public void addQnaContent(QnaVo qnaVo);
	
	public int getQnaCountAll();
	
	public List<QnaVo> getQnaContents(int startRow);
	
	public List<QnaVo> getQnaContentByRef(int num);
	
	public QnaVo getQnaContentByNum(int num);
	
	public void updateQnaContent(QnaVo qnaVo);
	
	public void deleteQnaContent(int num);
}
