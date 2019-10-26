<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<ul class="left">
	<li>상품금액</li>
	<li>쿠폰사용</li>
</ul>
<c:set var="totalMoney" value="${classCost - couponMoney}"/>
<c:choose>
	<c:when test="${not empty couponVO.couponId }">
		<ul class="right">
			<li class="num font_60"><fmt:formatNumber value="${classCost }" pattern="#,###" />원</li>
			<c:set var="couponMoney" value="${classCost * couponVO.couponRate / 100}"/>
			<li class="num font_violet">-<fmt:formatNumber value="${couponMoney}" pattern="#,###" />원</li>
		</ul>
		<div class="last_pay">
			<ul class="left">
				<li>총 결제금액</li>
			</ul>
			<ul class="right">
				<li class="num"><span><fmt:formatNumber value="${totalMoney}" pattern="#,###" /></span>원</li>
			</ul>
		</div>
	</c:when>
	<c:otherwise>
		<ul class="right">
			<li class="num font_60"><fmt:formatNumber value="${classCost }" pattern="#,###" />원</li>
			<li class="num font_60">0원</li>
		</ul>
		<div class="last_pay">
			<ul class="left">
				<li>총 결제금액</li>
			</ul>
			<ul class="right">
				<li class="num"><span><fmt:formatNumber value="${classCost }" pattern="#,###" /></span>원</li>
			</ul>
		</div>
	</c:otherwise>
</c:choose>