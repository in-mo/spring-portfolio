package com.portfolio.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfolio.domain.PageDto;
import com.portfolio.domain.ServiceCenterVo;
import com.portfolio.service.MysqlService;
import com.portfolio.service.ServiceCenterSerivce;

@Controller
@RequestMapping("/customerCenter/*")
public class ServiceCenterController {
	
	@Autowired
	private MysqlService mysqlService;
	
	@Autowired
	private ServiceCenterSerivce serviceCenterSerivce;
	
	@GetMapping("list")
	public String list(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		int count = serviceCenterSerivce.getCountAll();
		
		int pageSize = 9;
		
		int startRow = (pageNum - 1) * pageSize;		
		
		List<ServiceCenterVo> contentList = null;
		if (count > 0) {
			contentList = serviceCenterSerivce.getContents(startRow);
			
			String content = "";
			for(ServiceCenterVo serviceCenterVo : contentList) {
				if (serviceCenterVo.getContent() != null) {
					content = serviceCenterVo.getContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
					serviceCenterVo.setContent(content);
				}
			}
		}
		
		PageDto pageDto = new PageDto();
		
		if (count > 0) {
			int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
			//int pageCount = (int) Math.ceil((double) count / pageSize);
			
			int pageBlock = 5;
			
			// 1~5          6~10          11~15          16~20       ...
			// 1~5 => 1     6~10 => 6     11~15 => 11    16~20 => 16
			int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
			
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			
			pageDto.setCount(count);
			pageDto.setPageCount(pageCount);
			pageDto.setPageBlock(pageBlock);
			pageDto.setStartPage(startPage);
			pageDto.setEndPage(endPage);
		} // if
		
		
		model.addAttribute("contentList", contentList);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("pageNum", pageNum);
		
		return "/serviceCenter/customerCenter";
	}
	
	@GetMapping("/write")
	public String write(@ModelAttribute("pageNum") String pageNum, HttpSession session, Model model) {
		
		// 로그인 했을때는 글쓰기 화면으로 보여줌
		return "/serviceCenter/writeForm";
	} // Get - write
	
	
	@PostMapping("/write")
	public String write(String pageNum, ServiceCenterVo serviceCenterVo,
			HttpSession session, HttpServletRequest request) {
		
		// 클라이언트 IP주소, 등록날짜, 조회수 값 설정
		serviceCenterVo.setReadcount(0); 
		
		int num = mysqlService.getNextNum("airbnb_custom_service");
		
		// 주글쓰기
		serviceCenterSerivce.addContent(serviceCenterVo);
		
		return "redirect:/customerCenter/content?num=" + num + "&pageNum=" + pageNum;
	} // Post - write
	
	
	@GetMapping("/content")
	public String content(int num, String pageNum, Model model) {
		// 상세보기 대상 글의 조회수 1 증가
		serviceCenterSerivce.updateReadcount(num);
		
		// 상세보기 대상 글내용 VO로 가져오기
		ServiceCenterVo serviceCenterVo = serviceCenterSerivce.getContentByNum(num);
		
		String content = "";
		content = serviceCenterVo.getContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		serviceCenterVo.setContent(content);
		
		model.addAttribute("serviceCenterVo", serviceCenterVo);
		model.addAttribute("pageNum", pageNum);
		
		return "/serviceCenter/content";
	} // content
	
	
	@GetMapping("/delete")
	public String delete(int num, String pageNum, RedirectAttributes rttr) {
		// 글번호에 해당하는 글 한개 삭제하기
		serviceCenterSerivce.deleteContent(num);
		
		// 글목록 페이지로 리다이렉트 이동시키기
		rttr.addAttribute("pageNum", pageNum);
		
		return "redirect:/customerCenter/list";
		//return "redirect:/notice/list?pageNum=" + pageNum;
	} // delete
	
	
	@GetMapping("/modify")
	public String modify(int num, @ModelAttribute("pageNum") String pageNum, Model model) {
		// 글번호 num에 해당하는 글내용 VO로 가져오기
		ServiceCenterVo serviceCenterVo = serviceCenterSerivce.getContentByNum(num);
		serviceCenterVo.setContent(serviceCenterVo.getContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		
		model.addAttribute("serviceCenterVo", serviceCenterVo);
		
		return "/serviceCenter/modifyForm";
	} // GET - modify
	
	
	@PostMapping("/modify")
	public String modify(ServiceCenterVo serviceCenterVo, String pageNum, RedirectAttributes rttr) {
		
		serviceCenterSerivce.updateContent(serviceCenterVo);
		
		rttr.addAttribute("num", serviceCenterVo.getNum());
		rttr.addAttribute("pageNum", pageNum);
		
		// 수정된 글의 상세보기 화면으로 리다이렉트 이동
		return "redirect:/customerCenter/content";
	} // POST - modify
}
