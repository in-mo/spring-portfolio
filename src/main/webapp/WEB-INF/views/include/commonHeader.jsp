<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style>
div {
	padding: 10px;
}

.float_right {
	float: right;
}

.costTab {
	display: block;
/*  	position: sticky; */
/*  	z-index: 1; */
 	top: 0px;
 	background-color: white;
}

header {
	background-color: white;
}
</style>
<header>
	<div class="costTab">
		<a href="/">
			<span style="color: #ff385c"><i class="fab fa-airbnb fa-2x"><b> airbnb</b></i></span>
		</a>
		<c:choose>
			<c:when test="${ not empty id }">
				<span class="float_right"><a href="/user/show">${ id }님</a> | <a href="/user/logout">로그아웃</a></span>
			</c:when>
			<c:otherwise>
				<span class="float_right"><a href="/user/login">로그인</a> | <a href="/user/join">회원가입</a></span>
			</c:otherwise>
		</c:choose>
		 
	</div>
	
</header>
