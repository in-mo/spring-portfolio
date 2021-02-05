package com.portfolio.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfolio.domain.HostVo;
import com.portfolio.domain.ImagesVo;
import com.portfolio.domain.MyReviewPageDto;
import com.portfolio.domain.ReviewVo;
import com.portfolio.service.ReviewService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("content")
	public String content(int num, 
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		Map<String, Object> reviewContent=  reviewService.getReviewContent(num);
		ReviewVo reviewVo = (ReviewVo) reviewContent.get("reviewVo");
//		String comment = reviewVo.getComment().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
//		reviewVo.setComment(comment);
		
		HostVo hostVo = (HostVo) reviewContent.get("hostVo");
//		comment = hostVo.getHostComment().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
//		hostVo.setHostComment(comment);
		ImagesVo imagesVo = hostVo.getImageVo();
		
		int count = (int) reviewContent.get("count");
		
		model.addAttribute("reviewVo", reviewVo);
		model.addAttribute("hostVo", hostVo);
		model.addAttribute("imagesVo", imagesVo);
		model.addAttribute("count", count);
		model.addAttribute("pageNum", pageNum);
		
		return "/review/review";
	}
	
	@GetMapping("/write")
	public String write(int num, Model model) {
		
		Map<String, Object> reviewContent=  reviewService.getContentInfoForReview(num);
		HostVo hostVo = (HostVo) reviewContent.get("hostVo");
		String comment = hostVo.getHostComment().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		hostVo.setHostComment(comment);
		
		ImagesVo imagesVo = hostVo.getImageVo();
		int count = (int) reviewContent.get("count");
		
		model.addAttribute("hostVo", hostVo);
		model.addAttribute("imagesVo", imagesVo);
		model.addAttribute("count", count);
		
		return "/review/reviewWriteForm";
	}
	
	@PostMapping("/write")
	@ResponseBody
	public int write(ReviewVo reviewVo) {
		reviewVo.setId("test");
		
		log.info(reviewVo.toString());
		
		int num = reviewService.addReview(reviewVo);
		
		return num;
	}
	
	@GetMapping("/modify")
	public String modify(int num, int pageNum, Model model) {
		Map<String, Object> reviewContent=  reviewService.getReviewContent(num);
		ReviewVo reviewVo = (ReviewVo) reviewContent.get("reviewVo");
		String comment = reviewVo.getComment().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		reviewVo.setComment(comment);
		
		HostVo hostVo = (HostVo) reviewContent.get("hostVo");
		comment = hostVo.getHostComment().replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		hostVo.setHostComment(comment);
		ImagesVo imagesVo = hostVo.getImageVo();
		
		int count = (int) reviewContent.get("count");
		
		model.addAttribute("reviewVo", reviewVo);
		model.addAttribute("hostVo", hostVo);
		model.addAttribute("imagesVo", imagesVo);
		model.addAttribute("count", count);
		model.addAttribute("pageNum", pageNum);
		
		return "/review/reviewModifyForm";
	}
	
	@PostMapping("/modify")
	@ResponseBody
	public String modify(ReviewVo reviewVo) {
		int count = reviewService.updateReviewInfo(reviewVo);
		if(count == 1)
			return "OK";
		
		return "FALSE"; 
	}
	
	@GetMapping("/delete")
	public String delete(int num, int pageNum, RedirectAttributes rttr) {
		
		int count = reviewService.deleteReviewInfo(num);
		
		rttr.addAttribute("pageNum", pageNum);
		
		return "redirect:/review/MyReviews";
	}
	
	@GetMapping("/MyReviews")
	public String reviewList(Model model,
			@RequestParam(defaultValue = "1") int pageNum) {
		String id = "test";
		
		int count = reviewService.countReviewById(id);
		
		//=====================================
		// 한 페이지에 해당하는 글목록 구하는 작업
		//=====================================
		
		// 한페이지당 보여줄 글갯수 설정
		int pageSize = 5;
		
		// 가져올 첫행번호 구하기
		int startRow = (pageNum - 1) * pageSize;
		
		List<ReviewVo> reviewList = null;
		if(count > 0)
			reviewList = reviewService.getContentForReviewList(id, startRow);
	
		//=====================================
		// 페이지블록 관련 정보 구하기 작업
		//=====================================
		
		MyReviewPageDto mPageDto = new MyReviewPageDto();
		if (count > 0) {
			// 총 필요한 페이지 갯수 구하기
			// 글50개. 한화면에보여줄글 10개 => 50/10 = 5 
			// 글55개. 한화면에보여줄글 10개 => 55/10 = 5 + 1페이지(나머지존재) => 6
			int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
			//int pageCount = (int) Math.ceil((double) count / pageSize);
			
			// 한 화면에 보여줄 페이지갯수 설정
			int pageBlock = 5;
			
			// 화면에 보여줄 시작페이지번호 구하기
			// 1~5          6~10          11~15          16~20       ...
			// 1~5 => 1     6~10 => 6     11~15 => 11    16~20 => 16
			int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
			
			// 화면에 보여줄 끝페이지번호 구하기
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			
			// 뷰에서 필요한 데이터를 PageDto에 저장
			mPageDto.setCount(count);
			mPageDto.setPageCount(pageCount);
			mPageDto.setPageBlock(pageBlock);
			mPageDto.setStartPage(startPage);
			mPageDto.setEndPage(endPage);
		}
		model.addAttribute("mPageDto", mPageDto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("reviewList", reviewList);
		
		return "/user/myReviews";
	}
}
