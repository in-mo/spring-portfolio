<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정</title>
<style>
/* div { */
/* 	padding: 5px; */
/* 	border: solid red 1px; */
/* } */
.qnaContent {
	margin:50px;
	padding:20px;
}
#wrap {
	width:1020px;
	margin:0;
	margin-right: auto;
	margin-left: auto;
	min-height:780px;
}
.float_right {
	float: right;
}
.modifyTable {
	width:800px;
	padding:5px;
	margin:20px;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/include/commonHeader.jsp" />
<div id="wrap">
	
	<div>
		<h2>QnA 게시판</h2>
		<hr>
	</div>
	
	<form action="/customerCenter/qnaModify" method="post">
	<input type="hidden" name="pageNum" value="${ pageNum }">
	<input type="hidden" name="num" value="${ qnaVo.num }">
		<div class="qnaContent">
			<div>
				<h2>QnA 수정</h2><hr><br>
				<table class="modifyTable table">
				<tr>
					<th>작성자</th>
					<td>
						${ qnaVo.id }
					</td>
				</tr>
				<tr>
					<th class="write">유형</th>
					<td>
						<select name="type" v-model="type" required>
							<option disabled>문의 유형을 선택해주세요</option>
							<option value="문의">문의</option>
							<option value="환불">환불</option>
							<option value="호스트">호스트</option>
							<option value="예약">예약</option>
							<option value="기타문의">기타문의</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" style="width: 98%" name="subject" v-model="title" required>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea maxlength="500" rows="30" cols="40" style="resize: none; width: 98%; height: 300px;" name="content" v-model="content" required></textarea>
					</td>
				</tr>
				</table>
				<hr>		
			</div>
			<div class="float_right">
				<input type="submit" value="글수정" class="btn">
				<input type="button" value="글목록" class="btn" onclick="location.href = '/customerCenter/qnaList?pageNum=${ pageNum }'">
			</div>
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
<script>
	vue = new Vue({
		el:'#wrap',
		data: {
			title: '${ qnaVo.subject }',
			content:'',
			type: '${ qnaVo.type }'
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
	// content 설정
	let content = '${ qnaVo.content }';
	content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
	vue.content = content;
</script>
</body>
</html>


