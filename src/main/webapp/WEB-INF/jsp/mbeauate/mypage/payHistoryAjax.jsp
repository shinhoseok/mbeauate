<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<div class="payment_list">
	<ul>
		<c:choose>
			<c:when test="${rslt.selectListCnt != 0}">
				<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
					<li>
						<div class="list_theme_item">
							<div class="img">
								<div class="img_inner">
									<img src="${uploadPath}/<c:out value="${list.imgSrc3 }"/>"/>
								</div>
								<div class="font_violet"><c:out value="${list.payStNm}"/></div>
								<p class="num font_60"><c:out value="${list.payId}"/></p>
							</div>
							<div class="text_wrap">
								<p><c:out value="${list.classTitle}"/></p>
								<div class="inner font_60">
									<ul>
										<li><sapn class="txt">결제금액</sapn><span class="num"><fmt:formatNumber value="${list.payCostNo }" pattern="#,###" /></span></li>
										<li><sapn class="txt">결제일</sapn><span class="num"><fmt:formatDate value="${list.payDt}" pattern="yyyy-MM-dd"/></span></li>
										<li><sapn class="txt">결제방법</sapn><span><c:out value="${list.payMethodNm}"/></span></li>
<!-- 										<li><sapn class="txt">결제방법</sapn><span>신용카드</span><span class="txt_before">롯데카드</span></li> -->
									</ul>
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
	<c:set var="lastIndex" value="${payVO.lastIndex}"/>
	<c:set var="totalCnt" value="${rslt.selectListCnt}"/>
	<ul class="btn_class_more">
		<c:choose>
			<c:when test="${lastIndex >= totalCnt}">
				<li><a class="btn_arr_big" href="javascript:alert('마지막 페이지입니다.');">결재내역 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
			</c:when>
			<c:otherwise>
				<li><a class="btn_arr_big" href="javascript:void(0);" onclick="fn_searchList();">결재내역 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>