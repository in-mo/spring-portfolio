<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
div{
	padding: 10px;
	border:1px solid black;
}
p {
	color: darkblue;
}
p:hover {
	text-decoration: underline;
	color: skyblue;
}
hr {
	border: 0;
	height: 1px;
	background: #d2d2d2;
}
</style>

</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<body>
<jsp:include page="/WEB-INF/views/include/commonHeader.jsp" />
<div class="container text-center" id="app">
	<div class="wrap row">
		<div><h4><b>회원정보</b></h4></div>
		<div class="col-md-4">
			<div>
				<div class="profileImageBox">
					<c:choose>
						<c:when test="${ not empty userVo.filename }">
							<img src="/upload/${ userVo.uploadpath }/${ userVo.uuid }_${ userVo.filename }" width="150" height="150">
						</c:when>
						<c:otherwise>
							<span><i class="fas fa-user fa-10x"></i></span>
						</c:otherwise>
					</c:choose>
				</div>
				<div v-show="!imageBtnShow">
					<button type="button" class="btn" v-on:click="imageBtnShow = true">프로필 사진 변경</button>
					
				</div>
				<div v-show="imageBtnShow">
					<form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
			            <input type="file" id="FILE_TAG" name="filename">
			            <a class="ui-shadow ui-btn ui-corner-all btn" href="javascript:uploadFile();">전송</a>
			            <button type="button" class="btn" onclick="setHiddenImageBtn()">취소</button>
			        </form>
				</div>
			</div>
			<hr>
			<div>
				인증완료
			</div>
			
			<div>
				${ userVo.email }
			</div>
			<hr>
			<div>
				<button class="btn">회원 탈퇴</button>
			</div>
		</div>
		
		<div class="col-md-8">
			<div>
				<div>
					${ userVo.id } 회원님
				</div>
				<div>
					가입일자 : <fmt:formatDate value="${ userVo.regDate }" pattern="yyyy년 MM월 dd일" />
				</div>
				<div>
					<div v-show="profileBox">
						<h4>프로필</h4>
						<div class="text-left">
							<p v-on:click="setShowNameInfo" id="nameInfo">이름 : ${ userVo.name }</p>
							<p v-on:click="setShowTelInfo" id="telInfo">전화번호 : ${ userVo.tel }</p>
							<p v-on:click="setShowPwdInfo">비밀번호 : **** </p>
						</div>
					</div>
					
					
					<div v-show="nameShow">
						<div>
							<h4>이름</h4>
							<hr>
							<input class="form-control" type="text" id="name" value="${ userVo.name }">
						</div>
						<div class="text-center">
							<button type="button" class="btn" v-on:click="setNameBtn">이름 변경</button>
							<button type="button" class="btn" v-on:click="setShowProfileBox">취소</button>
						</div>
					</div>
					
					<div v-show="telShow">
						<div>
							<h4>전화번호</h4>
							<hr>
							<input class="form-control" type="tel" placeholder="xxx-xxxx-xxxx" id="telIn" maxlength="13" onkeyup="noSpaceForm(this);" value="${ userVo.tel }">
						</div>
						<div class="text-center">
							<button type="button" class="btn" v-on:click="setTelBtn">전화번호 변경</button>
							<button type="button" class="btn" v-on:click="setShowProfileBox">취소</button>
						</div>
					</div>
					
					<div v-show="pwdShow">
						<div>
							<h4>비밀번호</h4>
							<hr>
							<label>현재 비밀번호</label> 
							<input type="password" class="form-control" name="currentPwd"><span id="msgPwd"></span><br>
							<label>새 비밀번호</label>
							<input type="password" class="form-control" name="newPwd1"><br>
							<label>비밀번호 확인</label>
							<input type="password" class="form-control" name="newPwd2"><span id="msgPass"></span><br>
						</div>
						<div class="text-center">
							<button type="button" class="btn" id="changePwdBtn" onclick="changePwd()" disabled>비밀번호 변경</button>
							<button type="button" class="btn" v-on:click="setShowProfileBox">취소</button>
						</div>
					</div>
				</div>
				
				
			</div>
			<hr>
			<div>
				<div>
					<a href="/user/MyReviews">후기 및 평점 보기 (${ cntOfReview })</a>
				</div>
				<div>
					<a href="/user/MyHosts">게시글 보기 (${ cntOfHost })</a>
				</div>
				<div>
					<a href="/travel/history">예약 내역 보기</a>
				</div>
			</div>
			<hr>
			<div>
				<button type="button" class="btn" onclick="location.href = '/content/write'">게시물 작성하기</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
<script src="/script/jquery-3.5.1.js"></script>
<script>
vue = new Vue ({
    el: '#app',
    data :{
    	imageBtnShow: false,
    	nameShow: false,
    	telShow: false,
    	pwdShow: false,
    	profileBox: true
    },
    methods:{
		setShowImageBtn: function() {
             this.imageBtnShow = true;
		},
		setNameBtn: function() {
			let name = $('#name').val();
			let vm = this;
			$.ajax({
				url: '/user/saveName',
				method: 'post',
				data: { name: name},
				success: function(res) {
					if(res.isSuccess) {
						alert('이름이 변경되었습니다.');
						$('#nameInfo').text('이름 : ' + res.name);
						vm.nameShow = false;
						vm.profileBox = true;
					} else {
						alert('다시 시도해주세요.');
					}
				}
			});
		},
		setTelBtn: function() {
			let tel = $('#telIn').val();
			let vm = this;
			$.ajax({
				url: '/user/saveTel',
				method: 'post',
				data: {tel: tel},
				success: function(res) {
					if(res.isSuccess) {
						alert('전화번호가 변경되었습니다.');
						$('#telInfo').text('전화번호 : ' + res.tel);
						vm.telShow = false;
						vm.profileBox = true;
					} else {
						alert('다시 시도해주세요.');
					}
				}
			});
		},
        setShowNameInfo: function() {
            this.nameShow = true;
            this.profileBox = false;
        },
        setShowTelInfo: function() {
            this.telShow = true;
            this.profileBox = false;
        },
        setShowPwdInfo: function() {
            this.pwdShow = true;
            this.profileBox = false;
        },
    	setShowProfileBox: function() {
        	this.nameShow = false;
        	this.telShow = false;
        	this.pwdShow = false;
        	this.profileBox = true;

        	$('span#msgPwd').html('');
       	}
    }
});
function uploadFile(){
	
    var form = $('#FILE_FORM')[0];
    var formData = new FormData(form);
    formData.append("fileObj", $("#FILE_TAG")[0].files[0]);

    $.ajax({
        url: '/user/saveImage',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
        success: function(result){
            if(result.isSuccess){
        		vue.imageBtnShow = false;
        		$('.profileImageBox').empty();

        		let str = `
    				<img src="/upload/\${result.uploadpath}/\${result.uuid}_\${result.filename}" width="150" height="150">
   				`;
    			$('.profileImageBox').prepend(str);
        		
            	alert("사진이 변경되었습니다.");
            } else {
            	alert("사진 변경이 실패하였습니다. 다시 시도해주세요.");
            }
        }
	});
}

function setHiddenImageBtn() {
	let uploadpath = '${userVo.uploadpath}';
	let uuid = '${userVo.uuid}';
	let filename = '${userVo.filename}';
	vue.imageBtnShow = false;
	$('.profileImageBox').empty();
	let str;

	if('${userVo.filename}' != '') {
		str = `
			<img src="/upload/\${ uploadpath }/\${ uuid }_\${ filename }" width="150" height="150">
		`;
	} else {
		str = `
			<span><i class="fas fa-user fa-10x"></i></span>
		`;
	}
	$('.profileImageBox').prepend(str);
}

//==================== 전화번호 =======================//

function noSpaceForm(obj) { // 공백사용못하게
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
        obj.focus();
        obj.value = obj.value.replace(/(\s*)/g, ""); // 공백제거
        return false;
    }
}

var autoHypenPhone = function(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }

    return str;
}


var phoneNum = document.getElementById('telIn');

phoneNum.onkeyup = function(){
	this.value = autoHypenPhone( this.value ) ;  
}

// ================== 비밀번호 ==================//
let pwdComform = false;
let newPwdComform = false;
$('input[name="currentPwd"]').keyup(function() {
	let pwd = $(this).val();

	if (pwd.length <= 8) {
		return;
	}

	// 아이디 세글자 부터는 Ajax로 아이디 중복체크하기
	$.ajax({
		url : '/user/pwdChk',
		data : {
			password : pwd
		},
		//method: 'GET',
		success : function(response) {
			pwdComform = response.isCoincide;
			if (response.isCoincide) {
				$('span#msgPwd').html(response.comment).css('color', 'green');
				if(pwdComform && newPwdComform) {
					$('#changePwdBtn').attr('disabled', false);
				}
			} else {
				$('span#msgPwd').html(response.comment).css('color', 'red');
				$('#changePwdBtn').attr('disabled', true);
			}
		}
	});
});

$('input[name="newPwd2"]').focusout(function() {
	let pass1 = $('input[name="newPwd1"]').val();
	let pass2 = $(this).val();

	if (pass1 == pass2) {

		if(pass2.length < 8 || pass2.length > 20) {
			$('#msgPass').html('8자리 ~ 20자리 이내로 입력해주세요.').css('color', 'red');
			return;
		}
		let num = pass2.search(/[0-9]/g);
		let eng = pass2.search(/[a-z]/ig);
		let spe = pass2.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		let currentPwd = $('input[name="currentPwd"]').val();
		if(pass2.search(/\s/) != -1){
			$('#msgPass').html('비밀번호는 공백 없이 입력해주세요.').css('color', 'red');
			return false;
		}else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			$('#msgPass').html('영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.').css('color', 'red');
			return false;
		} else if(currentPwd == pass2) {
			$('#msgPass').html('현재 비밀번호와 동일합니다.').css('color', 'red');
			return false;
		}
			
		
		$('#msgPass').html('패스워드 일치함').css('color', 'green');
		newPwdComform = true;
		if(pwdComform && newPwdComform) {
			$('#changePwdBtn').attr('disabled', false);
		}
	} else {
		$('#msgPass').html('패스워드 불일치').css('color', 'red');
		newPwdComform = false;
		$('#changePwdBtn').attr('disabled', true);
	}
});

function changePwd() {
	let newPwd = $('input[name="newPwd1"]').val();

	$.ajax({
		url: '/user/savePwd',
		data: { password: newPwd },
		method: 'post',
		success: function(res) {
			if(res.isSuccess) {
				alert('비밀번호가 변경되었습니다.');
				$('span#msgPwd').html('');
				$('span#msgPass').html('');

				$('input[name="currentPwd"]').val('');
				$('input[name="newPwd1"]').val('');
				$('input[name="newPwd2"]').val('');
				
				$('#changePwdBtn').attr('disabled', true);
				
			 	vue.pwdShow = false;
	            vue.profileBox = true;

	            pwdComform = false;
	            newPwdComform = false;
			} else {
				alert('다시 시도해주세요.');
			}
		}
	});
}
</script>
</body>
</html>