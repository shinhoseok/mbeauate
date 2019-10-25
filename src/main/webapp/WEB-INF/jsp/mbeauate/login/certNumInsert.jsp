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
			<section class="section password_wrap">
				<!-- password -->
				<div class="page-title">
					<div class="content-inner">
						<h2 class="title_password">password</h2>
						<p class="title-desc">비밀번호 인증하기</p>
					</div>
				</div>
				<!-- 비번찾기-->
				<form action="${basePath}/login/a/n/certNumCheckProc.do" name="certForm" id="certForm" method="post" onsubmit="return false;">
					<fieldset>
						<legend>비말번호 인증하기</legend>
						<div class="member-join">
							<p>
								<span class="star">*</span>받으신 인증번호를 입력해주세요
							</p>
							<div class="rcont">
								<ul class="input-area">
									<li><input type="text" id="mailSecureKey" name="mailSecureKey" placeholder="인증번호6자리" title="인증번호6자리" maxlength="21" /><span class="emp"></span></li>
								</ul>
								<div class="btn-area">
									<button type="button" class="btn" onclick="javascript:fn_mailSecure();">
										<span>인증번호 보내기</span>
									</button>
								</div>
								<p class="password-p1">본인인증 후 비밀번호를 변경하실 수 있습니다.</p>
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
<script type="text/javascript">
var isValid;
var fn_mailSecure = function() {
	isValid = true;
	$("#mailSecureKey").parent().find("span").text("");
	var mailSecureKey = $("#mailSecureKey").val();
	if(!$.trim(mailSecureKey)){
		$("#mailSecureKey").parent().find("span").text("인증번호를 입력해 주세요").show();
		isValid = false;
	}
	if(!isValid){
		return;
	}
	document.certForm.submit();
};
</script>
</body>
</html>