<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<link href="/css/hwh.css" rel="stylesheet" type="text/css"  media="all">

</head>
<body>
<jsp:include page="/WEB-INF/views/include/commonHeader.jsp" />
<div id="wrap">
	
	<div class="txt2">
		<h2>자주 하는 질문</h2>
		<br><hr>
	</div>
	
	<div class="row4">
		<div>
			<h3>${ serviceCenterVo.subject }</h3><hr><br>
			<div>
				${ serviceCenterVo.content }
			</div>
		</div>
		<br><br>
		<div class="float_right">
			<input type=button value="글 수정" class="btn" onclick="location.href = '/customerCenter/modify?num=${ serviceCenterVo.num }&pageNum=${ pageNum }'">
			<input type=button value="글 삭제" class="btn" onclick="remove()">
			<input type=button value="목록으로" class="btn" onclick="location.href = '/customerCenter/list?pageNum=${ pageNum }'">
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
		
		location.href = '/customerCenter/delete?num=${ serviceCenterVo.num }&pageNum=${ pageNum }';
	} // remove
</script>

</body>
</html>


