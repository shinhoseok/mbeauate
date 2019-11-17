<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<div class="notice">
	<ul class="notice-list">
		<c:choose>
			<c:when test="${rslt.selectListCnt != 0}">
				<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
					<li>
						<c:if test="${list.postSubTitle eq 'A'}"><span class="emp">*중요</span></c:if>
						<a href="${basePath}/board/a/n/selectBoardDetail.do?postId=${list.postId }"> 
							<span class="title"><c:out value="${list.postTitle}"/></span>
							<span class="date"><fmt:formatDate value="${list.postDt}" pattern="yy.MM.dd"/></span>
						</a>
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
	<c:set var="lastIndex" value="${boardVO.lastIndex}"/>
	<c:set var="totalCnt" value="${rslt.selectListCnt}"/>
	<ul class="btn_class_more">
		<c:choose>
			<c:when test="${lastIndex >= totalCnt}">
				<li><a class="btn_arr_big" href="javascript:alert('마지막 페이지입니다.');">공지사항 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
			</c:when>
			<c:otherwise>
				<li><a class="btn_arr_big" href="javascript:void(0);" onclick="fn_searchList();">공지사항 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<div class="h60"></div>