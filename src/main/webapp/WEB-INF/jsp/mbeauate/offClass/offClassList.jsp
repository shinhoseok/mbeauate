<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="description" content="">
<meta name="keywords" content="">
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/reset.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/input.css">
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.11.2.min.js"></script>
</head>
<body>
<!-- 오늘날짜 todayNum -->
<fmt:parseDate value="${rslt.today}" var="todayParseDate" pattern="yyyy-MM-dd"/> 
<fmt:parseNumber value="${todayParseDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum"/>
	<div id="wrap">
		<header>
			<a class="icon_back" href="javascript:window.history.back();"></a>
			<c:choose>
				<c:when test="${classVO.classCtSt eq '1'}">
					<h1>오프라인 헤어 클래스</h1>
				</c:when>
				<c:when test="${classVO.classCtSt eq '2'}">
					<h1>오프라인 메이크업 클래스</h1>
				</c:when>
				<c:when test="${classVO.classCtSt eq '3'}">
					<h1>오프라인 속눈썹/반영구 클래스</h1>
				</c:when>
				<c:when test="${classVO.classCtSt eq '4'}">
					<h1>오프라인 피부/왁싱 클래스</h1>
				</c:when>
				<c:when test="${classVO.classCtSt eq '5'}">
					<h1>오프라인 네일 클래스</h1>
				</c:when>
				<c:otherwise>
					<h1>오프라인 기타 클래스</h1>
				</c:otherwise>
			</c:choose>
		</header>
		<section>
			<div class="offclass_list_wrap">
				<!--클래스시작배너-->
				<div class="img_class">
					<img src="${imagePath}/sub/bn_class_hair.jpg" />
				</div>
				<!--//클래스시작배너-->
				<!--best클래스-->
				<div class="list2_wrap">
					<h2>BEST 클래스</h2>
					<c:choose>
						<c:when test="${fn:length(rslt.bestList) != 0}">
							<c:forEach items="${rslt.bestList}" var="list" varStatus="i">
								<!-- 개강일 classStartDtNum -->
								<fmt:parseDate value="${list.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
								<div class="list2_item">
									<a href="${basePath}/offclass/a/t/selectOffClassDetail.do?classId=${list.classId }">
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
							<br/><br/>
							<li>데이터가 없습니다.</li>
						</c:otherwise>
					</c:choose>
				</div>
				<!--// best클래스-->
				<!--테마별 클래스-->
				<div class="list_theme_wrap">
					<img src="${imagePath}/temp/img_bn_theme.jpg" />
					<div class="list_theme">
						<ul>
							<c:choose>
								<c:when test="${fn:length(rslt.newList) != 0}">
									<c:forEach items="${rslt.newList}" var="list" varStatus="i">
										<!-- 개강일 classStartDtNum -->
										<fmt:parseDate value="${list.classStartDt}" var="classStartDtParseDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${classStartDtParseDate.time / (1000*60*60*24)}" integerOnly="true" var="classStartDtNum"/>
										<li class="list_theme_item">
											<a href="${basePath}/offclass/a/t/selectOffClassDetail.do?classId=${list.classId }">
												<c:choose>
													<c:when test="${classStartDtNum < todayNum or list.classSt eq 4}">
														<div class="img">
															<img src="${uploadPath}/<c:out value="${list.imgSrc3 }"/>"/>
														</div>
														<div class="dim"></div>
														<div class="dim_txt">종료</div>
													</c:when>
													<c:when test="${list.classSt eq 3}">
														<div class="img">
															<img src="${uploadPath}/<c:out value="${list.imgSrc3 }"/>"/>
														</div>
														<div class="dim"></div>
														<div class="dim_txt">신청마감</div>
													</c:when>
													<c:otherwise>
														<div class="img">
															<img src="${uploadPath}/<c:out value="${list.imgSrc3 }"/>"/>
														</div>
														<div class="count">
															<span>${((todayNum - classStartDtNum)*-1) +1 }일 남았어요!</span>
														</div>
													</c:otherwise>
												</c:choose>
												<div class="text_wrap">
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
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li>데이터가 없습니다.</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<!--// 테마별 클래스-->
				<!-- 슬라이드_스페셜 멘토 클래스-->
				<div class="list_slide_wrap line_t10g">
					<h2>
						<img src="${imagePath}/temp/tit_special.jpg" />
					</h2>
					<div class="list_slide">
						<div class="list_slide_item">
							<a href="#"> <img src="${imagePath}/temp/bn_special.jpg" />
							</a>
						</div>
						<div class="slide_num_wrap">
							<a class="icon_arr_prev" href="#"></a> <span class="num"><strong class="num">1</strong>/5</span> <a class="icon_arr_next" href="#"></a>
						</div>

					</div>
				</div>
				<!--//슬라이드_ 스페셜 멘토 클래스-->
				<!--멘토지원 배너-->
				<div class="img_bn">
					<img src="${imagePath}/temp/bn_mentor.jpg" />
				</div>
				<!--//멘토지원 배너-->
				<!--클래스 리스트-->
				<div>
					<!--지역필터-->
					<div class="filter_wrap">
						<form:form commandName="classVO" name="classVO" id="classVO" method="post" action="" >
							<span class="selectbox">
								<form:select style="width: 90px;" path="classAreaSt" id="classAreaSt" onchange="javascript:fn_allSearchList();">
									<option value="">전체</option>
									<form:options items="${rslt.classAreaList}" itemLabel="mclsNm"  itemValue="mclsCd" />
								</form:select>
								<span class="icon_area"></span>
							</span>
						</form:form>
					</div>
					<!--// 지역필터-->
					<div id="targetAllOffList"></div>
				</div>
				<!--//클래스 리스트-->
			</div>
			<!--메뉴-->
			<div id="floating_menu">
				<%@ include file="/WEB-INF/jsp/mbeauate/common/menu.jsp"%>
			</div>
			<!--// 메뉴-->
		</section>
	</div>
<script type="text/javascript">
$(function() {
	fn_searchList();
});

//현재페이지 전역변수
var cuurPage = 0;
var fn_searchList = function(){
	cuurPage = cuurPage + 1;
	fn_allSearchList();
};

//전체보기
var fn_allSearchList = function() {
	var classAreaSt = $("#classAreaSt").val();
	var params = {};
	params.pageIndex = cuurPage;
	params.classAreaSt = classAreaSt;
	$.ajax({	
		url: "${basePath}/offclass/a/n/selectOffClassAjaxList.do",
		type: 'POST',
		dataType: 'html',
		data: params,
		success: function(r) {
			$('#targetAllOffList').children().remove();
			$('#targetAllOffList').html(r);
		},
		error : function(r) {
			console.log(r);
			alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};
</script>
</body>
</htm>