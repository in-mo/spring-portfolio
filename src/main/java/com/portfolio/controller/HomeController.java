package com.portfolio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.portfolio.domain.HostVo;
import com.portfolio.domain.LocationVo;
import com.portfolio.domain.ReviewVo;
import com.portfolio.service.HostService;
import com.portfolio.service.LocationService;
import com.portfolio.service.ReviewService;

import lombok.extern.java.Log;

@Controller
@Log
public class HomeController {
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private HostService hostService;
	
	@GetMapping("/")
	public String main(Model model) {
		List<LocationVo> locationList = locationService.getLocationList();
		List<ReviewVo> reviewList = reviewService.getReviews();
		List<HostVo> hostList = hostService.getContentInfoForMain();
		ArrayList<String> strLocationList = new ArrayList();
		for(LocationVo locationVo : locationList) {
			strLocationList.add(locationVo.getLocation());
		}
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("locationList", strLocationList);
		model.addAttribute("hostList", hostList);
		return "/index";
	}
}
