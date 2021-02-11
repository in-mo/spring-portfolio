<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<div class="container">
     <div class="row">
       <div class="col">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#idContainer">아이디 찾기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#passContainer">패스워드 찾기</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="idContainer">
					<div class="middle">
						<form action="" method="post">
							<div id="idDiv">
                                <label>회원정보에 등록된 이메일을 입력하세요</label> <br>
                                <input type="email" id="email" name="email"> <br>
                                <input type="submit" id="findId" value="아이디 발송" onclick="alert('아이디가 발송되었습니다'); this.form.action='/test/findId';">
                            </div>
						</form>
                    </div>
				</div>

				<div class="tab-pane fade" id="passContainer">
					<div class="middle2">
						<form action="" method="post">
							<div id="passDiv">
                               <label>회원정보에 등록된 아이디, 이메일을 입력하세요</label> <br>
                               <label>아이디</label>
                               <input type="text" id="id" name="id"> <br>
                               <label>이메일</label>
                               <input type="email" id="email2" name="email"> <br>
                               <input type="submit" id="findPass" value="비밀번호 발송" onclick="alert('비밀번호가 발송되었습니다'); this.form.action='/test/findPass';">
                            </div>
                        </form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>