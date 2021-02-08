package com.portfolio.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.portfolio.domain.HostVo;
import com.portfolio.mapper.HostMapper;
import com.portfolio.mapper.ImagesMapper;
import com.portfolio.mapper.ReviewMapper;

@Service
public class SearchService {
	
	@Autowired
	private HostMapper hostMapper;
	
	@Autowired
	private ImagesMapper imagesMapper;
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Transactional
	public Map<String, Object> getSearchResult(String location, int cntOfPerson, int pageNum) {
		Map<String, Object> searchResult = new HashMap<String, Object>();
		int count = hostMapper.getContentCount(location, cntOfPerson);
		List<HostVo> hostList = null;
		int pageSize = 5; 
		int startRow = (pageNum - 1) * pageSize;
		
		if(count > 0) {
			hostList = hostMapper.getContentsByAddress(location, cntOfPerson, startRow);
			
			for(int i=0;i<hostList.size();i++) {
				hostList.get(i).setImageVo(imagesMapper.getImageByNoNum(hostList.get(i).getNum()));
				String score = reviewMapper.getAvgScoreByNoNum(hostList.get(i).getNum()) == null ? "0": reviewMapper.getAvgScoreByNoNum(hostList.get(i).getNum());
				hostList.get(i).setScore(Double.parseDouble(score));
			}
		}
		searchResult.put("count", count);
		searchResult.put("hostList", hostList);
		
		return searchResult;
	}
	
}
