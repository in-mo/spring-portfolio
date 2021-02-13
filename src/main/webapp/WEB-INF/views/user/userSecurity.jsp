<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 및 보안</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
div{
	padding: 10px;
	border:1px solid black;
}
</style>
</head>
<body>
<div class="container text-center">
	<div class="wrap">
		<div>
			<h3>로그인</h3>
			<div>
				<form>
					<label>현재 비밀번호</label>
					<input type="password" class="form-control"><br>
					<label>새 비밀번호</label>
					<input type="password" class="form-control"><br>
					<label>비밀번호 확인</label>
					<input type="password" class="form-control"><br>
					<button class="btn">비밀번호 변경</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>