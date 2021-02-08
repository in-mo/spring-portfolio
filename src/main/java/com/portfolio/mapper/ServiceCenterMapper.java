package com.portfolio.mapper;

import java.util.List;

import com.portfolio.domain.ServiceCenterVo;

public interface ServiceCenterMapper {
	
	public void addContent(ServiceCenterVo serviceCenterVo);
	
	public int getCountAll();
	
	public List<ServiceCenterVo> getContents(int startRow);
	
	public ServiceCenterVo getContentByNum(int num);
	
	public void updateReadcount(int num);
	
	public void updateContent(ServiceCenterVo serviceCenterVo);
	
	public void deleteContent(int num);
}
