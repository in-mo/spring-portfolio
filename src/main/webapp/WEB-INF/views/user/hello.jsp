<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = (String) session.getAttribute("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>
<%
	if (id == null | "".equals(id)) {
		%> 
			<script>
				location.href = "/user/login";
			</script>
		<%
	} else {
		%>
			<form action="" name="frm" method="post">
				<%=id%>님 반가워요~ 
				<input type="submit" value="[회원수정]" onClick="this.form.action='/modify/userInfo';"/>
				<input type="submit" value="[로그아웃]" onClick="this.form.action='/user/logout';"/>
			</form>
			
		<%
	}
%>
</div>

<!-- <script src="/script/jquery-3.5.1.js"></script> -->
</body>
</html>