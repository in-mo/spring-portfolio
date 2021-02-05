package com.portfolio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.portfolio.domain.HostVo;
import com.portfolio.service.SaveService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/travel/*")
public class TravelController {
	
	@Autowired
	private SaveService saveService;
	
	@GetMapping("/appointment")
	public String appointment(int num) {
		log.info("appointment() - 호출");
		
		return "/travel/appointment";
	}
	
	@GetMapping("/savelist")
	public String savelist(Model model) {
		
		List<HostVo> hostList = saveService.getContentInfoForSaveList("test");
		
		model.addAttribute("hostList", hostList);
		
		return "/travel/saveList";
	}
	
	@GetMapping("/saveDelete")
	@ResponseBody
	public String saveDelete(int num, Model model) {
		int count = saveService.deleteSaveInfo(num, "test");
		if(count == 1)
			return "OK";
		
		return "FALSE";
	}
}