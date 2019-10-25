<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<!-- 오늘날짜 todayNum -->
<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
<div class="list2_wrap">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<!-- 개강일 classStartDtNum -->
				<fmt:parseDate value="${list.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
				<div class="list2_item">
					<a href="#">
						<div class="img_wrap">
							<div class="img">
								<img src="${uploadPath}/<c:out value="${list.imgSrc }"/>" alt="" />
							</div>
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
									<div class="count">
										<span>${((todayNum - classStartDtNum)*-1) +1 }일 남았어요!</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="text_wrap">
							<div class="tit"><c:out value="${list.classAreaStNm }"/></div>
							<div class="tit_info font_60"><c:out value="${list.classTitle }"/></div>
							<div class="etc_info">
								<span>개강</span>
								<span class="day_open">
									<fmt:parseDate value="${list.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/> 
									<fmt:formatDate value="${classStartDt}" pattern="yyyy-MM-dd"/>
								</span>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li>데이터가 없습니다.</li>
		</c:otherwise>
	</c:choose>
</div>
<div class="btn_more">
	<a id="btn_more" href="javascript:void(0);" onclick="fn_searchList();">클래스 더보기<sapn class="num"></sapn></a>
</div>