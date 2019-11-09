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
<link href="" rel="shortcut icon" type="image/x-icon">
<link rel="apple-touch-icon-precomposed" href="">
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/reset.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/input.css">
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${scriptPath}/validation/validation.js"></script>
<script type="text/javascript" src="${scriptPath}/common.js"></script>
<style>
.starR{
	background: url('${imagePath}/shin/ico_review.png') no-repeat right 0;
	background-size: auto 100%;
	width: 18px;
	height: 18px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>
</head>
<body>
	<header>
		<div class="sub_header">
			<a class="icon_back" href="javascript:window.history.back();"></a>
			<h1>클래스 후기 수정</h1>
		</div>
	</header>
	<section class="my_menu2">
		<!-- 타이틀 -->
		<div class="page-tit">
			<h2 class="review2_tit">클래스 후기 수정</h2>
		</div>
		<!-- //타이틀 -->
		<div class="review_list">
			<!-- 후기 썸네일-->
			<div class="list_theme_item">
				<div class="img">
					<div class="img_inner">
						<img src="${uploadPath}/<c:out value="${resultVO.imgSrc3 }"/>" alt=""/>
					</div>
				</div>
				<div class="text_wrap">
					<div class="etc_info">
						<div class="tit_info font_60"><c:out value="${resultVO.classTitle }"/></div>
						<span>헤어</span>
						<span class="day_open2"><c:out value="${resultVO.reviewDt }"/></span>
					</div>
				</div>
			</div>
			<!-- //후기 썸네일---->
			<!-- 별점-->
			<div class="review_star">
				<ul>
					<li>커리큘럼</li>
					<li>친절도</li>
					<li>시간준수</li>
					<li>전달력</li>
				</ul>
				<ul class="star2">
					<li class="starRev" id="curriculum">
						<span class="starR">별1</span>
						<span class="starR">별2</span>
						<span class="starR">별3</span>
						<span class="starR">별4</span>
						<span class="starR">별5</span>
					</li>
					<li class="starRev" id="kindness">
						<span class="starR">별1</span>
						<span class="starR">별2</span>
						<span class="starR">별3</span>
						<span class="starR">별4</span>
						<span class="starR">별5</span>
					</li>
					<li class="starRev" id="timePro">
						<span class="starR">별1</span>
						<span class="starR">별2</span>
						<span class="starR">별3</span>
						<span class="starR">별4</span>
						<span class="starR">별5</span>
					</li>
					<li class="starRev" id="community">
						<span class="starR">별1</span>
						<span class="starR">별2</span>
						<span class="starR">별3</span>
						<span class="starR">별4</span>
						<span class="starR">별5</span>
					</li>
				</ul>
			</div>
			<!-- //별점-->
			<!--작성-->
			<div class="write">
				<textarea style="width: 100%" id="reviewCttTextArea" name="reviewCttTextArea" rows="5" onfocus="checker(this, 300 , 'nbytes_reviewCtt');" onblur="stopchecker();"><c:out value="${resultVO.reviewCtt }"/></textarea>
				<div class="num font_40">(<span id="nbytes_reviewCtt">0</span>/300)</div>
			</div>
			<!-- //작성-->
		</div>
		<div class="btn_two">
			<a href="javascript:void(0);" onclick="javascript:fn_deleteReview();"><span class="btn_icon text_0">삭제</span></a><a href="javascript:void(0);" onclick="javascript:fn_updateReviewProc();">후기 수정</a>
		</div>
	</section>
<form name="updateForm" id="updateForm" method="post" action="">
	<input type="hidden" id="curriculum" name="curriculum">
	<input type="hidden" id="kindness" name="kindness">
	<input type="hidden" id="timePro" name="timePro">
	<input type="hidden" id="community" name="community">
	<input type="hidden" id="reviewCtt" name="reviewCtt">
	<input type="hidden" id="reviewId" name="reviewId" value="${resultVO.reviewId}">
	<input type="hidden" id="classId" name="classId" value="${resultVO.classId}">
</form>

<script type="text/javascript">
$(function() {
	//별점 초기값
	var curriculum = "${resultVO.curriculum}";
	var timePro = "${resultVO.timePro}";
	var community = "${resultVO.community}";
	var kindness = "${resultVO.kindness}";
	for(var i=0; i < curriculum; i++) {
		$("#curriculum").children(":eq("+i+")").addClass('on');
	}
	for(var i=0; i < timePro; i++) {
		$("#timePro").children(":eq("+i+")").addClass('on');
	}
	for(var i=0; i < community; i++) {
		$("#community").children(":eq("+i+")").addClass('on');
	}
	for(var i=0; i < kindness; i++) {
		$("#kindness").children(":eq("+i+")").addClass('on');
	}
});

//별점 클릭
$(".starRev span").click(function(){
	var classAttr = $(this).attr("class");
	if(classAttr == "starR") {
		$(this).addClass('on').prevAll('span').addClass('on');
	} else { //starR on
		$(this).removeClass('on').nextAll('span').removeClass('on');
	}
	return false;
});

//후기수정
var fn_updateReviewProc = function() {
	var curriculum = $("#curriculum > .starR.on").length*1;
	var kindness = $("#kindness > .starR.on").length*1;
	var timePro = $("#timePro > .starR.on").length*1;
	var community = $("#community > .starR.on").length*1;
	var reviewCtt = $("#reviewCttTextArea").val();
	$("#updateForm #reviewCtt").val(reviewCtt); //리뷰내용
	$("#updateForm #curriculum").val(curriculum); //커리큘럼평점
	$("#updateForm #kindness").val(kindness); //친절도평점
	$("#updateForm #timePro").val(timePro); //시간준수 평점
	$("#updateForm #community").val(community); //전달력 평점
	$("#updateForm").attr("action", "${basePath}/mypage/r/n/updateReviewProc.do");
	$("#updateForm").submit();
};

//후기삭제
var fn_deleteReview = function() {
	$("#updateForm").attr("action", "${basePath}/mypage/r/n/deleteReviewProc.do");
	$("#updateForm").submit();
};
</script>
</body>
</html>