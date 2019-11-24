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
<link href="" rel="shortcut icon" type="image/x-icon">
<link rel="apple-touch-icon-precomposed" href="">
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/reset.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/input.css">
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.11.2.min.js"></script>
</head>
<body>
	<header>
		<div class="sub_header">
			<a class="icon_back" href="javascript:window.history.back();"></a>
			<h1>결제완료</h1>
		</div>
	</header>
	<section class="my_menu2">
		<!-- 타이틀 -->
		<div class="page-tit">
			<h2 class="payment_tit">결제완료</h2>
		</div>
		<!-- //타이틀 -->
		<!-- 수업리스트-->
		<div id="target"></div>
	</section>
	
<script type="text/javascript">
$(function() {
	fn_searchList();
});

//현재페이지 전역변수
var cuurPage = 0;
var fn_searchList = function(){
	cuurPage = cuurPage + 1;
	fn_allSearchList();
};

//전체보기
var fn_allSearchList = function() {
	var params = {};
	params.pageIndex = cuurPage;
	$.ajax({	
		url: "${basePath}/mypage/r/n/selectPayCancelListAjax.do",
		type: 'POST',
		dataType: 'html',
		data: params,
		success: function(r) {
			$('#target').children().remove();
			$('#target').html(r);
		},
		error : function(r) {
			alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};
</script>
</body>
</html>