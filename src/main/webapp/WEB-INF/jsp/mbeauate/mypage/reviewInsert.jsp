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
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
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
			<h1>클래스 후기 작성</h1>
		</div>
	</header>
	<section class="my_menu2">
		<!-- 타이틀 -->
		<div class="page-tit">
			<h2 class="review2_tit">클래스 후기 작성</h2>
		</div>
		<!-- //타이틀 -->
		<div class="review_list">
			<!-- 후기 썸네일-->
			<div class="list_theme_item">
				<div class="img">
					<div class="img_inner">
						<img src="${uploadPath}/<c:out value="${resultVO.imgSrc3 }"/>"/>
					</div>
				</div>
				<div class="text_wrap">
					<div class="etc_info">
						<div class="tit_info font_60"><c:out value="${resultVO.classTitle }"/></div>
						<span>헤어</span><span class="day_open2">
							<fmt:parseDate value="${resultVO.classStartDt}" var="classStartDt" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${classStartDt}" pattern="yyyy.MM.dd"/>
						</span>
					</div>
				</div>
			</div>
			<!-- //후기 썸네일---->
			<div class="mypageR_star">
				<ul>
					<li>커리큘럼</li>
					<li>친절도</li>
					<li>시간준수</li>
					<li>전달력</li>
				</ul>
				<ul class="star2">
					<li class="starRev" id="curriculum">
						<span class="starR on">별1</span>
						<span class="starR on">별2</span>
						<span class="starR on">별3</span>
						<span class="starR on">별4</span>
						<span class="starR on">별5</span>
					</li>
					<li class="starRev" id="kindness">
						<span class="starR on">별1</span>
						<span class="starR on">별2</span>
						<span class="starR on">별3</span>
						<span class="starR on">별4</span>
						<span class="starR on">별5</span>
					</li>
					<li class="starRev" id="timePro">
						<span class="starR on">별1</span>
						<span class="starR on">별2</span>
						<span class="starR on">별3</span>
						<span class="starR on">별4</span>
						<span class="starR on">별5</span>
					</li>
					<li class="starRev" id="community">
						<span class="starR on">별1</span>
						<span class="starR on">별2</span>
						<span class="starR on">별3</span>
						<span class="starR on">별4</span>
						<span class="starR on">별5</span>
					</li>
				</ul>
			</div>
			<!-- //별점-->
			<!--작성-->
			<div class="write">
				<p class="font_60">
					<textarea style="width: 100%" id="reviewCttTextArea" name="reviewCttTextArea" rows="5" onfocus="checker(this, 300 , 'nbytes_reviewCtt');" onblur="stopchecker();" placeholder="멘티님께 어떤 도움이 되었나요?"></textarea>
				</p>
				<div class="num font_40">(<span id="nbytes_reviewCtt">0</span>/300)</div>
			</div>
			<!-- //작성-->
		</div>
		<div class="btn_more">
			<a href="javascript:void(0);" onclick="javascript:fn_insertReviewProc();">후기 등록</a>
		</div>
	</section>
<form name="reviewWriteForm" id="reviewWriteForm" method="post" action="${basePath}/mypage/w/n/insertReviewProc.do">
	<input type="hidden" id="curriculum" name="curriculum">
	<input type="hidden" id="kindness" name="kindness">
	<input type="hidden" id="timePro" name="timePro">
	<input type="hidden" id="community" name="community">
	<input type="hidden" id="reviewCtt" name="reviewCtt">
	<input type="hidden" id="classId" name="classId" value="${resultVO.classId}">
</form>
<script type="text/javascript">
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

//후기등록
var fn_insertReviewProc = function() {
	var curriculum = $("#curriculum > .starR.on").length*1;
	var kindness = $("#kindness > .starR.on").length*1;
	var timePro = $("#timePro > .starR.on").length*1;
	var community = $("#community > .starR.on").length*1;
	var reviewCtt = $("#reviewCttTextArea").val();
	$("#reviewWriteForm #reviewCtt").val(reviewCtt); //리뷰내용
	$("#reviewWriteForm #curriculum").val(curriculum); //커리큘럼평점
	$("#reviewWriteForm #kindness").val(kindness); //친절도평점
	$("#reviewWriteForm #timePro").val(timePro); //시간준수 평점
	$("#reviewWriteForm #community").val(community); //전달력 평점
	
	if(reviewCtt == null && reviewCtt == "") {
		alert("후기를 등록해주세요.");
		$("#reviewCtt").focus();
		return;
	}
	
	$.ajax({ 	
		url: "${basePath}/mypage/r/n/selectUserReviewCnt.do",
		type: 'POST',
		dataType : "json",
		data : {"classId" : $("#reviewWriteForm #classId").val()},
		error: function(){
			 alert("현재 리뷰 서비스가 원할하지 않습니다.\n잠시후 다시 이용해 주십시요.");
			 return;
		},
		success: function(r) { 
			if(r.cnt == 0) {
				$("#reviewWriteForm").submit();
			} else{
				alert("해당 클래스에 이미 작성된 리뷰가 있습니다.");
				return;
			}
		}
	});
	
	
};
</script>
</body>
</html>