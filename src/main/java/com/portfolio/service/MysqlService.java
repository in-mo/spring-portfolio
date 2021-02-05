package com.portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.portfolio.mapper.MysqlMapper;

@Service
@Transactional
public class MysqlService {
	
	@Autowired
	private MysqlMapper mysqlMapper;

	public int getNextNum(String tableName) {
		int num = mysqlMapper.getNextNum(tableName);
		return num;
	}
	
}
