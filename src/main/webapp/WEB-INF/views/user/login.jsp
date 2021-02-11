<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%
// 세션값 가져오기
String id = (String) session.getAttribute("id");
// 세션값 있으면  ..님 반가워요~  [로그아웃]으로 바뀜. [회원가입]은 없어짐.
// 세션값 없으면  [로그인]  [회원가입]
		
%>
<!DOCTYPE html>
<html>
<head>
</head>

<body>

<div id="wrap">

<%
	if (id == null | "".equals(id)) {
			
%>
		<div class="container">
			<h2>로그인</h2>
				<div class="middle">
					<form action="/user/login" method="post" id="join">
						<div class="id">
							<label for="">아이디</label> <br> 
							<input type="text" name="id"><br> <br> 
							<label for="">비밀번호</label><br> 
							<input type="password" name="password"><br>
						</div>
									
						<div class="login">
							<div class="clear"></div>
							<div id="buttons">
								<input type="submit" value="로그인" class="submit"> 
								<input type="reset" value="초기화" class="cancel">
							</div>
						</div>
								
						<label>로그인 상태 유지</label> 
						<input type="checkbox" name="keepLogin" value="true"> 
						체크하면 10분 동안 로그인 상태가 유지됩니다. 
					</form><br>
								
						<div class="find">
							<a id="find" href="/user/find">아이디/비밀번호 찾기</a>
						</div>
						
						<div class="join">
							<label for="">계정이 없으세요?</label> <a href="/user/join">회원가입</a>
						</div>
						
						<div class="tt">
							<p>광고나 이미지</p>
						</div>
								
				</div>

			</div>

			
			
			<%
		} else {
			%> 
			<script type="text/javascript">
				location.href= "/modify/hello";
			</script>
			<%
		}
	%>
	
</div>



</body>
</html>

