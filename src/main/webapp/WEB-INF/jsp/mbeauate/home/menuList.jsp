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
	<div id="wrap">
		<section>
			<div class="menu_wrap">
				<!--오프라인 클래스-->
				<div>
					<h2>오프라인클래스</h2>
					<ul class="menu_list_img">
						<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=1">
								<div>
									<img src="${imagePath}/common/icon_beauty_hair.png" />
								</div> 헤어
						</a></li>
						<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=2">
								<div>
									<img src="${imagePath}/common/icon_beauty_makeup.png" />
								</div> 메이크업
						</a></li>
						<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=3">
								<div>
									<img src="${imagePath}/common/icon_beauty_eyelash.png" />
								</div> 속눈썹/반영구
						</a></li>
						<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=4">
								<div>
									<img src="${imagePath}/common/icon_beauty_skin.png" />
								</div> 피부/왁싱
						</a></li>
						<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=5">
								<div>
									<img src="${imagePath}/common/icon_beauty_nail.png" />
								</div> 네일
						</a></li>
						<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=6">
								<div>
									<img src="${imagePath}/common/icon_beauty_etc.png" />
								</div> 기타
						</a></li>
					</ul>
				</div>
				<!--나머지 메뉴들-->
				<div class="menu_list_txt">
					<ul>
						<li><a class="btn_arr_big" href="javascript:void(0);" onclick="javascript:fn_onlineClass();">온라인 클래스</a></li>
						<li><a class="btn_arr_big" href="#">뷰아떼 소개</a></li>
						<li><a class="btn_arr_big" href="#">공지사항</a></li>
						<li><a class="btn_arr_big" href="javascript:void(0);" onclick="fn_logout()">로그아웃</a></li>
					</ul>
				</div>
			</div>
			<!--메뉴-->
			<div id="floating_menu">
				<%@ include file="/WEB-INF/jsp/mbeauate/common/menu.jsp"%>
			</div>
			<!--// 메뉴-->
		</section>
	</div>
<script type="text/javascript">
var fn_logout = function() {
	if(confirm("로그아웃 하시겠습니까?")){
		document.location.href="${basePath}/login/a/n/logOut.do";
	}
};

//온라인클래스 준비중
var fn_onlineClass = function() {
	alert("준비 중 입니다.");
};
</script>
</body>
</htm>