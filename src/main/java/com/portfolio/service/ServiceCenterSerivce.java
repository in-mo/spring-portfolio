package com.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.domain.ServiceCenterVo;
import com.portfolio.mapper.ServiceCenterMapper;

@Service
public class ServiceCenterSerivce {

	@Autowired
	private ServiceCenterMapper serviceCenterMapper;
	
	public void addContent(ServiceCenterVo serviceCenterVo) {
		serviceCenterMapper.addContent(serviceCenterVo);
	}
	
	public List<ServiceCenterVo> getContents(int startRow) {
		return serviceCenterMapper.getContents(startRow);
	}
	
	public int getCountAll() {
		return serviceCenterMapper.getCountAll();
	}
	
	public ServiceCenterVo getContentByNum(int num) {
		return serviceCenterMapper.getContentByNum(num);
	}
	
	public void updateReadcount(int num) {
		serviceCenterMapper.updateReadcount(num);
	}
	
	public void updateContent(ServiceCenterVo serviceCenterVo) {
		serviceCenterMapper.updateContent(serviceCenterVo);
	}
	
	public void deleteContent(int num) {
		serviceCenterMapper.deleteContent(num);
	}
}
