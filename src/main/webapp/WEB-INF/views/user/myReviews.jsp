<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 후기 및 평점 목록</title>
<style>
.app {
	width: 1120px;
	display: block;
	margin: 0 auto;
	position: relative;
}

.verticality {
	display: inline-flex;
	flex-direction: column;
}

.horizontal {
	display: inline-flex;
	flex-direction: row;
}

div {
	padding: 10px;
	border: solid red 1px;
}

hr {
	border: 0;
	height: 1px;
	background: #d2d2d2;
}

p {
	border: solid orange 1px;	
}

.overflow {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 200px;
	height: 22px;
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
	<div class="app" id="app">
		<div>메인	</div>
		<div>Member > My Reviews</div>
		<div class="horizontal">
			<div>
				<div style="width: 150px; height: 150px;">
					<img src="" width="150" height="150">
				</div>
				<p>아이디</p>
				<p>이름</p>
			</div>
			<div class="verticality" style="width: 882px;">
				후기 목록 [후기 갯수: ${ mPageDto.count }]
				<c:choose>
					<c:when test="${ mPageDto.count gt 0 }">
						<c:forEach var="review" items="${ reviewList }">
							<div>
								<div class="horizontal">
									<div>
										<img src="/upload/${ review.imagesVo.uploadpath }/${ review.imagesVo.uuid }_${ review.imagesVo.filename }" width="200" height="200">
										<p class="overflow">${ review.hostVo.address1 } ${ review.hostVo.address2 } </p>
										<p>${ review.hostVo.stayType }ㆍ후기(${ review.count })</p>	
										<p>호스트 : ${ review.hostVo.id }</p>
										<p>2021-01-27 ~ 2021-01-28</p>
									</div>
									<div>
										<span><b>작성일자 : <fmt:formatDate value="${ review.regDate }"
									pattern="yyyy-MM-dd" /></b></span><br>
										<hr>
										<span><b>만족도</b></span><br>
										<span style="color: #ff385c"><i class="fas fa-star"></i></span><span>${ review.score }</span>
										<hr>
										<span><b>후기</b></span><br>
										<div style="width: 570px;"><pre>${ review.comment }</pre></div>
									</div>
								</div>
								<div>
									<input type="hidden" value="${ review.num }">
									<input type="hidden" value="${ pageNum }">
									<button type="button" v-on:click="modifyReview($event)">수정하기</button>
									<button type="button" v-on:click="deleteReview($event)">삭제하기</button>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div>후기 글 없음</div>
					</c:otherwise>
				</c:choose>
				<div>
					<c:if test="${ mPageDto.count gt 0 }">
						<c:if test="${ mPageDto.startPage gt mPageDto.pageBlock }">
							<a href="/review/MyReviews?pageNum=${ mPageDto.startPage - mPageDto.pageBlock }">[이전]</a>
						</c:if>
						
						<c:forEach var="i" begin="${ mPageDto.startPage }" end="${ mPageDto.endPage }" step="1">
		
							<c:choose>
							
								<c:when test="${ pageNum eq i}">
									<a href="/review/MyReviews?pageNum=${ i }"><b>[${ i }]</b></a>
								</c:when>
								
								<c:otherwise>
									<a href="/review/MyReviews?pageNum=${ i }">[${ i }]</a>
								</c:otherwise>
							
							</c:choose>
					
						</c:forEach>
						
						<c:if test="${ mPageDto.endPage lt mPageDto.pageCount }">
							<a href="/review/MyReviews?pageNum=${ mPageDto.startPage + mPageDto.pageBlock }">[다음]</a>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script src="/script/jquery-3.5.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
	<script>
	 	
		vue = new Vue({
			el: '#app',
			data: {
				 
			},
			methods: {
				modifyReview: function(e) {
					let num = $(e.currentTarget).prev().prev().val();
					console.log(num);
					let isModify = confirm('수정하시겠습니까?');
					if(isModify) {
						location.href = '/review/modify?num=' + num + '&pageNum=${ pageNum }';
					}
				},
				deleteReview: function(e) {
					let num = $(e.currentTarget).prev().prev().prev().val();
					console.log(num);
					let isDelete = confirm('정말 삭제하시겠습니까?');
					if(isDelete) {
						location.href = '/review/delete?num=' + num + '&pageNum=${ pageNum }';
					}
				}
			}
		});
	
	</script>	
</body>
</html>