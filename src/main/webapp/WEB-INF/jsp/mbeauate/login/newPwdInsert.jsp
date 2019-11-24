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
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
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
						<p class="title-desc">새 비밀번호 설정</p>
					</div>
				</div>
				<!-- 비번찾기-->
				<form action="${basePath}/login/w/n/updateNewPwdProc.do" method="post" id="loginVO" name="loginVO" onsubmit="return false;">
					<fieldset>
						<legend>새 비밀번호 설정</legend>
						<div class="member-join">
							<div class="rcont">
								<ul class="input-area">
									<li>
										<input type="password" name="usrPw" id="usrPw" value="" placeholder="새 비밀번호 입력" title="새 비밀번호 입력해주세요." maxlength="21" />
										<span class="emp"></span>
									</li>
									<li>
										<input type="password" id="usrPwConfirm" onkeypress="if(event.keyCode==13){fn_pwdChange();} " value="" placeholder="비밀번호 확인" title="새 비밀번호 한번더 입력해주세요." maxlength="21" />
										<span class="emp"></span>
									</li>
								</ul>
								<div class="btn-area">
									<button type="button" class="btn" onclick="javascript:fn_pwdChange(this);">
										<span>비밀번호 변경하기</span>
									</button>
								</div>

							</div>
						</div>
					</fieldset>
				</form>
				<!-- //새비밀번호 설정---->
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
//비밀번호 변경처리
var isValid;
var fn_pwdChange = function(e) {
	isValid = true;
	$("#userVO span.emp").text("");
	var usrPw = $("#usrPw").val();
	var usrPwConfirm = $("#usrPwConfirm").val();
	if(!$.trim(usrPw)){
		$("#usrPw").parent().find("span").text("비밀번호를 입력해 주세요").show();
		isValid = false;
	}
	if(!$.trim(usrPwConfirm)){
		$("#usrPwConfirm").parent().find("span").text("비밀번호 확인을 입력해 주세요").show();
		isValid = false;
	}
	//패스워드조합3가지
	if((e.type=='keyup' || e.type=='change')==false){
		if(!fn_checkPass2("usrPw")) {
			isValid = false;
		}
	}
	if(usrPw != usrPwConfirm) {
		$("#usrPw").parent().find("span").text("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.").show();
		isValid = false;
		return;
	}
	if(!isValid){
		return;
	}
	document.loginVO.submit();
};

//비밀번호 체크  (숫자, 문자, 특수문자 1개 이상 반드시 포함 8자리 이상 20자리 이하)
var fn_checkPass2 = function(objId){
	 var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	 var number = "1234567890";
	 var sChar = "-_=+\|()*&^%$#@!~`?></;,.:'";
	 
	 var sChar_Count = 0;
	 var alphaCheck = false;
	 var numberCheck = false;
	 
	 var pw = $("#"+objId).val();
	 if(9 <= pw.length && pw.length <= 20){
	 	for(var i=0; i<pw.length; i++){
	   		if(sChar.indexOf(pw.charAt(i)) != -1){
	   			sChar_Count++;
	   		}
	   		if(alpha.indexOf(pw.charAt(i)) != -1){
	    		alphaCheck = true;
	   		}
	   		if(number.indexOf(pw.charAt(i)) != -1){
	    		numberCheck = true;
	   		}
	  	}//for
	 	
	  	if(sChar_Count < 1 || alphaCheck != true || numberCheck != true){
	  		$("#"+objId).val("");
	  		$("#"+objId).parent().find(".emp").text("영문,숫자,특수문자 1자이상 포함하여 9~20자로 조합해주세요");
	   		return;
	  	}//if
	  
	 }else{
		 $("#"+objId).val("");
		 $("#"+objId).parent().find(".emp").text("영문,숫자,특수문자 1자이상 포함하여 9~20자로 조합해주세요");
	  	return;
	 }//else
	 return true;
};
</script>
</body>
</html>