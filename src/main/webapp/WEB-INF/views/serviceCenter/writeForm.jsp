<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<link href="/css/hwh.css" rel="stylesheet" type="text/css"  media="all">

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
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/commonHeader.jsp" />
<div id="wrap">
	
	<div class="txt2">
		<h2>자주 하는 질문</h2>
		<hr>
	</div>
	
	<form action="/customerCenter/write" class="form2" method="post">
	<input type="hidden" name="pageNum" value="${ pageNum }">
		<div class="row4">
			<div class="txt3">
				<h2>QnA 등록</h2><hr>
				<table id="table1">
				<tr>
					<th class="write">작성자</th>
					<td class="float_left">
						<input type="text" class="inputOutLine" name="id" value="관리자" readonly>
					</td>
				</tr>
				<tr>
					<th class="write">제목</th>
					<td class="float_left">
						<input type="text" style="width: 98%" name="subject" v-model="title" required>
					</td>
				</tr>
				<tr>
					<th class="write">내용</th>
					<td class="float_left">
						<textarea maxlength="500" rows="30" cols="40" style="resize: none; width: 99%" name="content" v-model="content" required></textarea>
					</td>
				</tr>
				</table>		
			</div>
			<br><br>
			<div class="float_right">
				<input type="submit" value="글쓰기" class="btn">
				<input type="button" value="목록" class="btn" onclick="location.href = '/customerCenter/list?pageNum=${ pageNum }'">
			</div>
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
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


