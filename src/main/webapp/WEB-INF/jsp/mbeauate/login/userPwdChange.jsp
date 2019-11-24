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
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
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
			<section class="section password_wrap">
				<!-- password -->
				<div class="page-title">
					<div class="content-inner">
						<h2 class="title_password">password</h2>
						<p class="title-desc">비밀번호 찾기</p>
					</div>
				</div>
				<!-- 비번찾기-->
				<form action="${basePath}/login/a/n/selectPwdMailSearch.do" name="userVO" id="userVO" method="post" onsubmit="return false;">
					<fieldset>
						<legend>비번찾기</legend>
						<div class="member-join">
							<p>
								<span class="star">*</span>가입하신 이메일 주소를 입력해주세요
							</p>
							<div class="rcont">
								<ul class="input-area">
									<li>
										<input type="text" name="emailAddr" id="emailAddr" value="" placeholder="이메일" title="이메일을 입력해주세요." maxlength="21" />
										<span class="emp"></span>
									</li>
								</ul>
								<div class="btn-area">
									<button class="btn" type="button" onclick="javascript:fn_certify();">
										<span>인증번호 보내기</span>
									</button>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
				<!-- //회원가입---->
			</section>
		</div>
		<div class="footer"></div>
	</div>
	<!--메뉴-->
	<div id="floating_menu">
		<%@ include file="/WEB-INF/jsp/mbeauate/common/menu.jsp"%>
	</div>
	<!--// 메뉴-->
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
<script type="text/javascript">
var fn_certify = function () {
	isValid = true;
	$("#userVO span.emp").text("");
	if(!$.trim($("#emailAddr").val())) {
		$("#userVO span.emp").text("");
		$("#emailAddr").parent().find("span").text("이메일을 입력해 주세요").show();
		isValid = false;
	}
	if (!TypeChecker.email($("#emailAddr").val())) {
		$("#emailAddr").parent().find("span").text("이메일은 "+TypeChecker.emailText).show();
		isValid = false;
	}
	if(!isValid){
		return;
	}
	//아이디 중복체크
	$.ajax({
		url: "${basePath}/user/a/n/selectUserIdChk.do",
		type: 'POST',
		dataType : "json",
		data : $("#userVO").serialize(),
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.chkResult) {
				$("#emailAddr").parent().find("span").text("이메일이 존재하지 않습니다. 다시 확인해 주세요.").show();
				return;
			} else{
				document.userVO.submit();
			}
		}
	}); 
};
</script>
</body>
</html>