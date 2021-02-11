<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
/* div { */
/* 	padding: 5px; */
/* 	border: solid red 1px; */
/* } */
.faqContainer {
	display: grid;
/* 	margin:50px 50px 10px 50px; */
	grid-template-columns: 292px 292px 292px;
	grid-template-rows: 220px 220px 220px;
}
.faqTitle {
	width:272px;
	height:45px;
	display:block;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
}
.faqInfo {
	width:272px;
	height:130px;
	display:block;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
}

.float_right {
	float: right;
}
.writePosition {
	float: right;
/* 	margin-right:50px; */
}
#wrap {
	width:1020px;
	margin:0;
	margin-right: auto;
	margin-left: auto;
	min-height:780px;
}
.pageBox {
	text-align: center;
}

hr {
	border: 0;
	height: 1px;
	background: #d2d2d2;
}
.content {
	border: solid 1px #d2d2d2;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/commonHeader.jsp" />
<div id="wrap">
		
	<div>
		<h2>고객센터</h2>
	</div>
	<hr>
	<div class="container">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<c:choose>
							<c:when test="${ viewType eq 'faq' }">
								<a class="nav-link active" data-toggle="tab" href="#faq" onclick="location.href = '/customerCenter/faqList'">FAQ</a>	
							</c:when>
							<c:otherwise>
								<a class="nav-link" data-toggle="tab" href="#faq" onclick="location.href = '/customerCenter/faqList'">FAQ</a>
							</c:otherwise>
						</c:choose>
					</li>
					<li class="nav-item">
						<c:choose>
							<c:when test="${ viewType eq 'qna' }">
								<a class="nav-link active" data-toggle="tab" href="#qna" onclick="location.href = '/customerCenter/qnaList'">QnA</a>	
							</c:when>
							<c:otherwise>
								<a class="nav-link" data-toggle="tab" href="#qna" onclick="location.href = '/customerCenter/qnaList'">QnA</a>
							</c:otherwise>
						</c:choose>
						
					</li>
				</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="faq">
					<div class="faqContainer">
						<c:choose>
							<c:when test="${ not empty fContentList }">
								<c:forEach var="content" items="${ fContentList }">
									<div class="content">
									<span class="float_right">
												조회수:${ content.readcount }
											</span>
										<div class="faqTitle">
											
											<h4><a href ="/customerCenter/faqContent?num=${ content.num }&pageNum=${ fPageNum }">
												${ content.subject }</a></h4><hr>
										</div>
										<div class="faqInfo">
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
						<div class="writePosition">
							<input type="button" value="글쓰기" class="btn" onclick="location.href='/customerCenter/faqWrite?pageNum=${ fPageNum }'">
						</div>
						<br>
						<br>
						<div class="pageBox">
							<%-- 글갯수가 0보다 크면 페이지블록 계산해서 출력하기 --%>
							<c:if test="${ fPageDto.count gt 0 }">
								<%-- [이전] --%>
								<c:if test="${ fPageDto.startPage gt fPageDto.pageBlock }">
									<a href="/customerCenter/faqList?pageNum=${ fPageDto.startPage - fPageDto.pageBlock }">[이전]</a>
								</c:if>
								
								<%-- 시작페이지 ~ 끝페이지 --%>
								<c:forEach var="i" begin="${ fPageDto.startPage }" end="${ fPageDto.endPage }" step="1">
									
									<c:choose>
									<c:when test="${ i eq fPageNum }">
										<a href="/customerCenter/faqList?pageNum=${ i }" class="active">[${ i }]</a>
									</c:when>
									<c:otherwise>
										<a href="/customerCenter/faqList?pageNum=${ i }">[${ i }]</a>
									</c:otherwise>
									</c:choose>
									
								</c:forEach>
								
								<%-- [다음] --%>
								<c:if test="${ fPageDto.endPage lt fPageDto.pageCount }">
									<a href="/customerCenter/faqList?pageNum=${ fPageDto.startPage + fPageDto.pageBlock }">[다음]</a>
								</c:if>
							</c:if>
						</div>	
					</div>
					<div class="tab-pane fade show active" id="qna">
						<table class="table table-striped text-center">
							<thead>
							<tr>
								<th>번호</th>
								<th>현황</th>
								<th>유형</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>작성일자</th>
							</tr>
							</thead>
							<tbody id="qnaContentBox">
								<c:choose>
									<c:when test="${ not empty qContentList }">
										<c:forEach var="content" items="${ qContentList }">
											<tr onclick="showQnaContent(event)">
												<td class="num">${ content.num }</td>
												<td class="status">${ content.status }</td>
												<td class="type">${ content.type }</td>
												<td>${ content.subject }</td>
												<td>${ content.id }</td>
												<td><fmt:formatDate value="${ content.regDate }" pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="6" class="text-center">등록된 글이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="float_right">
							<button type="button" class="btn" onclick="location.href='/customerCenter/qnaWrite?pageNum=${ qPageNum }'">글쓰기</button>
						</div>
						<br>
						<br>
						<div class="pageBox">
							<%-- 글갯수가 0보다 크면 페이지블록 계산해서 출력하기 --%>
							<c:if test="${ qPageDto.count gt 0 }">
								<%-- [이전] --%>
								<c:if test="${ qPageDto.startPage gt qPageDto.pageBlock }">
									<a href="/customerCenter/qnaList?pageNum=${ qPageDto.startPage - qPageDto.pageBlock }">[이전]</a>
								</c:if>
								
								<%-- 시작페이지 ~ 끝페이지 --%>
								<c:forEach var="i" begin="${ qPageDto.startPage }" end="${ qPageDto.endPage }" step="1">
									
									<c:choose>
										<c:when test="${ i eq qPageNum }">
											<a href="/customerCenter/qnaList?pageNum=${ i }" class="active">[${ i }]</a>
										</c:when>
										<c:otherwise>
											<a href="/customerCenter/qnaList?pageNum=${ i }">[${ i }]</a>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
								
								<%-- [다음] --%>
								<c:if test="${ qPageDto.endPage lt qPageDto.pageCount }">
									<a href="/customerCenter/qnaList?pageNum=${ qPageDto.startPage + qPageDto.pageBlock }">[다음]</a>
								</c:if>
							</c:if>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script src="/script/jquery-3.5.1.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
	// 부모창의 변화가 생길때 
	// 자식창 닫아버리기
	var pop;
	window.onunload = function() { 
		pop.close(); 
	}

	let type = '${ viewType }';
	if(type == 'faq') {
		$('#faq').addClass('active');
		$('#qna').removeClass('active');
	} else {
		$('#qna').addClass('active');
		$('#faq').removeClass('active');
	}

	var dupCheck = 0;
	function showQnaContent(event) {
		let tag = $(event.currentTarget);
		let num = tag.children('.num').text();

		$('.qnaContentInfo').remove();
		if(dupCheck == num) {
			dupCheck = 0;
			return;
		}
		$.ajax({
			url: '/customerCenter/qna/' + num,
			success:function(res) {
				dupCheck = res.qnaVo.num;
				let str = `
						<tr class="\${ num } text-left qnaContentInfo">
							<td colspan="6">
								<div>\${ res.qnaVo.content }</div>
								<div class="text-center">
									<input type="hidden" name="num" value="\${res.qnaVo.num}">
					`;
					if(res.qnaVo.status == '답변대기') {				
						str +=`
									<button type="button" class="btn" onclick="qnaReplyAddBtn(event)">답글쓰기</button>
									<button type="button" class="btn" onclick="location.href='/customerCenter/qnaModify?pageNum=${ qPageNum }&num=\${res.qnaVo.num}'">수정하기</button>
									<button type="button" class="btn" onclick="location.href='/customerCenter/qnaDelete?pageNum=${ qPageNum }&num=\${res.qnaVo.num}'">삭제하기</button>
								</div>
						`;
					}

					if(res.qnaVo.status == '답변완료') {
						str +=`
								<hr>
								<div class="text-left">\${res.reply.content}</div>
								<div class="text-center">
									<input type="hidden" name="replyNum" value="\${ res.reply.num }">
									<input type="hidden" name="refNum" value="\${ res.reply.reRef }">
									<button type="button" class="btn" onclick="qnaReplyModifyBtn(event)">수정하기</button>
									<button type="button" class="btn" onclick="">삭제하기</button>
								</div>
							`;
					}
					
					str +=`
							</td>
						</tr>
					`;
				tag.after(str);

			}
		});
	}
	function qnaReplyModifyBtn(event) {
		let replyNum = $(event.currentTarget).prev().prev('input[name=replyNum]').val();
		let refNum = $(event.currentTarget).prev('input[name=refNum]').val();
		console.log(replyNum);
		let isModify = confirm('답글을 수정하시겠습니까?');
		if(isModify) {
			pop = window.open('/customerCenter/qnaReplyModify?refNum='+refNum+'&replyNum='+replyNum+'&pageNum=${ qPageNum }','qna','dialog,top=100,left=400,width=570,height=750');
		}
	}
	
	function qnaReplyAddBtn(event){
		let qnaNum = $(event.currentTarget).parent().children('input[name="num"]').val();
		console.log(qnaNum)
		let isAnswer = confirm('답글을 작성하시겠습니까?');
		if(isAnswer){
			pop = window.open('/customerCenter/qnaReply?num='+qnaNum+'&pageNum=${ qPageNum }','qna','dialog,top=100,left=400,width=570,height=750');
		}
	}

	function updateQnaList() {
// 		$('#qnaContentBox').empty();
		location.href = '/customerCenter/qnaList?pageNum=${ qPageNum }';
	}
	
</script>
</body>
</html>


