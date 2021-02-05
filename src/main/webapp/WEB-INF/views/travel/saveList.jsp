<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙박지 저장 목록</title>
<style>
.app {
	width: 860px;
	display: block;
	margin: 0 auto;
	position: relative;
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
.overflow {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 260px;
	height: 22px;
}
.container {
	display: grid;
	grid-template-columns: 280px 280px 280px;
}

p {
	border: solid orange 1px;	
}

a:hover {
	cursor: pointer;
}

</style>
</head>
<body>
	<div class="app" id="app">
		<div>메인</div>
		<div>여행</div>
		<div>저장 목록</div>
		<hr>
		<div class="container">
			<c:if test="${ not empty hostList }">
				<c:forEach var="host" items="${ hostList }">
					<div class="item">
						<p class="overflow"><a href="/content/info?num=${ host.num }">${ host.title }</a></p>
						<a href="/content/info?num=${ host.num }">
							<img src="/upload/${ host.imageVo.uploadpath }/${ host.imageVo.uuid }_${ host.imageVo.filename }" width="250" height="250">
						</a>
						<p>평점/후기(${ host.reviewCount })</p>
						<p class="overflow">${ host.hostComment }</p>
						<input type="hidden" value="${ host.saveVo.hostNum }">
						<button type="button" v-on:click="saveDelete($event)">삭제하기</button>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<hr>
		<div>저장 목록을 찾을 수 없나요? 도움말 센터를 방문하세요.</div>
	</div>
	<script src="/script/jquery-3.5.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
	<script>
		new Vue({
			el: '#app',
			methods: {
				saveDelete: function(e) {
					let num = $(e.currentTarget).prev().val();
					let removeTag = $(e.currentTarget).parent();
					console.log(removeTag);
					let isDelete = confirm('정말 삭제하시겠습니까?');
					if(isDelete) {
						$.ajax({
							url: '/travel/saveDelete',
							data: { num: num },
							success: function(res) {
								console.log(res);
								if(res == 'OK') {
									removeTag.remove();
								}
							}
						});
					}
				}
			}
		});
	
	</script>
</body>
</html>