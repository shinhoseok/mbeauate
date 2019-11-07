<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<div class="inner">
	<h2 class="text_0">클래스 수강후기</h2>
	<div class="left">
		<p>수강후기 평점</p>
		<p class="num"><c:out value="${rslt.scoreSum}"/></p>
	</div>
	<div class="right">
		<ul>
			<li><span class="txt">커리큘럼</span> <span class="star"> <span style="width: <c:out value='${rslt.curriculumStarSum}'/>%"></span>
			</span></li>
			<li><span class="txt">시간준수</span> <span class="star"> <span style="width: <c:out value='${rslt.timeProStarSum}'/>%"></span>
			</span></li>
			<li><span class="txt">전달력</span> <span class="star"> <span style="width: <c:out value='${rslt.communityStarSum}'/>%"></span>
			</span></li>
			<li><span class="txt">친절도</span> <span class="star"> <span style="width: <c:out value='${rslt.kindnessStarSum}'/>%"></span>
			</span></li>
		</ul>
	</div>
</div>
<div class="review_list">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<div class="review_list_module">
					<div>
						<span><c:out value="${list.usrNm}"/></span>
						<span class="num font_40">
							<fmt:parseDate value="${list.reviewDt}" var="reviewDt" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${reviewDt}" pattern="yy.MM.dd"/>
						</span>
					</div>
					<p class="font_60"><c:out value="${list.reviewCtt}"/></p>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="review_list_module">데이터가 없습니다.</div>
		</c:otherwise>
	</c:choose>
	<div class="menu_list_txt">
		<c:set var="lastIndex" value="${reviewVO.lastIndex}"/>
		<c:set var="totalCnt" value="${rslt.selectListCnt}"/>
		<ul class="btn_class_more">
			<c:choose>
				<c:when test="${lastIndex >= totalCnt}">
					<li><a class="btn_arr_big" href="javascript:alert('마지막 페이지입니다.');">리뷰 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
				</c:when>
				<c:otherwise>
					<li><a class="btn_arr_big" href="javascript:void(0);" onclick="fn_searchReviewList();">리뷰 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>