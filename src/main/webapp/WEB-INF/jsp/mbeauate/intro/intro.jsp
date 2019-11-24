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
			<h1>뷰아떼 소개</h1>
		</div>
	</header>
	<section>
		<div>
			<img src="${imagePath}/sub/intro_beauate.jpg">
		</div>
		<!--메뉴-->
		<div id="floating_menu">
			<%@ include file="/WEB-INF/jsp/mbeauate/common/menu.jsp"%>
		</div>
		<!--// 메뉴-->
	</section>
</body>
</html>