<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<link href="/css/hwh.css" rel="stylesheet" type="text/css"  media="all">

</head>
<body>

<div id="wrap">
	<%-- header 영역 --%>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<div class="clear"></div>
	
	<div class="txt2">
		<h2>자주 하는 질문</h2>
		<br><hr>
	</div>
	
	<form action="/customerCenter/modify" class="form2" method="post">
	<input type="hidden" name="pageNum" value="${ pageNum }">
	<input type="hidden" name="num" value="${ noticeVo2.num }">
		<div class="row4">
			<div class="txt3">
				<h2>QnA 수정</h2><hr><br>
				<table id="table1">
				<tr>
					<th class="write">작성자</th>
					<td class="float_left">
						<%-- <p><%=id %></p> --%>
						<input type="text" name="id" value="관리자" readonly>
					</td>
				</tr>
				<tr>
					<th class="write">제목</th>
					<td class="float_left">
						<input type="text" name="subject" value="${ noticeVo2.subject }">
					</td>
				</tr>
				<tr>
					<th class="write">내용</th>
					<td class="float_left">
						<textarea rows="30" cols="40" name="content">${ noticeVo2.content }</textarea>
					</td>
				</tr>
				</table>		
			</div>
			<br><br>
			<div class="float_right">
				<input type="submit" value="글수정" class="btn">
				<input type="button" value="목록으로" class="btn" onclick="location.href = '/customerCenter/list?pageNum=${ pageNum }'">
			</div>
		</div>
	</form>
	
	<div class="clear"></div>
	<%-- footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
</div>
</body>
</html>


