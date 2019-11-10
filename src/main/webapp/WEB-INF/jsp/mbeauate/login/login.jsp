<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="description" content="">
<meta name="keywords" content="">
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/reset.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/input.css">
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.11.2.min.js"></script>
</head>
<body>
	<div id="wrap">
		<header>
			<jsp:include page="/WEB-INF/jsp/mbeauate/common/top.jsp" flush="false" />
		</header>
		<div id="contents" class="contents">
			<section class="section">
				<!-- 로고 -->
				<div class="logo-b"></div>
				<!-- 로그인-->
				<form:form commandName="loginVO" id="loginVO" name="loginVO" method="post" action="${basePath}/login/a/n/afterLogin.do" onsubmit="return false;">
					<fieldset>
						<legend>로그인</legend>
							<div class="member-join">
								<div class="rcont">
									<ul class="input-area">
										<li>
											<form:input path="emailAddr" id="emailAddr" placeholder="이메일" title="이메일을 입력해주세요." maxlength="21" />
											<span class="emp" id="emailAddrEmp"></span>
										</li>
										<li>
											<form:password id="usrPw" path="usrPw" onkeypress="if(event.keyCode==13){fn_login();} " placeholder="비밀번호" title="비밀번호를 입력해주세요." maxlength="21" />
											<span class="emp" id="usrPwEmp"></span>
										</li>
									</ul>
									<div class="btn-area">
										<button class="btn2" type="button" onclick="fn_login();">
											<span>로그인</span>
										</button>
									</div>
								</div>
							</div>
					</fieldset>
				</form:form>
				<!-- //로그인---->
				<!--회원가입 / 비밀번호 찾기-->
				<div class="login-box1">
					<span><a href="${basePath}/user/a/t/insertUser.do">회원가입</a></span>
					<span><a href="${basePath}/login/a/n/selectUserPwdChange.do">비밀번호 찾기</a></span>
				</div>
				<!--하단 이미지 영역-->
				<div class="login_bn">
					<img src="${imagePath}/temp/login_bn.jpg" alt="" />
				</div>
			</section>
		</div>
	</div>
	<!--메뉴-->
	<div id="floating_menu">
		<%@ include file="/WEB-INF/jsp/mbeauate/common/menu.jsp"%>
	</div>
	<!--// 메뉴-->
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
<script type="text/javascript">
//로그인
var isValid;

var fn_login = function() {
	isValid = true;
	$("#emailAddrEmp").text("");
	$("#usrPwEmp").text("");
	if(!$.trim($("#emailAddr").val())) {
		$("#emailAddr").parent().find("span").text("이메일을 입력해 주세요").show();
		isValid = false;
	}
	if(!$.trim($("#usrPw").val())) {
		$("#usrPw").parent().find("span").text("패스워드 입력해 주세요").show();
		isValid = false;
	}
	if (!TypeChecker.email($("#emailAddr").val())) {
		$("#emailAddr").parent().find("span").text("이메일은 "+TypeChecker.emailText).show();
		isValid = false;
	}
	if(!isValid){
		return;
	}
	var emailAddr = $("#emailAddr").val();
	var usrPw = $("#usrPw").val();
	
	//아이디체크
	$.ajax({
		url: "${basePath}/login/a/n/selectIdPwdcheck.do",
		type: 'POST',
		dataType : "json",
		data : {"emailAddr" : emailAddr, "usrPw" : usrPw},
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			
			if(r.message == 'N') {
				$("#emailAddr").parent().find("span").text("이메일 또는 비밀번호를 다시 확인해주세요.").show();
				$("#emailAddr").focus();
				return;
			} else{
				document.loginVO.submit();
			}
		}
	});
};

</script>
</body>
</html>