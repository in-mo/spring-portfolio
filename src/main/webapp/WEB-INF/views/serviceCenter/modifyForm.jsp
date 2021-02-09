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
<jsp:include page="/WEB-INF/views/include/commonHeader.jsp" />
<div id="wrap">
	
	<div class="txt2">
		<h2>자주 하는 질문</h2>
		<hr>
	</div>
	
	<form action="/customerCenter/modify" class="form2" method="post">
	<input type="hidden" name="pageNum" value="${ pageNum }">
	<input type="hidden" name="num" value="${ serviceCenterVo.num }">
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
						<input type="text" style="width: 98%" name="subject" v-model="title">
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
				<input type="submit" value="글수정" class="btn">
				<input type="button" value="목록으로" class="btn" onclick="location.href = '/customerCenter/list?pageNum=${ pageNum }'">
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
			title: '${ serviceCenterVo.subject }',
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
	// content 설정
	let content = '${ serviceCenterVo.content }';
	content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
	vue.content = content;
</script>
</body>
</html>


