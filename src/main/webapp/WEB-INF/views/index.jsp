<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.1.js" integrity="sha256-VuhDpmsr9xiKwvTIHfYWCIQ84US9WqZsLfR4P7qF6O8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="/css/hwh.css" rel="stylesheet" type="text/css"  media="all">

<style>
.overflow {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: pre;
	width: 300px;
	height: 220px;
}
.float_right {
	float: right;
}

.reviewComment:hover {
	cursor: pointer;
}

</style>
</head>
<body>
<div id="wrap">

	<%-- header 영역 --%>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<div class="clear"></div>
	
	<section id="a">
		<div class="txt">
			Explore The Beautiful World
		</div>
		
	</section>
	
	<div class="clear"></div>

	<section id="d">
		<div class="abc">
			지금 바로 출발하세요!
			<br>
		</div>
	</section>
	
	<form action="/search/result" method="get">
		<div class="container2">
				<div class="search">
					<label>체크인</label>
					<input type="text" class="form-control" id="checkin" name="checkIn" readonly>
				</div>

				<div class="search">
					<label>체크아웃</label>
					<input type="text" class="form-control" id="checkout" name="checkOut" readonly>
				</div>

				<div class="search">
					<label>인원</label>
					<input type="number" class="form-control" name="headCount" min=1 required>
				</div>
				
				<div class="search">
					<label>검색</label>
					<select name="address" class="form-control" id="location" required>
						<option value="" disabled selected>지역을 선택해주세요</option>
					</select>
					<br><br>
					<input type="submit" value="검색" class="searchBtn">
				</div>
		</div>
	</form>	
	
	<section id="b">
		<div class="clear"></div>
		<div class="txt2">
			<h2>호텔 종류</h2>
		</div>
		
		<div class="row1">
			<c:forEach var="host" items="${ hostList }">
				<c:if test="${ host.classification eq '부티크 호텔' }">
					<div class="contentInfo" onclick="location.href='/content/info?num=${ host.num }'">
						<img src="/upload/${ host.imageVo.uploadpath }/${ host.imageVo.uuid }_${ host.imageVo.filename }" width="480" height="400">
						<div class="txt3">
							<h3>호텔</h3>
							<div class="txt4">
								<p>${ host.title }</p>
								<p><pre>${ host.hostComment }</pre></p>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${ host.classification eq '주택' }">
					<div class="contentInfo" onclick="location.href='/content/info?num=${ host.num }'">
						<img src="/upload/${ host.imageVo.uploadpath }/${ host.imageVo.uuid }_${ host.imageVo.filename }" width="480" height="400">
						<div class="txt3">
							<h3>주택</h3>
							<div class="txt4">
								<p>${ host.title }</p>
								<p><pre>${ host.hostComment }</pre></p>
							</div>
						</div>
					</div>
				</c:if>
				
				<c:if test="${ host.classification eq '아파트' }">
					<div class="contentInfo" onclick="location.href='/content/info?num=${ host.num }'">
						<img src="/upload/${ host.imageVo.uploadpath }/${ host.imageVo.uuid }_${ host.imageVo.filename }" width="480" height="400">
						<div class="txt3">
							<h3>아파트</h3>
							<div class="txt4">
								<p>${ host.title }</p>
								<p><pre>${ host.hostComment }</pre></p>
							</div>
						</div>
					</div>
				</c:if>
				
				<c:if test="${ host.classification eq '독특한 숙소' }">
					<div class="contentInfo" onclick="location.href='/content/info?num=${ host.num }'">
						<img src="/upload/${ host.imageVo.uploadpath }/${ host.imageVo.uuid }_${ host.imageVo.filename }" width="480" height="400">
						<div class="txt3">
							<h3>독특한 숙소</h3>
							<div class="txt4">
								<p>${ host.title }</p>
								<p><pre>${ host.hostComment }</pre></p>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>
	
	<section id="c">
		<div class="clear"></div>
		<div class="txt2">
			<h2>리뷰</h2>
		</div>
		
		<div class="row2">
			<c:choose>
				<c:when test="${ reviewList ne null }">
					<c:set var="loop_flag" value="false" />
					<c:forEach var="review" items="${ reviewList }" varStatus="status">
						<div>
							<span>${ review.id }</span> ㆍ
							<span style="color: #ff385c"><i class="fas fa-star"></i></span>
							<span>${ review.score }</span>
							<span class="float_right"><fmt:formatDate value="${ review.regDate }" pattern="yyyy-MM-dd" /></span>
							<div class="overflow reviewComment" onclick="location.href = '/content/info?num=${ review.noNum }'">
								<pre>${ review.comment }</pre>
							</div>
						</div>
						<c:if test="${status.index eq 2 }">
							<c:set var="loop_flag" value="true" />
						</c:if>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					등록된 후기가 없습니다.
				</c:otherwise>
			</c:choose>
		</div>
		
	</section>
	
	<div class="clear"></div>
	<%-- footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
</div>

<script>
	let strLocationList = '${ locationList }';
	let str = strLocationList.substring(1, strLocationList.length-1);
	str = str.replace(/ /g,"")
	let locationList = str.split(',');

	for (var key in locationList) { 
		let option = $('<option value="' +locationList[key] + '">' + locationList[key] + '</option>');
		$('#location').append(option);
	}

	var rangeDate = 31; // set limit day
	var setSdate, setEdate;
	$("#checkin").datepicker({
		dateFormat : 'yy-mm-dd',
		minDate : 0,
		onSelect : function(selectDate) {
			var stxt = selectDate.split("-");
			stxt[1] = stxt[1] - 1;
			var sdate = new Date(stxt[0], stxt[1], stxt[2]);
			var edate = new Date(stxt[0], stxt[1], stxt[2]);
			edate.setDate(sdate.getDate() + rangeDate);

			$('#checkout').datepicker('option', {
				minDate : selectDate,
				beforeShow : function() {
					$("#checkout").datepicker("option", "maxDate", edate);
					setSdate = selectDate;
					console.log(setSdate)
				}
			});
			//checkout 설정
		}
	//checkin 선택되었을 때
	});

	$("#checkout").datepicker({
		dateFormat : 'yy-mm-dd',
		onSelect : function(selectDate) {
			setEdate = selectDate;
			console.log(setEdate)
		}
	});
	$('.searchBtn').on('click', function(e) {
		if ($('input#checkin').val() == '') {
			alert('시작일을 선택해주세요.');
			$('input#checkin').focus();
			return false;
		} else if ($('input#checkout').val() == '') {
			alert('종료일을 선택해주세요.');
			$('input#checkout').focus();
			return false;
		}

		var t1 = $('input#checkin').val().split("-");
		var t2 = $('input#checkout').val().split("-");
		var t1date = new Date(t1[0], t1[1], t1[2]);
		var t2date = new Date(t2[0], t2[1], t2[2]);
		var diff = t2date - t1date;
		var currDay = 24 * 60 * 60 * 1000;
		if (parseInt(diff / currDay) > rangeDate) {
			alert('로그 조회 기간은 ' + rangeDate + '일을 초과할 수 없습니다.');
			return false;
		}
	});
	//조회 버튼 클릭
</script>

</body>
</html>


