package com.portfolio.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.portfolio.domain.UserVo;
import com.portfolio.service.UserService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/join")
	public void join() {
		log.info("GET - join() 호출됨");
	}
	
	@PostMapping("/join")
	public ResponseEntity<String> join(@Valid UserVo userVo, BindingResult bindingResult) {
		log.info("POST - join() 호출됨");

		if (bindingResult.hasErrors()) {
	        List<ObjectError> errorList = bindingResult.getAllErrors();
	        for (ObjectError error : errorList)
	        {
	            log.info(error.getDefaultMessage());
	            HttpHeaders headers = new HttpHeaders();
				headers.add("Content-Type", "text/html; charset=UTF-8");
				
				StringBuilder sb = new StringBuilder();
				sb.append("<script>");
				sb.append("  alert('"+ error.getDefaultMessage() +"');");
				sb.append("  history.back();");
				sb.append("</script>");
				
				return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
	        }
	    }
        
		// 비번 암호화시켜서 저장
		String pass = userVo.getPassword();
		String hashedPwd = BCrypt.hashpw(pass, BCrypt.gensalt());
		log.info("hashedPwd :" +hashedPwd);
		userVo.setPassword(hashedPwd);
		
		// 회원가입 날짜 설정
		userVo.setRegDate(new Timestamp(System.currentTimeMillis()));
		log.info("userVo : " + userVo);
		
		// 회원가입 처리
		userService.addMember(userVo);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/user/login"); // 리다이렉트 경로를 Location으로 설정
		// 리다이렉트일 경우는 HttpStatus.FOUND 를 지정해야 함
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
		
	}
	
	
	@GetMapping(value = "/ajax/joinIdDupChk", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	@ResponseBody // 리턴 객체를 JSON 문자열로 변환해서 응답을 줌
	public Map<String, Boolean> ajaxJoinIdDupChk(String id) {
		
		int count = userService.getCountById(id);

		Map<String, Boolean> map = new HashMap<>();
		if (count == 0) {
			map.put("isIdDup", false);
		} else { // count == 1
			map.put("isIdDup", true);
		}
		
		return map;
	}
	
	@GetMapping("/find")
    public String find() {
        return "/user/find";
    }
	
	@GetMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	@PostMapping("/login")
	public ResponseEntity<String> login(String id, String password, 
			@RequestParam(defaultValue = "false") boolean keepLogin,
			HttpSession session,
			HttpServletResponse response) {
		
		int check = userService.userCheck(id, password);
		// 로그인 실패시
		if (check != 1) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");
			
			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("  alert('아이디 또는 패스워드가 일치하지 않습니다.');");
			sb.append("  history.back();");
			sb.append("</script>");
			
			return new ResponseEntity<String>(sb.toString(), headers, HttpStatus.OK);
		}
		
		// 로그인 성공시
		// 세션에 아이디 저장(로그인 인증)
		session.setAttribute("id", id);
		log.info("session id : " + session.getAttribute("id"));
		if (keepLogin) { // keepLogin == true
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60 * 10);  // 60 * 10 / 쿠키 유효시간 10분
			cookie.setPath("/");

			response.addCookie(cookie);
		}
		
//		return "redirect:/";
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/modify/hello"); // 리다이렉트 경로를 Location으로 설정
		// 리다이렉트일 경우는 HttpStatus.FOUND 를 지정해야 함
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	} // login
	
	
	@GetMapping("/logout")
	public String postLogout(HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response) {
		
		log.info("Testing.postLogout() 호출됨");
		
		// 세션 초기화
		session.invalidate();
//		session.removeAttribute("id");
//		request.getSession().invalidate();
//		String clear = "";
//		session.setAttribute("id", clear);
		
		// 로그인 상태유지용 쿠키가 존재하면 삭제
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("id")) {
					cookie.setMaxAge(0); // 유효시간 0
					cookie.setPath("/"); // 경로는 생성할때와 동일하게 설정해야 삭제됨
					
					response.addCookie(cookie); // 삭제할 쿠키정보를 추가
				}
			}
		}
		
		
		return "redirect:/user/login";
	} // logout

	
	
	
	
}









