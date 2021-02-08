<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/css/hwh.css" rel="stylesheet" type="text/css"  media="all">

</head>
<%
//검색어 관련 파라미터값 가져오기. 없으면 null 리턴
String formbox1 = request.getParameter("form-box1"); // 목적지
switch(formbox1){
	case "1":
		formbox1 = "한국";
		break;
	case "2":
		formbox1 = "일본";
		break;
	case "3":
		formbox1 = "중국";
		break;
	case "4":
		formbox1 = "인도네시아";
		break;
	case "5":
		formbox1 = "미국";
		break;
	case "6":
		formbox1 = "태국";
}

String formbox21 = request.getParameter("form-box21"); // 체크인 년도
String formbox22 = request.getParameter("form-box22"); // 월
String formbox23 = request.getParameter("form-box23"); // 일

String formbox31 = request.getParameter("form-box31"); // 체크아웃 년도
String formbox32 = request.getParameter("form-box32"); // 월
String formbox33 = request.getParameter("form-box33"); // 일

String formbox4 = request.getParameter("form-box4"); // 여행객수

%>

<body>

<div class="wrap">
	<div>목적지 : <%=formbox1 %></div><br>
	<div>체크인 : 202<%=formbox21 %>년, <%=formbox22 %>월, <%=formbox23 %>일</div><br>
	<div>체크아웃 : 202<%=formbox31 %>년, <%=formbox32 %>월, <%=formbox33 %>일</div><br>
	<div>여행객수 : <%=formbox4 %>명</div><br>
</div>

</body>
</html>