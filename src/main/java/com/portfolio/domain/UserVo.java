package com.portfolio.domain;

import java.sql.Timestamp;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class UserVo {
	
	
	@Pattern(regexp = "^[a-zA-Z0-9]{6,20}$",
			message = "아이디는 영문 소문나 숫자가 포함된 8자~20자의 문자여야 합니다")
	private String id;
	
	@Pattern(regexp = "(?=.*[a-z])(?=.*[0-9]).{8,20}",
			message = "비밀번호는 영문 소문자와 숫자가 적어도 1개이상씩 포함된 8자~20자의 문자여야 합니다")
	private String password;
	
	private String name;

	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String email;

	@Pattern(regexp = "^(01[0-9])-(\\d{3,4})-(\\d{4})$",
			message = "핸드폰번호 형식에 맞지 않습니다")
	private String tel;
	private Timestamp regDate;
}
