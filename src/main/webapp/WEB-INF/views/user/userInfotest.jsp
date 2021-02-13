<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>개인정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
h2, h4 {
	font-weight: bold;
}
form input {
	margin: 5px 0px;
}
</style>
</head>

<body>
<div class="container">
	<div class="wrap row">
		<h2>개인정보</h2>
		<div>
			<br><br>
			
			<div class="col-md-6">
				<ul class="list-group list-group-flush">
				
					<li class="list-group-item">
						<h4>실명</h4>
						<div>효성</div> <!-- Vo로 값 가져오기 -->
					</li>
					<li class="list-group-item">
						<h4>성별</h4>
						<div>여자</div> <!-- Vo로 값 가져오기 -->
					</li>
					<li class="list-group-item">
						<h4>생년월일</h4>
						<div>1997년 3월 28일</div> <!-- vo 값 가져오기 -->
					</li>
					<li class="form-inline list-group-item">
						<h4>이메일 주소<button class="btn btn-link pull-right">수정</button></h4>
						
						<input type="email" class="form-control">
						<input type="button" value="확인" class="btn">
					</li>
					<li class="form-inline list-group-item">
						<h4>전화번호<button class="btn btn-link pull-right">수정</button></h4>
						<input type="tel" class="form-control">
						<input type="button" value="확인" class="btn">
					</li>
					<li class="list-group-item">
						<h4>주소<button class="btn btn-link pull-right">수정</button></h4>
						<form action="userInfoPro.jsp" class="form-inline" method="post">
							<input type="text" id="postcode" placeholder="우편번호" class="form-control" name="postname">
							<input type="button" onclick="daumPostcodeAPI()"
								value="우편번호 찾기" class="btn">
							<br>
							<input type="text" id="address" placeholder="주소" class="form-control" name="address">
							<br>
							<input type="text" id="detailAddress" placeholder="상세주소" class="form-control" name="detailAddress">
							<input type="text" id="extraAddress" placeholder="참고항목" class="form-control" name="extraAddress">
							<input type="submit" value="확인" class="btn">
						</form>
					</li>
				</ul>
			</div>
			
			<div class="col-md-6 card" style="width:30%; border:1px solid lightgray;">
				<div class="card-body">
					<h3 class="card-title">수정할 수 있는 세부정보는?</h3>
					<p class="card-text">
						세부 정보는 변경불가. 연락처 정보와 일부 개인정보는 수정할 수 있지만, 다음번 예약 또는 숙소 등록 시, 본인 인증 절차를 거쳐야 한다.
					</p>
				</div>
				<hr>
				<div class="card-body">
					<h3 class="card-title">다른 사람에게 공개되는 정보는?</h3>
					<p class="card-text">
						예약이 확정된 훙만 호스트 및 게스트의 연락처 정보를 공개한다.
					</p>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
function daumPostcodeAPI() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("extraAddress").value = extraAddr;

					} else {
						document.getElementById("extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById("postcode").value = data.zonecode;
					document.getElementById("address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress")
							.focus();
				}
			}).open();
}
</script>
</body>
</html>