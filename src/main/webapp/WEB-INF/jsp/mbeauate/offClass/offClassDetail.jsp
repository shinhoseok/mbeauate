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
			<a class="icon_back" href="javascript:window.history.back();"></a>
			<h1>상세정보</h1>
			<a class="btn_home" href="${basePath}/home/a/n/main.do">홈</a>
		</div>
	</header>
	<section class="class_detail">
		<div>
			<div class="class_tumb">
				<div class="label_inner">
					<div class="label num">20%</div>
				</div>
				<div class="slide_num_wrap">
					<a class="icon_arr_prev" href="#"></a> <span class="num">1/5</span> <a class="icon_arr_next" href="#"></a>
				</div>
				<!-- 오늘날짜 todayNum -->
				<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
				<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
				<!-- 개강일 classStartDtNum -->
				<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
				<c:if test="${todayNum <= classStartDtNum or rslt.resultVO.classSt eq 1 or rslt.resultVO.classSt eq 2}">
					<div class="count">
						<span>${((todayNum - classStartDtNum)*-1) +1 }일 남았어요!</span>
					</div>
				</c:if>
				<img src="${uploadPath}/<c:out value="${rslt.resultVO.imgSrc }"/>"/>
			</div>
			<div class="cont-nav">
				<ul>
					<li><a href="" class="active">소개</a></li>
					<li><a href="#location">오시는길</a></li>
					<li><a href="#ask">문의</a></li>
					<li><a href="#review">리뷰</a></li>
					<li><a href="">취소/환불</a></li>
				</ul>
			</div>
			<div class="class_tit">
				<h3><c:out value="${rslt.resultVO.classTitle }"/></h3>
			</div>
			<div class="class_price">
<!-- 				<span class="price_sale">20%</span><span class="">124,500원</span><span class="price_before">234,500원</span> -->
				<span class=""><fmt:formatNumber value="${rslt.resultVO.classCost }" pattern="#,###" />원</span>
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
<%-- 				<img src="${uploadPath}/<c:out value="${rslt.resultVO.imgSrc2 }"/>"/> --%>
				<img src="${imagePath}/sub/class_detail_mo.jpg" />
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
					<img src="${imagePath}/sub/class_map.jpg" />
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
				<c:when test="${rslt.resultVO.classSt eq '3' or rslt.resultVO.classSt eq '4' or todayNum >= classStartDtNum}"> <!-- 마감되었거나, 사람꽉찻을때 -->
					<button type="button" class="btn_txt" id="alarmBtn" onclick="javascript:fn_selectAlarmPop();">알람신청</button>
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
					<button type="button" class="btn_wish active" id="jjimBtn" onclick="javascript:fn_selectJjimProc('<c:out value="${rslt.resultVO.classId}"/>');">찜</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn_wish" id="jjimBtn" onclick="javascript:fn_selectJjimProc('<c:out value="${rslt.resultVO.classId}"/>');">찜</button>
				</c:otherwise>
			</c:choose>
		</div>
	</section>

<script type="text/javascript">
$(function() {
	//리뷰리스트
	fn_searchReviewList();
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

//찜하기
var fn_selectJjimProc = function(classId) {
		$(".btn-wish").css("background-color", "#6a2cfe");
// 	var usrId = "${sessionScope.loginVO.usrId}";
// 	if(usrId == null || usrId == "") {
// 		alert("로그인 후 사용이 가능합니다.");
// 		fn_loginPopUpLayer();
// 		return;
// 	}
// 	var params = {};
// 	params.usrId = usrId;
// 	params.classId = classId;
	
// 	$.ajax({ 	
// 		url: "${basePath}/jjim/w/n/selectJjimProc.do",
// 		type: 'POST',
// 		dataType : "json",
// 		data : params,
// 		error: function(){
// 			 alert("현재 찜 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
// 			 return;
// 		},
// 		success: function(r) { 
// 			if(r.resultYn == 'Y') { //찜함
// 				$(".btn-wish").css("background-color", "#6a2cfe");
// 				$(".btn-wish active").css("background-color", "#6a2cfe");
// 			} else{ //찜취소
// 				$(".btn-wish").css("background-color", "#000");
// 				$(".btn-wish active").css("background-color", "#000");
// 			}
// 		}
// 	}); 
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

//공유하기
var fn_shareOffClass = function(classId) {
	var obShareUrl = document.getElementById("shareUrlAddress");
	var f = document.getElementById("shareUrlAddress");
	f.value = document.location.href;
	alert("URL을 복사하세요.\n"+$("#shareUrlAddress").val());
};


</script>
</body>
</html>