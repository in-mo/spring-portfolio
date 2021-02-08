<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.1.js" integrity="sha256-VuhDpmsr9xiKwvTIHfYWCIQ84US9WqZsLfR4P7qF6O8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<style>
* {
	font-size: 15px;
}
h4 {
	font-size: 13px;
}

div.wrap>div {
	font-size: 12px;
	position: relative;
	float: left;
	margin-right: 5px;
	height: 30px;
	line-height: 30px;
	vertical-align: middle;
	input { line-height : 30px;
			margin: 0;
			padding: 0;
			padding-left: 5px;
			padding-right: 5px;
			width: 100px;
		}
}
button {
	clear: both;
	display: block;
	line-height: 40px;
	margin-top: 80px;
	background-color: #eee;
	color: #333;
	border: 1px solid #666;
	padding-left: 20px;
	padding-right: 20px;
	border-radius: 4px;
}

#ui-datepicker-div {
	top: -999px;
	border: 0;
	font-size: 14px;
}

.ui-datepicker-header {
	font-size: 13px;
}

.ui-datepicker-calendar {
	background-color: #fff;
	border: 1px solid #ddd;
	tr {
		font-size: 11px;
	}
}

</style>
</head>
<body>
	<div class="container-fluid">
		<form action="/search/result" method="get">
			<div class="wrap row text-center">

				<div class="col-md-2">
					<label>체크인</label>
					<input type="text" class="form-control" id="checkin" name="checkIn" readonly>
				</div>

				<div class="col-md-2">
					<label>체크아웃</label>
					<input type="text" class="form-control" id="checkout" name="checkOut" readonly>
				</div>

				<div class="col-md-2">
					<label>인원</label>
					<input type="number" class="form-control" name="headCount" required>
				</div>
				
				<div class="col-md-2">
					<label>검색(테스트)</label>
					<select name="address" class="form-control" required>
						<option disabled selected>지역을 선택해주세요</option>
						<option value="서울">서울</option>
						<option value="부산">부산</option>
						<option value="울산">울산</option>
					</select>
				</div>

				<div class="col-md-2">
					<br>
					<input type="submit" value="검색" class="btn">
				</div>

			</div>
		</form>
	</div>
<script>
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
	$('.btn').on('click', function(e) {
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