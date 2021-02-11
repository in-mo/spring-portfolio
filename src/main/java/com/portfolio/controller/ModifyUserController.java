package com.portfolio.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.portfolio.domain.UserVo;
import com.portfolio.service.UserService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/modify/*")
public class ModifyUserController {

	@Autowired
	private UserService userService;
	
//	@Override
//	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		return null;
//	}
	
	@GetMapping("/hello")
	public void hello(HttpSession session) {
		log.info("Testing.hello() 호출됨");
	}
	
	@GetMapping("/userInfo")
	public void getUserInfo() {
		
		log.info("Testing.getUserInfo() 호출됨");

	}
	
	
	@PostMapping("/userInfo")
	public void postUserInfo(HttpSession session, Model model) {
		log.info("Testing.postUserInfo() 호출됨");
			
		// id 세션 가져오기
		String id = (String) session.getAttribute("id");
		
		// 저장된 회원정보 가져오기
		UserVo userVo = userService.getMemberById(id);
		
		// 회원정보 model에 저장
		model.addAttribute("userVo", userVo);
		
		// 회원정보 가져오기
		log.info("정보 : " + userVo);
		
//		return "redirect:/modify/userInfo";	

	}
	
	@GetMapping("/modifyUser")
	public void getModify() {
		log.info("Testing.getModify() 호출됨");
	}
	
	
	@PostMapping("/modifyUser")
	public void postModify(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		
		log.info("Testing.postModify() 호출됨");
			
		request.setCharacterEncoding("utf-8");
		
		// id 세션 가져오기
		String id = (String) session.getAttribute("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		log.info("이름 :" +name+ "// 이메일 :" +email+ "// 전번 :" +tel+ "// 아이디 :" + id);
		
		// 정보 업데이트
		userService.update(name, email, tel, id);
		
		// 업데이트 후 저장된 정보 가져오기
		UserVo userVo = userService.getMemberById(id);
		
		// 회원정보 model에 저장
		model.addAttribute("userVo", userVo);
		
		// 회원정보 가져오기
		log.info("정보 : " + userVo);
		
	
//		return "redirect:/modify/modifyUser";	

	}
	
	@PostMapping("/deleteUser")
	public String postDelete(HttpSession session) {
		
		log.info("Testing.postDelete() 호출됨");
		
		// 세션 가져오기
		String id = (String) session.getAttribute("id");
		
		// 세션이랑 맞는 데이터 지우기
		userService.deleteById(id);
		
		// 세션 지우기
		session.invalidate();
		
		
		// 로그인 페이지로 이동
		return "redirect:/user/login";
		
	}

}
