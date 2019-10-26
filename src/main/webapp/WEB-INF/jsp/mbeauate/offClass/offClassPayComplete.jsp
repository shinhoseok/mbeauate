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
	<header>
		<div class="sub_header">
			<a class="btn_back" href="javascript:window.history.back();">뒤로</a>
			<h1>결제완료</h1>
		</div>
	</header>
	<section>
		<div class="pay_end">
			<h2>
				<p>결제가 완료되었습니다.</p>
			</h2>
			<div class="btn_more">
				<a href="${basePath}/home/a/n/main.do""> 메인으로 </a>
			</div>
		</div>
		<!--메뉴-->
		<div id="floating_menu">
			<%@ include file="/WEB-INF/jsp/mbeauate/common/menu.jsp"%>
		</div>
		<!--// 메뉴-->
	</section>
</body>
</html>