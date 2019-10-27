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
	<header>
		<div class="sub_header">
			<a class="btn_back" href="javascript:window.history.back();">뒤로</a>
			<h1>내 정보수정</h1>
		</div>
	</header>
	<section class="my_menu2">
		<!-- 타이틀 -->
		<div class="page-tit">
			<h2 class="myinfo_tit">내 정보 수정</h2>
			<a class="btn_r50" href="${basePath}/login/a/n/logOut.do">로그아웃</a>
		</div>
		<!-- //타이틀 -->
		<!-- 내정보-->
		<div class="correct">
			<ul>
				<li>
					<h6>이메일주소</h6>
					<p class="num"><c:out value="${resultVO.emailAddr}"/></p>
				</li>
			</ul>
			<ul>
				<li id="usrPwLi">
					<h6>비밀번호</h6>
					<p class="num">.........</p> <a class="btn_r50" href="javascript:void(0);" onclick="javascript:fn_updatePassword('doing');">수정</a>
				</li>
				<li id="usrPwChgLi" style="display: none;">
					<h6>비밀번호</h6>
					<p class="num"><input type="password" id="usrPwChg" value="" placeholder="비밀번호 (최소 9자 이상)" title="비밀번호를 입력해주세요." maxlength="21" /></p>
					<a class="btn_r50 cancle" href="javascript:void(0);" onclick="javascript:fn_updatePassword('cancel');">취소</a>
					<a class="btn_r50 change" href="javascript:void(0);" onclick="javascript:fn_updatePasswordProc(this);">변경</a>
					<span class="emp"></span>
				</li>
			</ul>
			<ul>
				<li>
					<h6>이름</h6>
					<p><c:out value="${resultVO.usrNm}"/></p>
				</li>
			</ul>
			<ul>
				<li id="mblPnoLi">
					<h6>휴대폰</h6>
					<p class="num">
						<c:out value="${resultVO.mblPno}"/>
					</p> <a class="btn_r50" href="javascript:void(0);" onclick="javascript:fn_updateMblPno('doing');">수정</a>
				</li>
				<li id="mblPnoChgLi" style="display: none;">
					<h6>휴대폰</h6>
					<p class="num"><input type="text" id="mblPnoChg" value="" placeholder="휴대전화 ('-'없이 숫자만 입력)" title="휴대전화 ('-'없이 숫자만 입력)을 입력해주세요." maxlength="21" /></p>
					<a class="btn_r50 cancle" href="javascript:void(0);" onclick="javascript:fn_updateMblPno('cancel');">취소</a>
					<a class="btn_r50 change" href="javascript:void(0);" onclick="javascript:fn_updateMblPnoProc(this);">변경</a>
					<span class="emp"></span>
				</li>
			</ul>
			<ul>
				<li>
					<h6>탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요</h6> <a class="btn_r2" onclick="javascript:fn_deleteMemberProc();">회원탈퇴</a>
				</li>
			</ul>
		</div>
		<!-- //내정보---->
	</section>
<form name="myInfoUpdateForm" id="myInfoUpdateForm" method="post" action="${basePath}/mypage/w/n/updateMblPnoProc.do" onsubmit="return false;">
	<input type="hidden" name="mblPno" id="mblPnoChg1" value="">
	<input type="hidden" name="usrPw" id="usrPwChg1" value="">
</form>
<script type="text/javascript">
//휴대폰 변경 클릭시
var fn_updateMblPno = function(param) {
	if(param == "doing") {
		$("#mblPnoLi").hide();
		$("#mblPnoChgLi").show();
	} else {
		$("#mblPnoLi").show();
		$("#mblPnoChgLi").hide();
		$("#mblPnoChg").val("");
		$("#mblPnoChg").find(".emp").text("");
	}
};

//휴대폰 변경 처리
var isValidChk;
var fn_updateMblPnoProc = function(e) {
	isValidChk = true;
	if(!$.trim($("#mblPnoChg").val())) {
		$("#mblPnoChgLi").find(".emp").text("휴대폰 번호를 입력해 주세요.").show();
		isValidChk = false;
	}
	if (!TypeChecker.number($("#mblPnoChg").val())) {
		$("#mblPnoChgLi").find(".emp").text("숫자형식으로 기입해주세요. (ex : 01011112222)").show();
		$("#mblPnoChg").focus();
		isValidChk = false;
	}
	if(isValidChk) {
		if(!confirm("수정 하시겠습니까?")){
			return;
		}
		var mblPnoChg = $("#mblPnoChg").val();
		$("#myInfoUpdateForm #mblPnoChg1").val(mblPnoChg);
		document.myInfoUpdateForm.submit();
	}
	
};

//비밀번호 변경 클릭시
var fn_updatePassword = function(param) {
	if(param == "doing") {
		$("#usrPwLi").hide();
		$("#usrPwChgLi").show();
	} else {
		$("#usrPwLi").show();
		$("#usrPwChgLi").hide();
		$("#usrPwChg").val("");
		$("#usrPwChg").find(".emp").text("");
	}
};

//비밀번호 변경 처리
var fn_updatePasswordProc = function(e) {
	isValidChk = true;
	if(!$.trim($("#usrPwChg").val())) {
		$("#usrPwChgLi").find(".emp").text("비밀번호를 입력해 주세요.").show();
		isValidChk = false;
	}
	//패스워드조합3가지
	if((e.type=='keyup' || e.type=='change')==false){
		if(!fn_checkPass2("usrPwChg")) {
			isValidChk = false;
		}
	}
	if(isValidChk) {
		if(!confirm("수정 하시겠습니까?")){
			return;
		}
		var usrPwChg1 = $("#usrPwChg").val();
		alert(usrPwChg1);
		$("#myInfoUpdateForm #usrPwChg1").val(usrPwChg1);
		document.myInfoUpdateForm.submit();
	}
};

//회원탈퇴
var fn_deleteMemberProc = function() {
	if(confirm("탈퇴 하시겠습니까?")){
		location.href='${basePath}/mypage/w/n/deleteMemberProc.do';
	}
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
	  		$("#usrPwChgLi").find(".emp").text("영문,숫자,특수문자 1자이상 포함하여 9~20자로 조합해주세요");
	   		return;
	  	}//if
	  
	 }else{
		 $("#"+objId).val("");
		 $("#"+objId).focus();
		 $("#usrPwChgLi").find(".emp").text("영문,숫자,특수문자 1자이상 포함하여 9~20자로 조합해주세요");
	  	return;
	 }//else
	 return true;
};
</script>
</body>
</html>