<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<div class="review_list2">
	<c:choose>
		<c:when test="${rslt.selectListCnt != 0}">
			<c:forEach items="${rslt.selectList}" var="list" varStatus="i">
				<div class="list_theme_item">
					<div class="list_inner">
						<div class="inner">
							<div class="img">
								<img src="${uploadPath}/<c:out value="${list.imgSrc3 }"/>"/>
							</div>
							<div class="text_wrap">
								<div class="tit_info font_40"><c:out value="${list.classTitle }"/></div>
								<span class="font_60">작성일</span>
								<span class="txt_before num">
									<fmt:parseDate value="${list.reviewDt}" var="reviewDt" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${reviewDt}" pattern="yyyy.MM.dd"/>
								</span>
							</div>
						</div>
						<!-- 별점-->
						<div class="review_star">
							<ul class="left">
								<li>
									<span class="txt">커리큘럼</span>
									<span class="star">
										<c:choose>
											<c:when test="${list.curriculum eq '0'}">
												<span style="width: 0%"></span>
											</c:when>
											<c:when test="${list.curriculum eq '1'}">
												<span style="width: 20%"></span>
											</c:when>
											<c:when test="${list.curriculum eq '2'}">
												<span style="width: 40%"></span>
											</c:when>
											<c:when test="${list.curriculum eq '3'}">
												<span style="width: 60%"></span>
											</c:when>
											<c:when test="${list.curriculum eq '4'}">
												<span style="width: 80%"></span>
											</c:when>
											<c:otherwise>
												<span style="width: 100%"></span>
											</c:otherwise>
										</c:choose>
									</span>
								</li>
								<li>
									<span class="txt">시간준수</span>
									<span class="star">
										<c:choose>
											<c:when test="${list.timePro eq '0'}">
												<span style="width: 0%"></span>
											</c:when>
											<c:when test="${list.timePro eq '1'}">
												<span style="width: 20%"></span>
											</c:when>
											<c:when test="${list.timePro eq '2'}">
												<span style="width: 40%"></span>
											</c:when>
											<c:when test="${list.timePro eq '3'}">
												<span style="width: 60%"></span>
											</c:when>
											<c:when test="${list.timePro eq '4'}">
												<span style="width: 80%"></span>
											</c:when>
											<c:otherwise>
												<span style="width: 100%"></span>
											</c:otherwise>
										</c:choose>
									</span>
								</li>
							</ul>
							<ul>
								<li><span class="txt">전달력</span>
									<span class="star">
										<c:choose>
											<c:when test="${list.community eq '0'}">
												<span style="width: 0%"></span>
											</c:when>
											<c:when test="${list.community eq '1'}">
												<span style="width: 20%"></span>
											</c:when>
											<c:when test="${list.community eq '2'}">
												<span style="width: 40%"></span>
											</c:when>
											<c:when test="${list.community eq '3'}">
												<span style="width: 60%"></span>
											</c:when>
											<c:when test="${list.community eq '4'}">
												<span style="width: 80%"></span>
											</c:when>
											<c:otherwise>
												<span style="width: 100%"></span>
											</c:otherwise>
										</c:choose>
									</span>
								</li>
								<li><span class="txt">친절도</span>
									<span class="star">
										<c:choose>
											<c:when test="${list.kindness eq '0'}">
												<span style="width: 0%"></span>
											</c:when>
											<c:when test="${list.kindness eq '1'}">
												<span style="width: 20%"></span>
											</c:when>
											<c:when test="${list.kindness eq '2'}">
												<span style="width: 40%"></span>
											</c:when>
											<c:when test="${list.kindness eq '3'}">
												<span style="width: 60%"></span>
											</c:when>
											<c:when test="${list.kindness eq '4'}">
												<span style="width: 80%"></span>
											</c:when>
											<c:otherwise>
												<span style="width: 100%"></span>
											</c:otherwise>
										</c:choose>
									</span>
								</li>
							</ul>
						</div>
						<!-- //별점-->
						<a href="javascript:void(0);" onclick="javascript:fn_updateReview('${list.reviewId }','${list.imgSrc3 }');" class="btn_r2">수정</a>
					</div>
					<p><c:out value="${list.reviewCtt }"/></p>
					<c:if test="${fn:length(list.commentList) != 0}">
						<c:forEach items="${list.commentList}" var="commList" varStatus="status">
							<div>
								<a class="reply" href="javascript:void(0);" onclick="javascript:fn_commentShowOrHide('${i.index}');"><span>댓글보기</span><span class="num">${fn:length(list.commentList)}</span></a>
							</div>
							<div class="rev_reply" id="rev_reply${i.index}" style="display: none;">
								<div>
									<span class="rev_mentor"><c:out value="${commList.usrNm }"/></span>
									<span class="num font_40">
										<fmt:parseDate value="${commList.commentDt}" var="commentDt" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${commentDt}" pattern="yyyy.MM.dd"/>
									</span>
								</div>
								<p><c:out value="${commList.commentCtt }"/></p>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li>데이터가 없습니다.</li>
		</c:otherwise>
	</c:choose>
</div>
<!-- //후기작성리스트---->
<div class="menu_list_txt2">
	<c:set var="lastIndex" value="${reviewVO.lastIndex}"/>
	<c:set var="totalCnt" value="${rslt.selectListCnt}"/>
	<ul class="btn_class_more">
		<c:choose>
			<c:when test="${lastIndex >= totalCnt}">
				<li><a class="btn_arr_big" href="javascript:alert('마지막 페이지입니다.');">후기 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
			</c:when>
			<c:otherwise>
				<li><a class="btn_arr_big" href="javascript:void(0);" onclick="fn_searchList();">후기 더보기<sapn class="num">(${lastIndex }/${totalCnt})</sapn></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>

<script type="text/javascript">
//댓글보기 show&hide
var fn_commentShowOrHide = function(idx) {
	if($("#rev_reply"+idx).css("display") == "none") {
		$("#rev_reply"+idx).show();
	} else {
		$("#rev_reply"+idx).hide();
	}
};

//후기수정
var fn_updateReview = function(reviewId, imgSrc3) {
	location.href="${basePath}/mypage/r/n/updateUserReview.do?reviewId="+reviewId+"&imgSrc3="+imgSrc3;
};
</script>