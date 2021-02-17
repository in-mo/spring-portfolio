<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록</title>
<style>
.inputOutLine {
	border:none;
	border-right:0px;
	border-top:0px;
	boder-left:0px;
	boder-bottom:0px;
}
hr {
	border: 0;
	height: 1px;
	background: #d2d2d2;
}

.table {
	width:800px;
	padding:5px;
	margin:20px;
}
#wrap {
	width:1020px;
	margin:0;
	margin-right: auto;
	margin-left: auto;
}
.contentWriteForm {
	margin:50px;
	padding:20px;
}
.float_right {
	float: right;
}
div {
	padding: 10px;
}
</style>
</head>
<body style="background-color: #f2f2f2;">
	<div id="wrap" style="background-color: white;">
		<jsp:include page="/WEB-INF/views/include/commonHeader.jsp" />
		<div>
			<h2>자주 하는 질문</h2>
		</div>
		<hr>
		<form action="/customerCenter/faqWrite" class="form2" method="post">
		<input type="hidden" name="pageNum" value="${ pageNum }">
			<div class="contentWriteForm">
				<div class="txt3">
					<h2>FAQ 등록</h2><hr>
					<table class="table">
					<tr>
						<th class="write">작성자</th>
						<td>
							<input type="text" class="inputOutLine" name="id" value="관리자" readonly>
						</td>
					</tr>
					<tr>
						<th class="write">제목</th>
						<td>
							<input type="text" style="width: 98%" name="subject" v-model="title" required>
						</td>
					</tr>
					<tr>
						<th class="write">내용</th>
						<td>
							<textarea maxlength="500" rows="30" cols="40" style="resize: none; width: 98%; height: 150px;" name="content" v-model="content" required></textarea>
						</td>
					</tr>
					</table>		
				</div>
				<div class="float_right">
					<input type="submit" value="글쓰기" class="btn">
					<input type="button" value="목록" class="btn" onclick="location.href = '/customerCenter/faqList?pageNum=${ pageNum }'">
				</div>
			</div>
		</form>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	<script>
		new Vue({
			el:'#wrap',
			data: {
				title: '',
				content:''
			},
			methods: {
				
			},
			watch: {
				title: function() {
					if(this.title.length > 50)
						this.title = this.title.substr(0,50);
				},
				content: function() {
					if(this.content.length > 500)
						this.content = this.title.substr(0,500);
				}
			},
			computed: {
				titleCount: function() {
					return 50 - this.title.length;
				},
				contentCount: function() {
					return 500 - this.content.length;
				}
			}
		});
	</script>


</body>
</html>


