<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
<!-- <script src="/script/jquery-3.5.1.js"></script> -->
<title>검색 테스트</title>
<style>
button {
	margin: 0 5px;
	padding: 5px 10px;
	border: 1px solid lightgray;
	border-radius: 15px;
	color: black;
}

strong {
	font-size: 1.5em;
}

.flex {
	display: flex;
	flex-flow: row wrap;
	justify-content: space-between;
}
.flex span {
	padding: 10px;
}
.left {
	margin-left: 30px;
}
.costTab {
	display: inline-block;
 	position: sticky;
 	top: 10px;
}
td {
	padding: 0 10px;
}
table {
	margin: 20px 0;
}
#page_control {
	text-align:center;
	margin:20px 0 0 0;
	margin-right: auto;
	margin-left: auto;

}
#page_control a {
	padding:2px 5px;
	text-decoration: none;
	color: #333;
	margin:0 5px;

} 

#page_control a:hover {
	font-weight: bold;
	color: #F90;
	text-decoration: underline;
}

/* 커스텀 오버레이 테스트 css
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
*/
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6" style="padding:20px;">
				<div>장소는 ${address}<br>
					${count}개 이상의 숙소 / ${checkIn} - ${checkOut} / 게스트 ${headCount}명
					<h3>근처의 숙소</h3>
					<br>
					<button class="btn">이동 시간</button>
					<button class="btn">숙소 유형</button>
					<button class="btn">요금</button>
					<button class="btn">필터 추가하기</button>
				</div>
				<br>
				<div>
					예약하기전에 코로나19 관련 여행 제한 사항을 확인하세요<a href="help.jsp">자세히 알아보기</a>
				</div>
				<br>
				<br>
				<div>
					<span><strong>지역</strong></span>
					<button class="pull-right">&#62;</button>
					<button class="pull-right">&#60;</button>
				</div>
				<br>
				<div class="flex">
					<div>
						<img src="/images/yadon.jpg">
						<div>평점</div>
						<div>숙소 이름</div>
						<div>요금</div>
					</div>

					<div>
						<img src="/images/yadon.jpg">
						<div>평점</div>
						<div>숙소 이름</div>
						<div>요금</div>
					</div>

					<div>
						<img src="/images/yadon.jpg">
						<div>평점</div>
						<div>숙소 이름</div>
						<div>요금</div>
					</div>
				</div>
				
<!-- 				<hr> -->
<!-- 				<h2>기타 인기 여행지</h2> -->
<!-- 				<div class="flex"> -->
<!-- 					<span>강릉시</span> <span>여수시</span> <span>홍천군</span> <span>통영시</span> -->
<!-- 				</div> -->

<!-- 				<div class="flex"> -->
<!-- 					<span>화순군</span> <span>담양군</span> <span>포항시</span> <span>천안시</span> -->
<!-- 				</div> -->

				<hr>
				<div>
					<h3>100개 이상의 모든 숙소 둘러보기</h3>
					
						<c:choose>
						<c:when test="${ not empty searchList }"><%-- ${ pageDto.count gt 0 } --%>
							
							<c:forEach var="search" items="${ searchList }">
							<table>
								<tr>
									<td rowspan="6">
										<img src="/images/yadon.jpg">
									</td>
								</tr>
								
								<tr>
									<td>숙소 이름 / 장소 : ${ search.address }</td>
								</tr>
								
								<tr>
									<td>옵션</td>
								</tr>
								
								<tr>
									<td>별점</td>
								</tr>
								
								<tr>
									<td>하트</td>
								</tr>
								
								<tr>
									<td>요금</td>
								</tr>	
							</table>
							</c:forEach>
							
						</c:when>		
						<c:otherwise>
							<tr>
								<td>게시판 글 없음</td>
							</tr>
						</c:otherwise>
						</c:choose>
				</div>
				
			</div>

			<div class="col-md-6 costTab" style="padding:0">
				<div id="map" style="width: 100%; height: 900px;"></div>
			</div>
			
		</div>
		
	</div>


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7611f9821af13e87e5eddada214e651&libraries=services"></script>

<script>
	var infowindow = new kakao.maps.InfoWindow({zIndex:1, removable:true});

	var mapContainer = document.getElementById('map'); // 지도를 표시할 div
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 8 // 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 지역 이름 리스트 배열에 저장
	var list = [];
// 	for( var search of ${ searchList } ) {
// 		list.push(${ search.address });
// 	}
	<c:forEach var="search" items="${ searchList }">
		list.push("${search.address}");
	</c:forEach>
	
	console.log(list);

	// ===========================================
	// 비동기이기 때문에 콜백이 언제 실행될지는 서버에서 어떤 요청을 먼저 처리해서 응답을 주느냐에 따라 달렸음
	// 안그러면 계속 배열의 순서가 달라짐
	
	// 지역 좌표 리스트 배열에 저장
	var positions = new Array();
	
	for (let i = 0; i < list.length; i++) {
		geocoder.addressSearch(list[i], function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        positions.push(new kakao.maps.LatLng(result[0].y, result[0].x));
			     console.log(positions[i]); 
		     }
	     });
	}
// 	console.log(positions);
	// ===========================================

	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

	// 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

	geocoder.addressSearch('${address}', function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
			for (let i = 0; i < list.length; i++) {
				// 마커를 생성합니다
				let marker = new kakao.maps.Marker({
					map: map, // 마커를 표시할 지도
					position: positions[i], // 마커를 표시할 위치
					title : list[i], // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage // 마커 이미지 
				});

				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				kakao.maps.event.addListener(marker, 'click', function() {
			        infowindow.setContent("<img src='/images/yadon.jpg' style='width:200px; height:200px;'><br>" + 
			        					  "<div style='padding:5px;font-size:12px;'>" + list[i] + "</div>");
			        infowindow.open(map, marker);
			        console.log(positions[i]);
			    });

				/* 커스텀 오버레이
				var content = '<div class="wrap">' + 
	            '    <div class="info">' + 
	            '        <div class="title">' + 
	            '            카카오 스페이스닷원' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="body">' + 
	            '            <div class="img">' +
	            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="desc">' + 
	            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
	            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
	            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
				            
				// 마커 위에 커스텀오버레이를 표시합니다
				// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
				var overlay = new kakao.maps.CustomOverlay({
				    content: content,
				    map: map,
				    position: marker.getPosition()
				});

				kakao.maps.event.addListener(marker, 'click', function() {
					console.log('a');
				    overlay.setMap(map);
				});

				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 	
				function closeOverlay() {
				    overlay.setMap(null);     
				}
				*/
			}
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		}
	});

</script>
</body>
</html>