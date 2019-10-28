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
			<a class="btn_back" href="#" onclick="window.history.back();return false;"></a>
			<h1>My 페이지</h1>
		</div>
	</header>
	<section class="my_menu">
		<!--상단-->
		<div class="my_top_info">
			<div>
				<h2>
					${sessionScope.loginVO.usrNm}님<br> 반갑습니다
				</h2>
				<a class="btn_r2" href="${basePath}/mypage/r/n/updateMyInfo.do">My정보</a>
			</div>
			<div>
				<ul>
					<li><a href="${basePath}/mypage/r/t/selectMyClassList.do">
							<ul>
								<li class="btn_arr">신청한 클래스</li>
								<li class="num"><c:out value="${rslt.myPayCnt }"/></li>
							</ul>
					</a></li>
					<li><a href="">
							<ul>
								<li class="btn_arr">사용가능한 쿠폰</li>
								<li class="num"><c:out value="${rslt.myCouponCnt }"/></li>
							</ul>
					</a></li>
				</ul>
			</div>
		</div>
		<!--//상단-->
		<!--마이페이지_메뉴-->
		<div class="my_menu_list">
			<ul>
				<h6>class</h6>
				<li><a class="btn_arr_big" href="${basePath}/mypage/r/t/selectMyClassList.do">신청한 클래스</a></li>
				<li><a class="btn_arr_big" href="${basePath}/mypage/r/n/selectMyJjimClassList.do">찜한 클래스</a></li>
			</ul>
			<ul>
				<h6>Review</h6>
				<li><a class="btn_arr_big" href="#">작성가능한 후기</a></li>
				<li><a class="btn_arr_big" href="#">내가 작성한 후기</a></li>
			</ul>
			<ul>
				<h6>coupon</h6>
				<li><a class="btn_arr_big" href="#">사용가능한 쿠폰</a></li>
				<li><a class="btn_arr_big" href="#">사용/만료 쿠폰</a></li>
			</ul>
			<ul>
				<h6>Review</h6>
				<li><a class="btn_arr_big" href="#">결제내역</a></li>
				<li><a class="btn_arr_big" href="#">취소/환불 내역</a></li>
			</ul>
			<!--//마이페이지_메뉴-->
		</div>
		<!--메뉴-->
		<div id="floating_menu">
			<%@ include file="/WEB-INF/jsp/mbeauate/common/menu.jsp"%>
		</div>
		<!--// 메뉴-->
	</section>
</body>
</html>