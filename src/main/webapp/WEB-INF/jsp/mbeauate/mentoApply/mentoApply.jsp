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
			<h1>멘토지원</h1>
		</div>
	</header>
	<section>
		<div>
			<img src="${imagePath}/sub/apply_mentor.jpg">
		</div>
		<div class="btn_more">
			<a href="https://docs.google.com/forms/d/e/1FAIpQLSc5IGItP9eE3PQsKhQydU2ebI9AdXOerBo8OCXbd4Drore7tA/viewform" target="_blank">지원하기</a>
			<!--메뉴-->
		</div>
		<div class="h60"></div>
		<div id="floating_menu">
			<%@ include file="/WEB-INF/jsp/mbeauate/common/menu.jsp"%>
		</div>
		<!--// 메뉴-->
	</section>
</body>
</html>