package com.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.portfolio.domain.FaqVo;
import com.portfolio.domain.QnaVo;
import com.portfolio.mapper.ServiceCenterMapper;

@Service
public class ServiceCenterSerivce {

	@Autowired
	private ServiceCenterMapper serviceCenterMapper;
	
	// faq
	
	public void addFaqContent(FaqVo faqVo) {
		serviceCenterMapper.addFaqContent(faqVo);
	}
	
	public List<FaqVo> getFaqContents(int startRow) {
		return serviceCenterMapper.getFaqContents(startRow);
	}
	
	public int getFaqCountAll() {
		return serviceCenterMapper.getFaqCountAll();
	}
	
	public FaqVo getFaqContentByNum(int num) {
		return serviceCenterMapper.getFaqContentByNum(num);
	}
	
	public void updateFaqReadcount(int num) {
		serviceCenterMapper.updateFaqReadcount(num);
	}
	
	public void updateFaqContent(FaqVo faqVo) {
		serviceCenterMapper.updateFaqContent(faqVo);
	}
	
	public void deleteFaqContent(int num) {
		serviceCenterMapper.deleteFaqContent(num);
	}
	
	// Qna
	
	public void addQnaContent(QnaVo qnaVo) {
		serviceCenterMapper.addQnaContent(qnaVo);
	}
	
	public List<QnaVo> getQnaContents(int startRow) {
		return serviceCenterMapper.getQnaContents(startRow);
	}
	
	public int getQnaCountAll() {
		return serviceCenterMapper.getQnaCountAll();
	}
	
	public QnaVo getQnaContentByNum(int num) {
		return serviceCenterMapper.getQnaContentByNum(num);
	}
	
	public List<QnaVo> getQnaContentByRef(int num) {
		return serviceCenterMapper.getQnaContentByRef(num);
	}
	
	public void updateQnaContent(QnaVo qnaVo) {
		serviceCenterMapper.updateQnaContent(qnaVo);
	}
	
	@Transactional
	public void addQnaReply(int reRef, QnaVo addVo) {
		QnaVo updateVo = serviceCenterMapper.getQnaContentByNum(reRef);
		updateVo.setStatus("답변완료");
		serviceCenterMapper.updateQnaContent(updateVo);
		
		serviceCenterMapper.addQnaContent(addVo);
	}
	
	public void deleteQnaContent(int num) {
		serviceCenterMapper.deleteQnaContent(num);
	}
}
