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
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
</head>
<body>
	<div id="wrap">
		<header>
			<jsp:include page="/WEB-INF/jsp/mbeauate/common/top.jsp" flush="false" />
		</header>
		<div id="contents" class="contents">
			<section class="section">
				<!-- sing up -->
				<div class="page-title">
					<div class="content-inner">
						<h2 class="title_singup">sing up</h2>
						<p class="title-desc">뷰아떼 회원가입을 환영합니다.</p>
					</div>
				</div>
				<!-- 회원가입-->
				<form:form commandName="userVO" name="userVO" id="userVO" method="post" action="${basePath}/user/w/n/insertUserProc.do" onsubmit="return false;">
					<fieldset>
						<legend>회원가입</legend>
						<div class="member-join">
							<h3>약관동의</h3>
							<div class="rcont">
								<label><span class="input-checkbox"><input type="checkbox" id="insertUserChk"></span><span class="emp">필수</span> 뷰아떼의 이용약관, 개인정보 취급방침에 동의합니다.</label>
							</div>
							<h3 class="tit_info">정보입력</h3>
							<div class="rcont">
								<ul class="input-area">
									<li><form:input path="emailAddr" id="emailAddr" value="" placeholder="이메일 입력 (name@mail.com)" title="이메일을 입력해주세요." maxlength="21" /><span class="emp"></span></li>
									<li><form:password path="usrPw" id="usrPw" value="" placeholder="비밀번호 (최소 9자 이상)" title="비밀번호를 입력해주세요." maxlength="21" /><span class="emp"></span></li>
									<li><input id="user_pw_confirm" type="password" value="" placeholder="비밀번호 확인" title="비밀번호 다시 입력해주세요." maxlength="21" /><span class="emp"></span></li>
									<li><form:input path="usrNm" id="usrNm" value="" placeholder="이름" title="이름을 입력해주세요." maxlength="21" /><span class="emp"></span></li>
									<li><form:input path="mblPno" id="mblPno" value="" placeholder="휴대전화 ('-'없이 숫자만 입력)" title="휴대전화 ('-'없이 숫자만 입력)을 입력해주세요." maxlength="21" /><span class="emp"></span></li>
								</ul>
								<div class="btn-area">
									<button class="btn" type="button" onclick="javascript:fn_insertUserProc(this);">
										<span>가입하기</span>
									</button>
								</div>
							</div>
						</div>
					</fieldset>
				</form:form>
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
</body>
<script type="text/javascript">
//체크박스 이벤트
$(".input-checkbox").click(function() {
	var gb = $(this).attr("class");
	if(gb == "input-checkbox") {
		$(this).addClass("active");
		$("#userVO #insertUserChk").prop("checked", true);
	} else {
		$(this).removeClass("active");
		$("#userVO #insertUserChk").prop("checked", false);
	}
});

//회원가입
var isValid;
var fn_insertUserProc = function(e) {
	isValid = true;
	$("#userVO span.emp").text("");
	if((e.type=='keyup' || e.type=='change')==false){
		if($("#userVO #insertUserChk").is(":checked")==false){
			alert("뷰아떼 약관에 동의해 주세요.");
			isValid = false;
		}
	}
	if(!$.trim($("#emailAddr").val())) {
		$("#userVO #emailAddr").parent().find("span").text("이메일을 입력해 주세요").show();
		isValid = false;
	}
	if(!$.trim($("#usrNm").val())) {
		$("#usrNm").parent().find("span").text("이름을 입력해 주세요").show();
		isValid = false;
	}
	if (!TypeChecker.korEng($("#userVO #usrNm").val())) {
		$("#usrNm").parent().find("span").text("이름은 "+TypeChecker.korEngText).show();
		isValid = false;
	}
	if(!$.trim($("#usrPw").val())) {
		$("#usrPw").parent().find("span").text("패스워드 입력해 주세요").show();
		isValid = false;
	}
	//패스워드조합3가지
	if((e.type=='keyup' || e.type=='change')==false){
		if(!fn_checkPass2("usrPw")) {
			isValid = false;
		}
	}
	if($("#usrPw").val() != $("#user_pw_confirm").val()) {
		$("#user_pw_confirm").parent().find("span").text("패스워드를 확인해주세요").show();
		isValid = false;
	}
	if($("#newUsrPw").val() != $("#newUsrPw_confirm").val()) {
		$("#newUsrPw_confirm").parent().find(".emp").text("패스워드가 다릅니다.").show();
		isValid = false;
	}
	if (!TypeChecker.email($("#emailAddr").val())) {
		$("#emailAddr").parent().find("span").text("이메일은 "+TypeChecker.emailText).show();
		isValid = false;
	}
	
	if (!TypeChecker.number($("#mblPno").val())) {
		$("#mblPno").parent().find("span").text("휴대폰 번호는 "+TypeChecker.numberText).show();
		isValid = false;
	}
	if(!isValid){
		return;
	}
	if((e.type=='keyup' || e.type=='change')==true){
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
				document.userVO.submit();
			} else{
				$("#emailAddr").parent().find("span").text("사용자 아이디와 중복되었습니다 다른값으로 입력바랍니다.").show();
				return;
			}
		}
	}); 
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
	  		$("#"+objId).focus();
	  		$("#usrPw").parent().find(".emp").text("영문,숫자,특수문자 1자이상 포함하여 9~20자로 조합해주세요");
	   		return;
	  	}//if
	  
	 }else{
		 $("#"+objId).val("");
		 $("#"+objId).focus();
		 $("#usrPw").parent().find(".emp").text("영문,숫자,특수문자 1자이상 포함하여 9~20자로 조합해주세요");
	  	return;
	 }//else
	 return true;
};
</script>
</html>