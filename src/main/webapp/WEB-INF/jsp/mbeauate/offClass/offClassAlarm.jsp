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
	<div class="popup_alarm">
		<div class="wrap">
			<h2>알람신청</h2>
			<a class="btn_close" href="javascript:window.history.back();">닫기</a>
			<div class="list_theme_item">
				<div class="img">
					<img src="${uploadPath}/<c:out value="${rslt.resultVO.imgSrc3 }"/>"/>
				</div>
				<div class="text_wrap">
					<div class="tit_info font_60"><c:out value="${rslt.resultVO.classTitle }"/></div>
					<div class="etc_info">
						<span><c:out value="${rslt.resultVO.classAreaStNm }"/></span>
						<span class="day_open">
							<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
							<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
						</span>
					</div>
				</div>
			</div>
			<ul>
				<li>휴대폰</li>
				<li class="num"><c:out value="${rslt.userVO.mblPno }"/></li>
				<li><a href="javascript:alert('준비중 입니다.');">번호변경</a></li>
			</ul>
		</div>
		<div class="btn_more">
			<a href="javascript:void(0);" onclick="javascript:fn_selectAlarmProc('<c:out value="${rslt.resultVO.classId}"/>');">알람신청하기 </a>
		</div>
	</div>
<script type="text/javascript">
//알람신청을 하면 알람신청이 되었는지 확인하고 되었으면 리턴 안되었으면 인서트
var fn_selectAlarmProc = function(classId) {
	var usrId = "${sessionScope.loginVO.usrId}";
	var params = {};
	params.usrId = usrId;
	params.classId = classId;
	
	$.ajax({ 	
		url: "${basePath}/alarm/w/n/selectAlarmProc.do",
		type: 'POST',
		dataType : "json",
		data : params,
		error: function(){
			 alert("현재 알람신청 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.resultYn == 'Y') {
				alert("알람신청이 완료되었습니다.\n클래스가 새로 오픈되는대로 문자로 발송드리겠습니다.");
				window.history.back();
				return;
			} else{
				alert("이미 알람신청이 되어있습니다.\n클래스가 새로 오픈되는대로 문자로 발송드리겠습니다.");
				window.history.back();
				return;
			}
		}
	});
};
</script>
</body>
</html>