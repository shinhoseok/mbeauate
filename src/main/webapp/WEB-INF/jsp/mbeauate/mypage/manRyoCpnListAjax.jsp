<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<div class="coupon_list">
	<ul>
		<c:choose>
			<c:when test="${rslt.selectListCnt != 0}">
				<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
					<li>
						<div class="coupon">
							<div class="inner">
								<p class="font_40"><c:out value="${list.couponNm}"/></p>
								<div class="info font_60">
									<ul>
										<li><span class="txt">사용조건</span><c:out value="${list.couponCdt}"/></li>
										<li><span class="txt">쿠폰 만료일</span><span class="num"><c:out value="${list.couponEndDt}"/></span></li>
									</ul>
								</div>
								<div class="num label_gray"><c:out value="${list.couponRate}"/>%</div>
								<div class="label_txt font_60">
									<c:choose>
										<c:when test="${list.cpnFl eq 'N'}">
											사용완료
										</c:when>
										<c:otherwise>
											기간만료
										</c:otherwise>
									</c:choose>
								</div>
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
<div class="menu_list_txt2">
	<c:set var="lastIndex" value="${couponHistoryVO.lastIndex}"/>
	<c:set var="totalCnt" value="${rslt.selectListCnt}"/>
	<ul class="btn_class_more">
		<c:choose>
			<c:when test="${lastIndex >= totalCnt}">
				<li><a class="btn_arr_big" href="javascript:alert('마지막 페이지입니다.');">쿠폰 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
			</c:when>
			<c:otherwise>
				<li><a class="btn_arr_big" href="javascript:void(0);" onclick="fn_searchList();">쿠폰 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>