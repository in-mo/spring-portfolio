package com.portfolio.mapper;

import com.portfolio.domain.HostVo;

public interface HostMapper {
	
	public void addContent(HostVo hostVo);
	
	public HostVo getContentInfo(int num);
	
	public HostVo getContentInfoForMain(String classification);
	
	public int updateContentInfo(HostVo hostVo);
	
	public void deleteContentInfo(int num);
}
