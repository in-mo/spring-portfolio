<%@page import="lombok.extern.java.Log"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
</head>

<body>
	<div id="wrap">

		<article>
			<div class="top">
				<h2>회원가입</h2>
				<hr>
				<div class="middle">
					<form id="join" action="" method="post" name="frm">
						<fieldset>
							<div class="id">
								<label for="">아이디 (영문소문자,숫자 최소8자)</label> <br> 
								<input type="text" name="id" class="id" id="idIn" onkeyup="noSpaceForm(this);" required>
								<span id="msgIdDup"></span><br>
							</div>
							<div class="passwd">
								<label for="">비밀번호 (영소문자,숫자 반드시 포함 최소8자)</label> <br> 
								<input type="password" name="password" class="pass pass1" onkeyup="noSpaceForm(this);" required>
							</div>
							<div class="verify">
								<label for="">재확인 </label> <br> 
								<input type="password" class="pass pass2" onkeyup="noSpaceForm(this);" required> <span id="msgPass"></span>
								<br>
								<br>
							</div>

							<div class="name">
								<label for="">이름 </label> <br> 
								<input type="text" name="name" class="nick" onkeyup="noSpaceForm(this);"><br>
							</div>
							<div class="email">
								<label for="">이메일 </label> <br> 
								<input type="email" id="emailIn" name="email" class="email" onkeyup="noSpaceForm(this);" required>
								<input type="button" name="emailBtn" id="sendEmailBtn" value="이메일 인증">
								
								<div id="emailDiv" style="display: none"> <%-- 보일려면 block --%>
									<input type="button" name="reEmail" id="emailRe" value="인증번호 재발송" >
									<input type="text" id="numIn">
									<input type="button" name="confirmBtn" id="btnConfirm" value="확인"> <%-- 인증확인버튼 --%>
								</div>
							</div>
							<div class="phone">
								<label for="">폰번호 </label> <br> 
								<input type="tel" id="telIn" name="tel" class="phone" placeholder="xxx-xxxx-xxxx" maxlength="13" onkeyup="noSpaceForm(this);" required><br>
							</div>
						</fieldset>

						<div id="buttons">
							<input type="submit" value="회원가입" class="submit" id="joinBtn" name="joinButton" disabled onclick="this.form.action='/user/join';"> 
							<input type="reset" value="초기화" class="cancel">
						</div>
				
				</form>
			</div>
		</div>
</article>

		<div class="clear"></div>
		<%-- footer 영역 --%>
	</div>
<script src="/script/jquery-3.5.1.js"></script>
<script>
// 	function reCheck() {
// 		console.log($("#g-recaptcha-response").val());
// 	}

		$('input[name="id"]').keyup(function() {
			let id = $(this).val();

			if (id.length <= 8) { // 아이디 두글자 까지는 중복체크 안함
				return;
			}

			// 아이디 세글자 부터는 Ajax로 아이디 중복체크하기
			$.ajax({
				url : '/user/ajax/joinIdDupChk',
				data : {
					id : id
				},
				//method: 'GET',
				success : function(response) {
					console.log(typeof response);
					console.log(response);

					if (response.isIdDup) {
						$('span#msgIdDup').html('이미 사용중인 아이디 입니다.')
								.css('color', 'red');
					} else {
						$('span#msgIdDup').html('사용 가능한 아이디 입니다.').css(
								'color', 'green');
					}
				}
			});
		});
		
		$('.pass2').focusout(function() {
			let pass1 = $('.pass1').val();
			let pass2 = $(this).val();
		
			if (pass1 == pass2) {
				$('#msgPass').html('패스워드 일치함').css('color', 'green');
			} else {
				$('#msgPass').html('패스워드 불일치').css('color', 'red');
			}
		});
		
		function CheckEmail(str)
		{                                                 
		     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

		     if(!reg_email.test(str)) {                            
		          return false;         
		     }                            
		     else {                       
		          return true;         
		     }                            
		}

		
		
		
		$('input[name="emailBtn"]').click(
				function() {
					let email = $('#emailIn').val();

					if (email == "") {             
						alert("이메일을 입력하세요!");
						email.focus();	
						return;
					}               
					else   {          
						if(!CheckEmail(email))	{
							alert("이메일 형식이 잘못되었습니다");
							obEmail.focus();
							return;
						}      
						else {
							alert("이메일이 발송되었습니다. 이메일이 도착하지 않는다면 재발송버튼을 눌러주세요");
							
							$.ajax({
								url : '/mail/ajax/email',
								data : {
										email : email
									},
									method: 'GET'
									
								});

								$('#sendEmailBtn').attr('disabled', true);
								$('#emailDiv').css('display', 'block');
							
							}
						}
					});                      
					

		$('input[name="reEmail"]').click(
				function() {
					let email = $('#emailIn').val();

				$.ajax({
					url : '/mail/ajax/reEmail',
					data : {
							email : email
						},
						method: 'GET'
						
					});

					alert("인증번호가 전송되었습니다. 메일이 도착하지 않았다면 인증번호 재발송 버튼을 눌러주세요") 
					$('#sendEmailBtn').attr('disabled', true);					
					
				});
		
		
		var autoHypenPhone = function(str){
		      str = str.replace(/[^0-9]/g, '');
		      var tmp = '';
		      if( str.length < 4){
		          return str;
		      }else if(str.length < 7){
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3);
		          return tmp;
		      }else if(str.length < 11){
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3, 3);
		          tmp += '-';
		          tmp += str.substr(6);
		          return tmp;
		      }else{              
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3, 4);
		          tmp += '-';
		          tmp += str.substr(7);
		          return tmp;
		      }
		  
		      return str;
		}


		var phoneNum = document.getElementById('telIn');

		phoneNum.onkeyup = function(){
		  console.log(this.value);
		  this.value = autoHypenPhone( this.value ) ;  
		}
		
		
		$('input[name="confirmBtn"]').click(
				function() {
					let email = $('#emailIn').val();
					let number = $('#numIn').val();

				$.ajax({
					url : '/mail/ajax/emailLast',
					data : {
							email : email,
							number : number
					},
					success : function(response) {
						console.log(typeof response);
						console.log(response);

						if (response.emailnumber) {
							alert("인증에 성공하였습니다");
							$('#emailRe').attr('disabled', true);
							$('#btnConfirm').attr('disabled', true);
							$('#joinBtn').attr('disabled', false);
							$('#emailIn').attr('readonly', true);
							
						} else {
							alert("인증번호나 이메일이 일치하지 않습니다. 인증번호를 다시 발급 받아주세요");

						}
					}
				});
			
			});
		
		
		function noSpaceForm(obj) { // 공백사용못하게
		    var str_space = /\s/;  // 공백체크
		    if(str_space.exec(obj.value)) { //공백 체크
		        alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
		        obj.focus();
		        obj.value = obj.value.replace(/(\s*)/g, ""); // 공백제거
		        return false;
		    }
		}
		
	</script>
</body>
</html>

