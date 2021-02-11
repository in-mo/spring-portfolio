package com.portfolio.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.portfolio.service.EmailService;
import com.portfolio.service.MailHandler;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Log
@Controller
@AllArgsConstructor
@RequestMapping("/mail/*")
public class MailController {

	@Autowired
	private EmailService emailService;
	
	private JavaMailSender mailSender;
	
	 @GetMapping("/email")
	    public String dispMail() {
	        return "email";
	    }

	    @GetMapping(value = "/ajax/email", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	    @ResponseBody
	    public void ajaxEmail(@Valid String email, Model model) {
	    	
	        // 임의의 숫자 다섯개 생성하기
	        int num[] = new int[5];
	        	for(int i=0; i<5; i++) {
	        		num[i]=(int)(Math.random()*9);
        		for(int j=0; j<i;j++) {
	               if(num[i]==num[j]) {i--; break;}
	           }    
	        }
	        	
	        String randomNum = ""+num[0]+""+num[1]+""+num[2]+""+num[3]+""+num[4]+"";
	         
	        // 숫자 잘들어갔는지 확인
            log.info(randomNum);
            
            try {
                MailHandler mailHandler = new MailHandler(mailSender);
                
                // 받는 사람
               mailHandler.setTo(email);
                // 보내는 사람
               mailHandler.setFrom("ruitest20@gmail.com");
               
               mailHandler.setSubject("인증번호 발송 메일 입니다다다");
                // HTML Layout
                String htmlContent = "<h1>" + randomNum +"</h1>"; // <img src='cid:sample-img'> 이미지 추가할려면 이거 뒤에 추가하면됨
                mailHandler.setText(htmlContent, true);
                // 첨부 파일
//               mailHandler.setAttach("newTest.txt", "static/originTest.txt");
                // 이미지 삽입
//               mailHandler.setInline("sample-img", "static/sample1.jpg");

                mailHandler.send();
                emailService.addNumber(email, randomNum);
                
            }
            catch(Exception e){
                e.printStackTrace();
            }
            
	    }
	    
	    @GetMapping(value = "/ajax/reEmail", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	    @ResponseBody
	    public void ajaxReEmail(String email) {
	    	
	        // 임의의 숫자 다섯개 생성하기
	        int num[] = new int[5];
	        	for(int i=0; i<5; i++) {
	        		num[i]=(int)(Math.random()*9);
        		for(int j=0; j<i;j++) {
	               if(num[i]==num[j]) {i--; break;}
	           }    
	        }
	        	
	        String randomNum = ""+num[0]+""+num[1]+""+num[2]+""+num[3]+""+num[4]+"";
	         
	        // 숫자 잘들어갔는지 확인
            log.info(randomNum);
            
            try {
                MailHandler mailHandler = new MailHandler(mailSender);
                
                // 받는 사람
               mailHandler.setTo(email);
                // 보내는 사람
               mailHandler.setFrom("ruitest20@gmail.com");
                // 제목
               mailHandler.setSubject("인증번호 발송 메일 입니다다다");
                // HTML Layout
                String htmlContent = "<h1>" + randomNum +"</h1>"; // <img src='cid:sample-img'> 이미지 추가할려면 이거 뒤에 추가하면됨
                mailHandler.setText(htmlContent, true);
                // 첨부 파일
//               mailHandler.setAttach("newTest.txt", "static/originTest.txt");
                // 이미지 삽입
//               mailHandler.setInline("sample-img", "static/sample1.jpg");

                mailHandler.send();
                emailService.deleteByEmail(email);
                emailService.addNumber(email, randomNum);
            }
            catch(Exception e){
                e.printStackTrace();
            }
			
	    }
	    
	    
	    @GetMapping(value = "/ajax/emailLast", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }) 
    	@ResponseBody	
    	public Map<String, Boolean> emailLastTest (String email, String number) {
	    	
	    	String num = emailService.getNumberByEmail(email);
	    	
	    	Map<String, Boolean> map = new HashMap<>();

	    	
	    	if (num != null) { // 아이디 일치
	    		if (num.equals(number)) { // 아이디, 인증번호 둘다 일치
		    		map.put("emailnumber", true);
		    		emailService.deleteByEmail(email);
	    			return map;
		    	} else { // 인증번호 다름
					map.put("emailnumber", false);
					return map;
				}
	    	} else { // 중간에 아이디 다른놈으로 바꾸거나 했을경우
	    		map.put("emailnumber", false);
				return map;
	    	}
	    }
	    
	    
	    @PostMapping("/findId")
	    public String findId(String email) {
	    	
	    	log.info("Testing.findId() - Post 호출");
	    	
	    	String resultId = emailService.getIdByEmail(email);
		    	
	    	try {
	            MailHandler mailHandler = new MailHandler(mailSender);
	                
	            // 받는 사람
	            mailHandler.setTo(email);
	            // 보내는 사람
	            mailHandler.setFrom("ruitest20@gmail.com");
	            // 제목
	            mailHandler.setSubject("아이디 찾기 메일입니다다다다다다다다");
	            // HTML Layout
	            String htmlContent = "<h1>" +  resultId +"</h1>"; // <img src='cid:sample-img'> 이미지 추가할려면 이거 뒤에 추가하면됨
	            mailHandler.setText(htmlContent, true);
	            // 첨부 파일
	//               mailHandler.setAttach("newTest.txt", "static/originTest.txt");
	            // 이미지 삽입
	//               mailHandler.setInline("sample-img", "static/sample1.jpg");
	
	            mailHandler.send();
	                
	            }
	            catch(Exception e){
	                e.printStackTrace();
	            }
	    	
	    	return "redirect:/user/login";
	    }
	    
	    @PostMapping("/findPass")
	    public String findPass(String id ,String email) {
	    	
	    	log.info("Testing.findPass() - Post 호출");
	    	
	    	String resultPass = emailService.getPassByInfo(id, email);
		    	
	    	try {
		            MailHandler mailHandler = new MailHandler(mailSender);
		                
		            // 받는 사람
		            mailHandler.setTo(email);
		            // 보내는 사람
		            mailHandler.setFrom("ruitest20@gmail.com");
		            // 제목
		            mailHandler.setSubject("비밀번호 찾기 메일입니다다다다다다다다");
		            // HTML Layout
		            String htmlContent = "<h1>" +  resultPass +"</h1>"; // <img src='cid:sample-img'> 이미지 추가할려면 이거 뒤에 추가하면됨
		            mailHandler.setText(htmlContent, true);
		            // 첨부 파일
		//               mailHandler.setAttach("newTest.txt", "static/originTest.txt");
		            // 이미지 삽입
		//               mailHandler.setInline("sample-img", "static/sample1.jpg");
		
		            mailHandler.send();
		                
	            }
	            catch(Exception e){
	                e.printStackTrace();
	            }
	    	
	    	return "redirect:/user/login";
	    }
	    
	    
}
