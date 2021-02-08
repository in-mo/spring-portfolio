package com.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.domain.LocationVo;
import com.portfolio.mapper.LocationMapper;

@Service
public class LocationService {
	
	@Autowired
	private LocationMapper locationMapper;
	
	public List<LocationVo> getLocationList() {
		return locationMapper.getLocationList();
	}
}
