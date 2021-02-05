package com.portfolio.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.portfolio.domain.HostVo;
import com.portfolio.domain.ImagesVo;
import com.portfolio.domain.SaveVo;
import com.portfolio.mapper.HostMapper;
import com.portfolio.mapper.ImagesMapper;
import com.portfolio.mapper.ReviewMapper;
import com.portfolio.mapper.SaveMapper;

import lombok.extern.java.Log;

@Log
@Transactional
@Service
public class SaveService {
	
	@Autowired 
	private SaveMapper saveMapper;
	
	@Autowired
	private HostMapper hostMapper;
	
	@Autowired
	private ImagesMapper imagesMapper;
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	public int addSave(SaveVo saveVo) {
		return saveMapper.addSave(saveVo);
	}
	
	public List<SaveVo> getSaveInfo(String id) {
		return saveMapper.getSaveInfo(id);
	}
	
	@Transactional
	public List<HostVo> getContentInfoForSaveList(String id) {
		id = "test";
		List<SaveVo> saveList = saveMapper.getSaveInfo(id);
		
		List<HostVo> hostList = new ArrayList<HostVo>();
		
		for(SaveVo saveVo : saveList) {
			ImagesVo imagesVo = imagesMapper.getImageByNoNum(saveVo.getHostNum());
			HostVo hostVo = hostMapper.getContentInfo(saveVo.getHostNum());
			
			int reviewCount = reviewMapper.countReviewByNoNum(hostVo.getNum());
			
			hostVo.setImageVo(imagesVo);
			hostVo.setReviewCount(reviewCount);
			hostVo.setHostComment(hostVo.getHostComment().replace("\n", "<br>"));
			hostVo.setSaveVo(saveVo);
			hostList.add(hostVo);
		}
		
		return hostList;
	}
	
	public int isExistSaveInfo(int hostNum, String id) {
		return saveMapper.isExistSaveInfo(hostNum, id);
	}
	
	public void updateSaveInfo(SaveVo saveVo) {
		saveMapper.updateSaveInfo(saveVo);
	}
	
	public int deleteSaveInfo(int hostNum, String id) {
		int num = saveMapper.getSaveNum(hostNum, id);
		
		return saveMapper.deleteSaveInfo(num);
	}
}
