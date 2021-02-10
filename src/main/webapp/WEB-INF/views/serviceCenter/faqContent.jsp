<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 게시글</title>

<!-- <link href="/css/hwh.css" rel="stylesheet" type="text/css"  media="all"> -->
<style>
.faqContent {
	margin:50px;
	padding:20px;
}
.float_right {
	float: right;
}
#wrap {
	width:1020px;
	margin:0;
	margin-right: auto;
	margin-left: auto;
	min-height:780px;
}

</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/include/commonHeader.jsp" />
<div id="wrap">
	
	<div>
		<h2>자주 하는 질문</h2>
	</div>
	<hr>
	<div class="faqContent">
		<span class="float_right">
			조회수:${ faqVo.readcount }ㆍ등록날짜:<fmt:formatDate value="${ faqVo.regDate }" pattern="yyyy-MM-dd" />
		</span>
		<table class="table">
			<tr>
				<th>작성자</th>
				<td>${ faqVo.id }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${ faqVo.subject }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${ faqVo.content }</td>
			</tr>
		</table>
		<div class="float_right">
			<input type=button value="글수정" class="btn" onclick="location.href = '/customerCenter/faqModify?num=${ faqVo.num }&pageNum=${ pageNum }'">
			<input type=button value="글삭제" class="btn" onclick="remove()">
			<input type=button value="목록" class="btn" onclick="location.href = '/customerCenter/faqList?pageNum=${ pageNum }'">
		</div>
		
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script>
	function remove() {
		var result = confirm('해당 글을 정말 삭제하시겠습니까?');
		console.log(typeof result);
		
		if (result == false) {
			return;
		}
		
		location.href = '/customerCenter/faqDelete?num=${ faqVo.num }&pageNum=${ pageNum }';
	} // remove
</script>

</body>
</html>


