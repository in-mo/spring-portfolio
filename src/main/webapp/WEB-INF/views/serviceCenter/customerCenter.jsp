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
	
	<div class="row3">
	
	<c:choose>
		<c:when test="${ not empty contentList }"><%-- ${ pageDto.count gt 0 } --%>
			
			<c:forEach var="content" items="${ contentList }">
				<div class="content">
					<div class="txt11">
						<h3><a href ="/customerCenter/content?num=${ content.num }&pageNum=${ pageNum }">
							${ content.subject }</a></h3><hr>
					</div>
					<div class="txt12">
						${ content.content }
					</div>
				</div>
			</c:forEach>
			
		</c:when>		
		<c:otherwise>
			<div>게시판 글 없음</div>
		</c:otherwise>
	</c:choose>
	
	</div>	
	<div class="float_right2">
		<input type="button" value="글쓰기" class="btn" onclick="location.href='/customerCenter/write?pageNum=${ pageNum }'">
	</div>
	<br>
	<br>
	<div class="page">
		<%-- 글갯수가 0보다 크면 페이지블록 계산해서 출력하기 --%>
		<c:if test="${ pageDto.count gt 0 }">
			<%-- [이전] --%>
			<c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
				<a href="/customerCenter/list?pageNum=${ pageDto.startPage - pageDto.pageBlock }">[이전]</a>
			</c:if>
			
			<%-- 시작페이지 ~ 끝페이지 --%>
			<c:forEach var="i" begin="${ pageDto.startPage }" end="${ pageDto.endPage }" step="1">
				
				<c:choose>
				<c:when test="${ i eq pageNum }">
					<a href="/customerCenter/list?pageNum=${ i }" class="active">[${ i }]</a>
				</c:when>
				<c:otherwise>
					<a href="/customerCenter/list?pageNum=${ i }">[${ i }]</a>
				</c:otherwise>
				</c:choose>
				
			</c:forEach>
			
			<%-- [다음] --%>
			<c:if test="${ pageDto.endPage lt pageDto.pageCount }">
				<a href="/customerCenter/list?pageNum=${ pageDto.startPage + pageDto.pageBlock }">[다음]</a>
			</c:if>
		</c:if>
	</div>	
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>


