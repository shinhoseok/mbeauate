<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<ul>
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<li class="myJjimLi" jjimId="${list.jjimId}">
					<!-- 오늘날짜 todayNum -->
					<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
					<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
					<!-- 개강일 classStartDtNum -->
					<fmt:parseDate value="${list.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
					<div class="list_theme_item">
						<div class="img">
							<div class="img_inner">
								<img src="${uploadPath}/<c:out value="${list.imgSrc1 }"/>"/>
								<c:choose>
									<c:when test="${classStartDtNum < todayNum or list.classSt eq 4}">
										<div class="dim"></div>
										<div class="dim_txt">종료</div>
									</c:when>
									<c:when test="${list.classSt eq 3}">
										<div class="dim"></div>
										<div class="dim_txt">신청마감</div>
									</c:when>
									<c:otherwise>
										<div class="count">${((todayNum - classStartDtNum)*-1) +1 }일 남았어요!</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="text_wrap">
							<a href="${basePath}/offclass/a/t/selectOffClassDetail.do?classId=${list.classId}">
								<div class="etc_info">
									<span><c:out value="${list.classCt }"/></span>
									<span class="day_open">
										<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${classStartDt}" pattern="yy.MM.dd"/>
									</span>
								</div>
								<div class="tit_info font_60"><c:out value="${list.classTitle }"/></div>
							</a>
						</div>
						<div class="floating_btn">
							<button type="button" class="btn_wish active" onclick="javascript:fn_selectJjimProc('<c:out value="${list.classId}"/>');">찜</button>
			<!-- 							<button type="button" class="btn_wish hover">찜</button> -->
						</div>
					</div>
				</li>
			</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li>데이터가 없습니다.</li>
		</c:otherwise>
	</c:choose>
</ul>
<div class="menu_list_txt">
	<c:set var="lastIndex" value="${jjimVO.lastIndex}"/>
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
<form name="myJjimClassDelForm" id="myJjimClassDelForm" method="post" action="${basePath}/mypage/w/n/deleteJjimProc.do" >
	<input type="hidden" id="jjimId" name="jjimId">
</form>
<script type="text/javascript">
//찜취소,선택
var fn_selectJjimProc = function(classId) {
	var usrId = "${sessionScope.loginVO.usrId}";
	if(usrId == null || usrId == "") {
		alert("로그인 후 사용이 가능합니다.");
		fn_loginPopUpLayer();
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
				$(this).addClass("active");
				location.reload();
			} else{ //찜취소
				$(this).removeClass("active");
			}
		}
	});
};

//전체삭제
var fn_jjimChkDel = function() {
	var result = confirm("찜을 전체삭제 하시겠습니까?");
	if(result) {
		var jjimId = "";
		var comFlag = "";
		$(".myJjimLi").each(function(i) {
			if(i > 0) {
				comFlag = ",";
			}
			var attrId = ($(this).attr("jjimId"));
			jjimId = jjimId + comFlag + String(attrId);
		});
		$("#myJjimClassDelForm #jjimId").val(jjimId);
		$("#myJjimClassDelForm").submit();
	}
};
</script>