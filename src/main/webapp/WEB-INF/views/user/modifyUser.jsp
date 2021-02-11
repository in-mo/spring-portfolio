<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정됨</title>
<style>
#top {
    border: red 1px solid;
    padding: 10px;
 }
#middle {
    border: red 1px solid;
    padding: 10px;
 }
#idAndpass {
    border: red 1px solid;
    padding: 10px;
}
#info {
    border: red 1px solid;
    padding: 10px;
}
    </style>
</head>
<body>
	<div id="top">
        <h1>수정된 회원정보</h1>
        <c:if test="${ not empty id }">
        	<c:if test="${ id eq userVo.id }">
	        	<div id="middle">
		        	<form action="/modify/modifyUser" method="Post" id="modifyFrm">
			            <div id="idAndpass">
			            	<div id="id">
			            		<label for="">아이디</label>
			            		<label>${ userVo.id }</label>
			            	</div>
			            </div>
			            
			            <div id="info">
			                <div id="name">
			                    <label for="">이름</label>
			                    <label>${ userVo.name }</label>
			                </div>
			                <div id="email">
			                    <label for="">이메일</label>
			                    <label>${ userVo.email }</label>
			                </div>
			                <div id="phone">
			                    <label for="">핸드폰</label>
			                    <label>${ userVo.tel }</label>
			                </div>
			            </div>
		            </form>
		        </div>
	        </c:if>
        </c:if>
    </div>
    
</body>
</html>