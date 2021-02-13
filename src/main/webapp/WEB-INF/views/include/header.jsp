<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#login {
	float: right;
}
#logo {
	float:left;
}
#top_menu {
	margin: 30px 0 0 0;
	float: right;
}
#top_menu ul {
	list-style: none;
	margin: 0;
}
#top_menu ul li {
	float: left;
	margin: 5px;
}
header {
	height: 130px;
	padding: 10px;
	border: solid green 1px;
}
.clear {
	height: 10px;
	clear:both;
}
</style>
<header>
	<div id="login">
	<c:choose>
		<c:when test="${ not empty id }">
			<a href="/user/show">${ id }님</a> | <a href="/user/logout">로그아웃</a>		
		</c:when>
		<c:otherwise>
			<a href="/user/login">로그인</a>
	 	| <a href="/user/join">회원가입</a>
		</c:otherwise>
	</c:choose>
		
	</div>
	<div class="clear"></div>
	<div id="logo">
		<a href="/">
		<img src="/images/logo2.png">
		</a>
	</div>
	<div id="top_menu">
		<ul>
			<li><a href="#d">검색</a></li>
			<li><a href="#b">종류</a></li>
			<li><a href="#c">리뷰</a></li>
		</ul>
	</div>
</header>
    