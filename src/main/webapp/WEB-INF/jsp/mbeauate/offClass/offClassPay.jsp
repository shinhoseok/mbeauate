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
			<h1>클래스 결제</h1>
			<a class="btn_home" href="${basePath}/home/a/n/main.do">홈</a>
		</div>
	</header>
	<section class="class_pay">
		<div class="wrap">
			<div class="mentee_info">
				<h2>멘티정보</h2>
				<div>
					<a class="btn_arr" href="javascript:alert('준비 중입니다.');">내 정보 수정</a>
				</div>
				<div class="inner">
					<ul class="left">
						<li>이름</li>
						<li>휴대전화</li>
					</ul>
					<ul class="right">
						<li><c:out value="${sessionScope.loginVO.usrNm}"/></li>
						<li class="num"><c:out value="${menTiMblPno}"/></li>
					</ul>
				</div>
			</div>
			<div class="class_info">
				<h2>클래스 정보</h2>
				<div class="list_theme_item">
					<div class="img">
						<img src="${uploadPath}/<c:out value="${rslt.resultVO.imgSrc3 }"/>" alt="" />
					</div>
					<div class="text_wrap">
						<div class="tit_info font_60"><c:out value="${rslt.resultVO.classTitle}"/></div>
					</div>
				</div>
				<div class="inner">
					<ul class="left">
						<li>일시</li>
						<li>시간</li>
						<li>인원</li>
						<li>장소</li>
					</ul>
					<ul class="right">
						<li>
							<fmt:parseDate value="${rslt.resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
							<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
						</li>
						<li><c:out value="${rslt.resultVO.classTime}"/></li>
						<li>최소 <c:out value="${rslt.resultVO.classSmallNo}"/>명 / 최대 <c:out value="${rslt.resultVO.classBigNo}"/>명</li>
						<li><c:out value="${rslt.resultVO.classAdr}"/></li>
					</ul>
					<ul class="left">
						<li>문의</li>
					</ul>
					<ul class="right">
						<li class="num"><c:out value="${rslt.userVO.mblPno}"/></li>
					</ul>
				</div>
			</div>
			<div class="coupon_info">
				<c:choose>
					<c:when test="${not empty rslt.couponList[0].couponId }">
						<h2>할인쿠폰</h2>
						<select id="couponSelectBox" onchange="javascript:fn_couponSelect();">
							<c:forEach items="${rslt.couponList}" var="list" varStatus="i">
								<c:if test="${i.first}">
									<option selected="selected" value="${list.couponId}">${list.couponNm}</option>
								</c:if>
								<c:if test="${!i.first}">
									<option value="${list.couponId}">${list.couponNm}</option>
								</c:if>
							</c:forEach>
							<option value="">선택안함</option>
						</select>
						<button class="icon_arr"></button>
					</c:when>
					<c:otherwise>
						<h2>할인쿠폰</h2>
						<select>
							<option>적용가능한 쿠폰이 없습니다.</option>
						</select>
						<button class="icon_arr"></button>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="pay_info">
				<h2>결제정보</h2>
				<div class="inner">
					<div id="pay-priceinfo">
						<ul class="left">
							<li>상품금액</li>
							<li>쿠폰사용</li>
						</ul>
						<c:choose>
							<c:when test="${not empty rslt.couponList[0].couponId }">
								<ul class="right">
									<c:set var="couponMoney" value="${rslt.resultVO.classCost * rslt.couponList[0].couponRate / 100}"/>
									<li class="num font_60"><fmt:formatNumber value="${rslt.resultVO.classCost }" pattern="#,###" />원</li>
									<li class="num font_violet">-<fmt:formatNumber value="${couponMoney}" pattern="#,###" />원</li>
								</ul>
								<div class="last_pay">
									<ul class="left">
										<li>총 결제금액</li>
									</ul>
									<ul class="right">
										<c:set var="totalMoney" value="${rslt.resultVO.classCost - couponMoney}"/>
										<li class="num"><span><fmt:formatNumber value="${totalMoney}" pattern="#,###" /></span>원</li>
									</ul>
								</div>
							</c:when>
							<c:otherwise>
								<ul class="right">
									<li class="num font_60"><fmt:formatNumber value="${rslt.resultVO.classCost }" pattern="#,###" />원</li>
									<li class="num font_60">0원</li>
								</ul>
								<div class="last_pay">
									<ul class="left">
										<li>총 결제금액</li>
									</ul>
									<ul class="right">
										<li class="num"><span><fmt:formatNumber value="${rslt.resultVO.classCost }" pattern="#,###" /></span>원</li>
									</ul>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<label><span class="input-checkbox-box" id="necessayPayCheck1"><input type="checkbox"></span><span class="emp">필수</span>개인정보 제 3자 제공 동의</label>
						<label><span class="input-checkbox-box" id="necessayPayCheck2"><input type="checkbox"></span><span class="emp">필수</span>취소/환불약관 동의</label>
					</div>
				</div>
			</div>
		</div>
		<div class="floating_btn">
			<div style="cursor: pointer;" onclick="javascript:fn_payment()">
				<c:choose>
					<c:when test="${not empty rslt.couponList[0].couponId }">
						<c:set var="couponMoney" value="${rslt.resultVO.classCost * rslt.couponList[0].couponRate / 100}"/>
						<c:set var="totalMoney" value="${rslt.resultVO.classCost - couponMoney}"/>
						<span class="num"><fmt:formatNumber value="${totalMoney}" pattern="#,###" /></span>원 결제하기
					</c:when>
					<c:otherwise>
						<span class="num"><fmt:formatNumber value="${rslt.resultVO.classCost}" pattern="#,###" /></span>원 결제하기
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</section>
<form name="payVO" id="payVO" method="post" action="/offclass/w/t/insertPayProc.do">
	<input type="hidden" id="classId" name="classId" value="${rslt.resultVO.classId}">
	<input type="hidden" name="couponId" id="couponId">
	<input type="hidden" name="couponMoney" id="couponMoney">
	<input type="hidden" name="payMethodSt" id="payMethodSt">
	<input type="hidden" name="payCostNo" id="payCostNo">
	<input type="hidden" name="classApplyNo" id="classApplyNo">
	<input type="hidden" name="classBigNo" id="classBigNo">
	<input type="hidden" name="mentoMblPno" value="${rslt.userVO.mblPno}">
</form>
<script type="text/javascript">
//쿠폰 셀렉트박스 선택시
var fn_couponSelect = function() {
	var params = {}; 
	params.couponId = $("#couponSelectBox option:selected").val();
	params.classCost = "${rslt.resultVO.classCost }";
	
	$.ajax({	
		url: "${basePath}/offclass/r/n/selectClassCoupon.do",
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#pay-priceinfo').children().remove();
			$('#pay-priceinfo').html(r);
		},
		error : function() {
		  alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};

//하나씩 체크(체크박스)
$(".input-checkbox-box").click(function() {
	var gb = $(this).attr("class");
	if(gb == "input-checkbox-box") {
		$(this).addClass("active");
	} else {
		$(this).removeClass("active");
	}
});

//결제하전 밸리데이션
var fn_payment = function() {
	var couponId = $("#couponSelectBox option:selected").val();
	var classId = $("#payVO #classId").val();
	
	//상품, 결제금액, 할인금액, 클래스아이디
	if($("#necessayPayCheck1").attr("class") == "input-checkbox-box") {
		alert("개인정보 제3자 제공 동의는 필수로 체크하셔야 합니다.");
		$("#necessayPayCheck1").focus();
		return;
	}
	if($("#necessayPayCheck2").attr("class") == "input-checkbox-box") {
		alert("취소/환불약관 동의는 필수로 체크하셔야 합니다.");
		$("#necessayPayCheck2").focus();
		return;
	}
	
	//클래스인원이 찼는지 체크
	$.ajax({ 	
		url: "${basePath}/offclass/r/n/selectClassMemChk.do",
		type: 'POST',
		dataType : "json",
		data : {"classId" : classId},
		error: function(){
			 alert("현재 조회 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) {
			if(!r.rslt.resultYn) {
				alert("클래스가 종료되었습니다.\n다른 클래스를 이용해 주십시요.");
				location.href = "${basePath}/offclass/a/t/selectOffClassList.do";
			} else {//param : 신청인원, 최대인원
				offClassPaymenting(r.rslt.resultVO.classApplyNo, r.rslt.resultVO.classBigNo); 
			}
		}
	});
};

//결제진행
var offClassPaymenting = function(classApplyNo, classBigNo) {
	var frm = document.payVO;
	frm.classApplyNo.value = classApplyNo;
	frm.classBigNo.value = classBigNo;
	var couponId = $("#couponSelectBox option:selected").val();
	if(couponId == null || couponId == "" || couponId == undefined) {
		frm.payCostNo.value = "${rslt.resultVO.classCost }"; //쿠폰없는 토탈금액
	} else {
		frm.couponId.value = couponId
		frm.couponMoney.value = "${couponMoney}"; //쿠폰금액
		frm.payCostNo.value = "${totalMoney}"; //토탈금액
	}
	frm.submit();
};
</script>
</body>
</html>