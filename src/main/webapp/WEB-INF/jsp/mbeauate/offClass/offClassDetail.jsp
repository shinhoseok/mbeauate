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
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/reset.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/input.css">
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.11.2.min.js"></script>
</head>
<body>
	<header>
		<div class="sub_header">
			<a class="icon_back" href="#" onclick="window.history.back();return false;"></a>
			<h1>상세정보</h1>
			<a class="btn_home" href="${basePath}/home/a/n/main.do"></a>
		</div>
	</header>
	<section class="class_detail">
		<div>
			<div class="class_tumb">
				<div class="slide_num_wrap">
					<c:if test="${fn:length(rslt.sideImgVO) > 1}">
						<a class="icon_arr_prev" href="javascript:void(0);" onclick="fn_imgMove('L');"></a>
					</c:if>
					<span class="num" id="slideNumText">1/${fn:length(rslt.sideImgVO)}</span>
					<c:if test="${fn:length(rslt.sideImgVO) > 1}">
						<a class="icon_arr_next" href="javascript:void(0);" onclick="fn_imgMove('R');"></a>
					</c:if>
				</div>
				<!-- 오늘날짜 todayNum -->
				<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
				<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
				<!-- 개강일 classStartDtNum -->
				<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
				<c:if test="${todayNum <= classStartDtNum}">
					<div class="count">
						<span>${((todayNum - classStartDtNum)*-1) +1 }일 남았어요!</span>
					</div>
				</c:if>
				<c:choose>
					<c:when test="${fn:length(rslt.sideImgVO) != 0}">
						<c:forEach items="${rslt.sideImgVO}" var="list" varStatus="i">
							<div <c:if test="${!i.first}">style="display: none;"</c:if> id="photo_${i.index}" photoNum="${i.count}">
								<img src="${uploadPath}/<c:out value="${list.imgSrc }"/>"/>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div>등록된 이미지가 없습니다.</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="cont-nav">
				<ul>
					<li><a href="" class="active">소개</a></li>
					<li><a href="#location">오시는길</a></li>
					<li><a href="#ask">문의</a></li>
					<li><a href="#review">리뷰</a></li>
					<li><a href="javascript:alert('준비중 입니다.');">취소/환불</a></li>
				</ul>
			</div>
			<div class="class_tit">
				<h3><c:out value="${rslt.resultVO.classTitle }"/></h3>
			</div>
			<div class="class_price">
				<c:choose>
					<c:when test="${rslt.resultVO.classCost == -1}">
						<span class="">-</span>
					</c:when>
					<c:otherwise>
						<span class=""><fmt:formatNumber value="${rslt.resultVO.classCost }" pattern="#,###" />원</span>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="class_info line_t10g">
				<div class="inner">
					<ul class="left">
						<li>개강</li>
						<li>시간</li>
						<li>인원</li>
						<li>장소</li>
					</ul>
					<ul class="right">
						<li>
							<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
							<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
						</li>
						<li><c:out value="${rslt.resultVO.classTime }"/></li>
						<li>최소 <c:out value="${rslt.resultVO.classSmallNo }"/>명 / 최대 <c:out value="${rslt.resultVO.classBigNo }"/>명</li>
						<li><c:out value="${rslt.resultVO.classAreaStNm }"/></li>
					</ul>
				</div>
			</div>
			<div class="class_detail_img line_t10g">
				<img src="${uploadPath}/<c:out value="${rslt.resultVO.imgSrc2 }"/>" />
			</div>
			<div class="class_location" id="location">
				<div class="inner">
					<h2 class="text_0">클래스 위치</h2>
					<ul class="left">
						<li>개강</li>
						<li>시간</li>
						<li>인원</li>
						<li>장소</li>
					</ul>
					<ul class="right">
						<li>
							<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
							<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
						</li>
						<li><c:out value="${rslt.resultVO.classTime }"/></li>
						<li>최소 <c:out value="${rslt.resultVO.classSmallNo }"/>명 / 최대 <c:out value="${rslt.resultVO.classBigNo }"/>명</li>
						<li><c:out value="${rslt.resultVO.classAdr }"/></li>
					</ul>
				</div>
				<div>
<%-- 					<img src="${imagePath}/sub/class_map.jpg" /> --%>
					<p style="margin-top:-12px">
					    <em class="link">
<!-- 					        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')"> -->
<!-- 					            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. -->
<!-- 					        </a> -->
					    </em>
					</p>
					<div id="map" style="width:100%;height:220px;"></div>
				</div>
			</div>
			<div class="class_ask" id="ask">
				<div class="inner">
					<ul>
						<li>문의</li>
						<li>핸드폰번호</li>
						<li class="num"><c:out value="${rslt.resultVO.mblPno }"/></li>
					</ul>
				</div>
			</div>
			<div class="class_review line_t10g" id="review"></div>
		</div>
		<div class="floating_btn">
			<c:choose>
				<c:when test="${rslt.resultVO.classSt eq '3' or rslt.resultVO.classSt eq '4' or todayNum > classStartDtNum}"> <!-- 마감되었거나, 사람꽉찻을때 -->
					<button type="button" class="btn_txt" id="alarmBtn" onclick="javascript:fn_selectAlarmPop('${rslt.resultVO.classId}');">알람신청</button>
				</c:when>
				<c:when test="${rslt.resultVO.classGb eq '2'}"><!-- 외부일때 -->
					<button type="button" class="btn_txt" onclick="javascript:fn_outWebAdrOffClass('<c:out value="${rslt.resultVO.classWebAdr}"/>');">클래스 외부접수</button>
				</c:when>
				<c:otherwise><!-- 내부일때 -->
					<button type="button" class="btn_txt" onclick="javascript:fn_selectOffClassApply('<c:out value="${rslt.resultVO.classId}"/>');">클래스 신청하기</button>
				</c:otherwise>
			</c:choose>
			<button type="button" class="btn_share" onclick="fn_shareOffClass('<c:out value="${rslt.resultVO.classId}"/>')">공유하기</button>
			<c:choose>
				<c:when test="${not empty rslt.jjimVO}">
					<button type="button" class="btn_wish_active" id="jjimBtn" onclick="javascript:fn_selectJjimProc('<c:out value="${rslt.resultVO.classId}"/>');">찜</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn_wish" id="jjimBtn" onclick="javascript:fn_selectJjimProc('<c:out value="${rslt.resultVO.classId}"/>');">찜</button>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
<input type="text" style="position:absolute;top:-9999em;" id="shareUrlAddress" value="${basePath}/offclass/a/t/selectOffClassDetail.do?classId=${rslt.resultVO.classId}">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3293753f81a7a167267e89115e51e74&libraries=services"></script>
<script type="text/javascript">
$(function() {
	//리뷰리스트
	fn_searchReviewList();
	//마이페이지 후기등록 후 이동될 탭
	var detailGoTab = '<c:out value="${classVO.detailGoTab }"/>';
	if(detailGoTab != null || detailGoTab != "" || detailGoTab != "undefined") {
		fn_move(detailGoTab);
	}
});

//리뷰 현재페이지 전역변수
var cuurPage = 0;
function fn_searchReviewList(){
	cuurPage = cuurPage + 1;
	fn_selectReviewList();
}

//리뷰 페이지 ajax
var fn_selectReviewList = function() {
	var params = {};
	params.pageIndex = cuurPage;
	params.classId = "${rslt.resultVO.classId}";
	$.ajax({	
		url: "${basePath}/offclass/a/n/selectReviewList.do",
		data: params,
		type: 'POST',
		dataType: 'html',
		success: function(r) {
			$('#review').children().remove();
			$('#review').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};

//슬라이드 이미지
var fn_imgMove = function(gubun) {
	var current = $("div[id^='photo_']:visible");
	var currentImgNum = current.attr("photoNum")*1+1;
	var totalImgNum = "${fn:length(rslt.sideImgVO)}";
	if(gubun == 'R') {
		if(current.is("div[id^='photo_']:last")) {
			alert("마지막 사진입니다.");
		} else {
			current.hide();
			current.next().show();
			$("#slideNumText").text(current.attr("photoNum")*1+1+"/"+totalImgNum);
		}
	} else {
		if(current.is("div[id^='photo_']:first")) {
			alert("첫 사진입니다.");
		} else {
			current.hide();
			current.prev().show();
			$("#slideNumText").text(current.attr("photoNum")*1-1+"/"+totalImgNum);
		}
	}
};

//외부주소링크
var fn_outWebAdrOffClass = function(classWebAdr) {
	if(classWebAdr == null || classWebAdr == "") {
		alert("외부링크 주소가 잘못되었습니다.\n관리자에게 문의하세요.");
		return;
	}
	window.open(classWebAdr, "_blank");
	return;
};

//찜하기
var fn_selectJjimProc = function(classId) {
	var usrId = "${sessionScope.loginVO.usrId}";
	if(usrId == null || usrId == "") {
		alert("로그인 후 사용이 가능합니다.");
		return;
	}
	var params = {};
	params.usrId = usrId;
	params.classId = classId;
	
	$.ajax({ 	
		url: "${basePath}/jjim/w/n/selectJjimProc.do",
		type: 'POST',
		dataType : "json",
		data : params,
		error: function(){
			 alert("현재 찜 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.resultYn == 'Y') { //찜함
				$('#jjimBtn').css('background-position', '-108px -74px');
			} else{ //찜취소
				$('#jjimBtn').css('background-position', '-76px -74px');
			}
		}
	}); 
};

//공유하기
var fn_shareOffClass = function(classId) {	
	$("#shareUrlAddress").val(window.document.location.href);
	$("#shareUrlAddress").select();
	document.execCommand("copy");
	alert("복사되었습니다"); 
};

//알람신청 팝업
var fn_selectAlarmPop = function(classId) {
	var usrId = "${sessionScope.loginVO.usrId}";
	if(usrId == null || usrId == "") {
		alert("로그인 후 사용이 가능합니다.");
		return;
	}
	location.href="${basePath}/offclass/r/n/selectUserPhon.do?classId="+classId;
};

//끝판왕 클래스 신청 안녕~~
var fn_selectOffClassApply = function(classId) {
	var usrId = "${sessionScope.loginVO.usrId}";
	if(usrId == null || usrId == "") {
		alert("로그인 후 사용이 가능합니다.");
		return;
	}
	location.href="${basePath}/offclass/r/t/selectOffClassApplyDetail.do?classId="+classId;
};

//탭메뉴 이동(클래스소개, 오시는길, 문의하기)
var fn_move = function(param) {
	var offset = $("#"+param).offset();
	$("html, body").animate({scrollTop : offset.top}, 400);
};


//지도
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
	center : new kakao.maps.LatLng(37.56680, 126.97863), // 지도의 중심좌표
	level : 5, // 지도의 확대 레벨
	mapTypeId : kakao.maps.MapTypeId.ROADMAP
// 지도종류
};

// 지도를 생성한다 
var map = new kakao.maps.Map(mapContainer, mapOption);
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${rslt.resultVO.classAdr }', function(result,
		status) {
	// 정상적으로 검색이 완료됐으면 
	if (status === kakao.maps.services.Status.OK) {
		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		// 결과값으로 받은 위치를 마커로 표시합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : coords
		});
		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);
	}
});
// 지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new kakao.maps.MapTypeControl();
// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
// map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new kakao.maps.ZoomControl();
// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
</script>
</body>
</html>