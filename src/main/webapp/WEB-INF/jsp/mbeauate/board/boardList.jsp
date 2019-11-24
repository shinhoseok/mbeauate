<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
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
			<div class="sub_header">
				<a class="btn_back" href="#" onclick="window.history.back();return false;"></a>
				<h1>공지사항</h1>
				<a class="btn_home" href="${basePath}/home/a/n/main.do"></a>
			</div>
		</header>
		<section class="my_menu2">
			<div class="page-tit">
				<h2 class="notice_tit">공지사항</h2>
			</div>
			<div id="target"></div>
		</section>
	</div>
<script type="text/javascript">
$(function() {
	fn_searchList(1);
});

//현재페이지 전역변수
var cuurPage = 1;
//param : 클릭페이지, 탭번호,
function fn_searchList(page){
	cuurPage= page;
	var params = {};
	params.pageIndex = cuurPage;
	fn_boardCommonAjax(params);
}

//공통 Ajax(현재는 공지사항밖에 없음)
var fn_boardCommonAjax = function(params) {
	$.ajax({	
		url: "${basePath}/board/a/n/selectBoardListAjax.do",
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#target').children().remove();
			$('#target').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};

</script>
</body>
</html>