<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<ul>
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<li>
					<label class="myChkBox"><span payId="${list.payId}" class="input-checkbox-box"><input type="checkbox"></span></label>
					<c:if test="${list.paySt ne 2}">
						<a class="cancle" href="javascript:void(0);" onclick="fn_payCancel('${list.payId }', '${list.classId }');">참여취소</a>
<!-- 						<a class="cancle" href="#">환불신청</a> -->
					</c:if>
					<div class="list_theme_item">
						<!-- 오늘날짜 todayNum -->
						<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
						<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
						<!-- 개강일 classStartDtNum -->
						<fmt:parseDate value="${list.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
						<div class="img">
							<div class="img_inner">
								<img src="${uploadPath}/<c:out value="${list.imgSrc2 }"/>"/>
								<c:if test="${list.classSt eq 3}">
									<div class="dim"></div>
									<div class="dim_txt">신청마감</div>
								</c:if>
								<c:if test="${list.classSt eq 4 or classStartDtNum <= todayNum }">
									<div class="dim"></div>
									<div class="dim_txt">종료</div>
								</c:if>
							</div>
							<c:choose>
								<c:when test="${list.paySt eq 2}">
									<div class="label_r label_bla">취소완료</div>
								</c:when>
								<c:when test="${list.paySt eq 3}">
									<div class="label_r label_gray">환불신청중</div>
								</c:when>
								<c:when test="${list.paySt eq 4}">
									<div class="label_r label_bla">환불완료</div>
								</c:when>
								<c:otherwise>
									<div class="label_r label_vio">결제완료</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="text_wrap">
							<a href="${basePath}/offclass/a/t/selectOffClassDetail.do?classId=${list.classId }">
								<div class="etc_info">
									<span><c:out value="${list.classStNm }"/></span>
									<span class="day_open">
										<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${classStartDt}" pattern="yy.MM.dd"/>
									</span>
								</div>
								<div class="tit_info font_60"><c:out value="${list.classTitle }"/></div>
							</a>
							<div>
								<h6>총 결제금액</h6>
								<p class="num">
									<c:if test="${not empty list.couponId}">
										<span class="price_sale"><c:out value="${list.cpnRate }"/>%</span>
									</c:if>
									<span><fmt:formatNumber value="${list.payCostNo }" pattern="#,###" />원</span>
									<c:if test="${not empty list.couponId}">
										<c:set var="couponMoney" value="${(list.classCostNo*1) - (list.payCostNo*1)}"/>
										<span class="price_before"><fmt:formatNumber value="${couponMoney }" pattern="#,###" />원</span>
									</c:if>
								</p>
							</div>
						</div>
					</div>
					<div class="map">
						<p><c:out value="${list.areaNm }"/></p>
					</div>
				</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li>데이터가 없습니다.</li>
		</c:otherwise>
	</c:choose>
</ul>
<div class="menu_list_txt">
	<c:set var="lastIndex" value="${payVO.lastIndex}"/>
	<c:set var="totalCnt" value="${rslt.selectListCnt}"/>
	<ul class="btn_class_more">
		<c:choose>
			<c:when test="${lastIndex >= totalCnt}">
				<li><a class="btn_arr_big" href="javascript:alert('마지막 페이지입니다.');">클래스 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
			</c:when>
			<c:otherwise>
				<li><a class="btn_arr_big" href="javascript:void(0);" onclick="fn_searchList();">클래스 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<form name="myAppClassDelForm" id="myAppClassDelForm" method="post" action="" >
	<input type="hidden" id="payId" name="payId">
	<input type="hidden" id="classId" name="classId">
</form>
<script type="text/javascript">
//하나씩 체크
$(".input-checkbox-box").click(function() {
	var gb = $(this).attr("class");
	if(gb == "input-checkbox-box") {
		$(this).addClass("active");
	} else {
		$(this).removeClass("active");
	}
});

//전체체크
var fn_mypageAllCheck = function() {
	var gb = $(".input-checkbox-box").attr("class");
	if(gb == "input-checkbox-box") {
		$(".input-checkbox-box").addClass("active");
	} else {
		$(".input-checkbox-box").removeClass("active");
	}
};

//체크박스 선택삭제
var fn_mypageChkDel = function() {
	if($(".input-checkbox-box.active").length > 0) {
		var result = confirm("선택하신 결제내역을 삭제하시겠습니까?");
		if(result) {
			var payId = "";
			var comFlag = "";
			$(".input-checkbox-box.active").each(function(i) {
				if(i > 0) {
					comFlag = ",";
				}
				var attrId = ($(this).attr("payId"));
				payId = payId + comFlag + String(attrId);
			});
			$('#myAppClassDelForm').attr("action","${basePath}/mypage/w/n/deletePayProc.do");
			$("#myAppClassDelForm #payId").val(payId);
			$("#myAppClassDelForm").submit();
		}
	} else {
		alert("삭제하실 결제내역을 선택해주세요.");
	}
};

//참여취소
var fn_payCancel = function(payId, classId) {
	var result = confirm("신청하신 클래스를 취소하시겠습니까?");
	if(result) {
		//결제상태 취소2로, 취소환불테이블 인서트, 클래스인원 1증가
		$('#myAppClassDelForm').attr("action","${basePath}/mypage/w/n/updatePayRefundProc.do");
		$("#myAppClassDelForm #payId").val(payId);
		$("#myAppClassDelForm #classId").val(classId);
		$("#myAppClassDelForm").submit();
	}
};
</script>