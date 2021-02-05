package com.portfolio.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class ReviewVo {
	private int num;
	private String id;
	private String comment;
	private String score;
	private int noNum;
	private Timestamp regDate;
	
	private HostVo hostVo;
	private ImagesVo imagesVo;
	private int count;
}
