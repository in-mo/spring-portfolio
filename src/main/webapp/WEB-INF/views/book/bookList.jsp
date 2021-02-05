<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     <link rel="stylesheet" type="text/css" href="/css/style.css"> -->
    <title>예약정보-bookList</title>
<style>
.app {
	width: 1020px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -450px;
	margin-left: -450px;
}

div {
	padding: 10px;
	border: solid red 1px;
}

span {
	border: solid green 1px;
}

table, td, tr {
	border: solid 1px blue;
}

.verticality {
	display: inline-flex;
	flex-direction: column;
}

.horizontal {
	display: inline-flex;
	flex-direction: row;
}

hr {
	border: 0;
	height: 1px;
	background: #d2d2d2;
}

ul{
   list-style:none;
   }

.costTab {
    display: inline-block;
    position: sticky;
    top: 10px;
}
</style>
</head>

<body>
    <div class="app verticality">
        <div class="horizontal">
            <a href=""><  </a>
            <h1>예약정보</h1>
        </div>

        <div class="verticality">

            <div class="verticality">
                 <h2>${ bookVo.hostVo.id }(호스트) 님의 숙소</h2>
                 <div class="horizontal">
                    <div class="verticality">
                         <div>체크인</div>
                         <div>${ bookVo.checkIn }</div>
                         <div>오후 2:00</div>
                    </div>
                    <div class="verticality">
                        <div>체크아웃</div>
                        <div>${ bookVo.checkOut }</div>
                        <div>오후 12:00</div>
                    </div>
                 </div>
            </div>

            <div class="verticality">
                <h2>결제정보</h2>
                <div class="verticality">
                    <table>
                        <tr>
                            <th>결제금액</th>
                            <td>${ bookVo.cost } 원</td>
                        </tr>
                        <tr>
                            <th>결제수단</th>
                            <td>카카오페이</td>
                        </tr>
                        <tr>
                            <th>결제자이름</th>
                            <td>${ bookVo.id }</td>
                        </tr>
                        <tr>
                            <th>결제시간</th>
                            <td>${ bookVo.regDate }</td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="verticality">
                <h2>찾아가는 방법</h2>
                <div class="verticality">
                    <div>
                        <div>주소</div>
                        <div>${ bookVo.hostVo.address1 } ${ bookVo.hostVo.address2 }</div>
                    </div>
                    <div><a href="">주소 복사하기</a></div>
                </div>
            </div>

            
            <div class="verticality">
                <h2>숙소</h2>
                <div class="verticality">
                    <div>
                        <a href="/content/info?num=${ bookVo.noNum }">숙소보기</a>
                    </div>
                </div>
            </div>


            <div class="verticality">
                <h2>에어비앤비 지원</h2>
                <div class="verticality">
                    <div><a href="">도움말 센터</a></div>
                    <div><a href="">호스트에게 전화하기</a></div>
                </div>
            </div>
        </div>


    </div>
</body>
</html>