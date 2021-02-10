<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의</title>
<style>
.app {
	width: 500px;
	margin: auto;
	display: flex;
	flex-direction: column;
    background-color:white; border: 1px solid #d2d2d2; padding: 20px;
}

div {
/* 	border: 1px solid red; */
	padding: 10px;
}

.Horizontal {
	display: inline-flex;
	flex-direction: row;
}
.verticality {
	display: inline-flex;
	flex-direction: column;

}
.btnTag{
	width:200px; 
	height: 50px;
	margin-top: 10px;
	margin-bottom:10px; 
	background-color: black; 
	color: white;
	font-size: 20px;
}
.btnTage:hover {
	cursor: pointer;
}
td{
	padding: 5px;
}
</style>
</head>
<body>
	<div class="app verticality">
		<h4>QnA 답변</h4>
		<div style="padding: 0px;">
			<hr style="border: 0; height: 1px; background-color: #d2d2d2;">
		</div>
		
		<form>
			<div>
				<table>
					<tr>
						<td>문의 유형</td>
						<td>
							<div>${ qnaVo.type }</div>
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<div>${ qnaVo.id }</div>
						</td>
					</tr>
					
					<tr>
						<td>제목</td>
						<td>
							<div>${ qnaVo.subject }</div>
						</td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td>
							<div>${ qnaVo.content }</div>
						</td>
					</tr>
				</table>
			</div>
			<hr style="border: 0; height: 1px; background-color: #d2d2d2;">
			<div>
				<p><b>답변 안내</b></p>
				<table>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="content" maxlength="500" placeholder="내용 입력" style="resize: none; width: 300px; height: 120px;"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<hr style="border: 0; height: 1px; background-color: #d2d2d2;">
			<div style="text-align: center;">
				<input type="reset" class="btnTag" value="취소">
				<c:choose>
					<c:when test="${ form eq 'write' }">
						<input type="button" class="btnTag" id="write" value="작성하기">				
					</c:when>
					<c:otherwise>
						<input type="button" class="btnTag" id="modify" value="수정하기">
					</c:otherwise>
				</c:choose>
			</div>
		</form>
	</div>
<script src="/script/jquery-3.5.1.js"></script>
<script>
	
// 	// 수정일 시 초기 값 설정
<%-- 	let form = '<%=form%>'; --%>
// 	if(form != 'write') {
<%-- 		let type = '<%=qnaVo.getType()%>'; --%>
<%-- 		let admin = '<%=qnaVo.getId()%>'; --%>
<%-- 		let content = '<%=qnaVo.getContent()%>'; --%>
// 		content = content.replace(/<br>/gi,'\n');
// 		$('input[name="type"]').val([type]);
// 		$('input[name="admin"]').val(admin);
// 		$('textarea[name="content"]').val(content);
// 	}
	
// 	// 수정이벤트
// 	$('#modify').click(function() {
// 		let admin = $('input:text[name="admin"]').val();
// 		let content = $('textarea[name="content"]').val();
<%-- 		let no_num = <%=prevQnaVo.getNum()%>; --%>
// 		let type = '답변';
<%-- 		let title = '<%=prevQnaVo.getNum()%> 번 글의 답글'; --%>
// 		content = content.replace(/<br>/gi,'\n');
		
// 		if(admin.length == 0){
// 			alert('담장자 이름을 입력해주세요');
// 			return false;
// 		}
		
// 		if(content.length == 0){
// 			alert('내용을 입력해주세요');
// 			return false;
// 		}
		
// 		let isModify = confirm('상품 문의글을 수정하시겠습니까?');
// 		$.ajax({
// 			url: 'updateQnaInfoPro.jsp',
<%-- 			data: { no_num: no_num, writer : admin, title: title, content: content, type: type, article: '<%=article%>', quaNum: <%=qnaNum%>}, --%>
// 			success:function(res){
// 				call_parent();
// 				window.close();
// 			}
// 		});
// 	});
	
	// 작성 이벤트
	$('#write').click(function() {
		let content = $('textarea[name="content"]').val();
		let reRef = ${ qnaVo.num };
		let reLev = 1;
		
		if(content.length == 0){
			alert('내용을 입력해주세요');
			return false;
		}
		
		let isWrite = confirm('상품 문의글을 작성하시겠습니까?');
		if(isWrite){
			$.ajax({
				url: '',
				data: { content: content, reRef: reRef, reLev: reLev },
				method: 'post',
				success:function(res){
					if(res.isSuccess)
						window.close();
					call_parent();
				}
			});
		}
	});

	// 컨텐츠 창의 함수호출
	function call_parent(){
		try{
			opener.updateQnaList();
		}catch (e) {
			alert('다시 시도해주세요');
			window.close();
		}
	}
	
</script>
</body>
</html>