<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#top {
    border: red 1px solid;
    padding: 10px;
 }
#middle {
    border: red 1px solid;
    padding: 10px;
 }
#idAndpass {
    border: red 1px solid;
    padding: 10px;
}
#info {
    border: red 1px solid;
    padding: 10px;
}

</style>
</head>
<body>
	<div id="top">
        <h1>회원정보</h1>
        <c:if test="${ not empty id }">
        	<c:if test="${ id eq userVo.id }">
	        	<div id="middle">
		        	<form action="" method="post" id="modifyFrm">
			            <div id="idAndpass">
			            	<div id="id">
			            		<label for="">아이디</label>
			            		<input value="${ userVo.id }" readonly="readonly">
			            	</div>
			            	<div id="password">
			            		<label for="">비밀번호 확인</label>
			            		<input class="pass pass1" type="hidden" value="${ userVo.password }">
			            		<input class="pass pass2" type="password"> <span id="msgPass"></span>
			            	</div>
			            </div>
			            
			            <div id="info">
			                <div id="name">
			                    <label for="">이름</label>
			                    <input name="name" value="${ userVo.name }">  
			                </div>
			                <div id="email">
			                    <label for="">이메일</label>
			                    <input name="email" value="${ userVo.email }">
			                </div>
			                <div id="phone">
			                    <label for="">핸드폰</label>
			                    <input name="tel" value="${ userVo.tel }">
			                </div>
			            </div>
			            
			            <div>
<!-- 			            	<input type="submit" id="btnEdit" value="[회원정보 수정]" disabled>  -->
			            	<input type="submit" id="btnEdit" value="[회원수정]" disabled onClick="this.form.action='/modify/modifyUser';"/>
			            	<input type="submit" id="btnDelete" value="[탈퇴]" disabled onClick="alert('탈퇴 되었습니다'); this.form.action='/modify/deleteUser';"/>
			            </div>
		            </form>
		        </div>
	        </c:if>
        </c:if>
        
    </div>
    
<script src="/script/jquery-3.5.1.js"></script>    
<script type="text/javascript">
	$('.pass2').focusout(function() {
		let pass1 = $('.pass1').val();
		let pass2 = $(this).val();
	
		if (pass1 == pass2) {
			$('#msgPass').html('패스워드 일치함').css('color', 'green');
			$('#btnEdit').attr('disabled', false);
			$('#btnDelete').attr('disabled', false);
		} else {
			$('#msgPass').html('패스워드 불일치').css('color', 'red');
			$('#btnEdit').attr('disabled', true);
			$('#btnDelete').attr('disabled', true);
		}
	});
	
	  
</script>
</body>
</html>