package com.portfolio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.portfolio.domain.ImagesVo;

public interface ImagesMapper {
	
	void addImage(ImagesVo imagesVo);
	
	ImagesVo getImageByNum(int num);
	
	ImagesVo getImageByNoNum(int noNum);
	
	List<ImagesVo> getImagesByNum(int num);
	
	void deleteImagesByNoNum(int num);
	
	void deleteImagesByNums(@Param("numList") List<Integer> numList);
}
