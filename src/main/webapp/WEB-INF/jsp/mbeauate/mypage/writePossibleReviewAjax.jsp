<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<div class="myclass_list">
	<ul>
		<c:choose>
			<c:when test="${rslt.selectListCnt != 0}">
				<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
					<li>
						<div class="list_theme_item margin_t20">
							<div class="img">
								<div class="img_inner">
									<img src="${uploadPath}/<c:out value="${list.imgSrc2 }"/>"/>
								</div>
								<div class="label_r label_gray2">수강완료</div>
							</div>
							<div class="text_wrap">
								<a href="#">
									<div class="etc_info">
										<span>${list.classStNm}</span>
										<span class="day_open">
											<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${classStartDt}" pattern="yyyy.MM.dd"/>
										</span>
									</div>
									<div class="tit_info font_60"><c:out value="${list.classTitle }"/></div>
								</a> <a class="btn_r50" href="javascript:void(0);" onclick="javascript:fn_insertReview('<c:out value="${list.classId }"/>', '${list.imgSrc3 }', '${list.classStNm }', '${list.classStartDt}', '${list.classTitle }')">후기작성</a>
							</div>
						</div>
					</li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<li>데이터가 없습니다.</li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<!-- //후기작성리스트---->
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

<script type="text/javascript">
//후기작성
var fn_insertReview = function(classId, imgSrc3, classStNm, classStartDt, classTitle) {
	reviewClassId = classId;
	//유저는 같은 클래스에서 한번만 후기작성 가능
	$.ajax({ 	
		url: "${basePath}/mypage/r/n/selectUserReviewCnt.do",
		type: 'POST',
		dataType : "json",
		data : {"classId" : classId},
		error: function(){
			 alert("현재 리뷰 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.cnt == 0) {
				location.href="${basePath}/mypage/r/n/insertUserReview.do?classId="+classId;
			} else{
				alert("해당 클래스에 이미 작성된 리뷰가 있습니다.");
				return;
			}
		}
	});
};
</script>