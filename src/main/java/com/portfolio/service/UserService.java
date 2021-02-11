package com.portfolio.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.portfolio.mapper.UserMapper;
import com.portfolio.domain.UserVo;

@Service
@Transactional  // 이 클래스의 모든 메소드가 각각 한개의 트랜잭션 단위로 수행됨
public class UserService {

	// 스프링 빈으로 등록된 객체들 중에서
	// 타입으로 객체의 참조를 가져와서 참조변수에 저장해줌
	private UserMapper userMapper;
	
	
	 public Map<String, String> validateHandling(Errors errors) {
	        Map<String, String> validatorResult = new HashMap<>();

	        for (FieldError error : errors.getFieldErrors()) {
	            String validKeyName = String.format("valid_%s", error.getField());
	            validatorResult.put(validKeyName, error.getDefaultMessage());
	        }

	        return validatorResult;
	    }
	
	
	@Autowired
	public void setMemberMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	public UserVo getMemberById(String id) {
		UserVo userVo = userMapper.getMemberById(id);
		return userVo;
	}
	
	public void addMember(UserVo userVo) {
		userMapper.addMember(userVo);
	}
	
	public List<UserVo> getAllMembers() {
		List<UserVo> list = userMapper.getAllMembers();
		return list;
	}
	
	
	public int userCheck(String id, String password) {
		int check = -1;
		
		String dbPasswd = userMapper.userCheck(id);
		
		if (dbPasswd != null) {
			if (BCrypt.checkpw(password, dbPasswd)) { // 암호화된 비번이랑 입력비번 비교
				check = 1;
			} else {
				check = 0;
			}
		} else { // dbPasswd == null
			check = -1;
		}
		return check;
	}
	
	public int getCountById(String id) {
		int count = userMapper.getCountById(id);
		return count;
	}
	
	public void update(String name, String email, String tel, String id) {
		userMapper.update(name, email, tel, id);
	}
	
	public void deleteById(String id) {
		userMapper.deleteById(id);
	}
	
	public void deleteAll() {
		userMapper.deleteAll();
	}
	
//	public List<Map<String, Object>> getGenderPerCount() {
//		List<Map<String, Object>> list = userMapper.getGenderPerCount();
//		return list;
//	}
//	
//	public List<Map<String, Object>> getAgeRangePerCount() {
//		List<Map<String, Object>> list = userMapper.getAgeRangePerCount();
//		return list;
//	}
	
	// 회원가입 시, 유효성 체크
    public Map<String, String> validateHandlingMap(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }

        return validatorResult;
    }

    // 회원가입
    public void signUp(UserVo userVo) {
        // 회원 가입 비즈니스 로직 구현
    }
	
}







