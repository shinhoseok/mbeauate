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
	<div id="wrap">
		<section>
			<!--메인배너-->
			<div class="main_bn">
				<div class="swiper-bar"></div>
				<div class="swiper-scrollbar"></div>
				<div class="swiper-num num">1/9</div>
				<img src="${imagePath}/temp/main_bn_img.jpg">
			</div>
			<!--//메인배너-->
			<!--전문가 교육소식-->
			<div class="about_class">
				<h2>전문가 교육소식</h2>
				<ul>
					<li><a href="javascript:void(0);"> <img src="${imagePath}/temp/list_02.jpg" />
					</a></li>
					<li><a href="javascript:void(0);"> <img src="${imagePath}/temp/list_02.jpg" />
					</a></li>
					<li><a href="javascript:void(0);"> <img src="${imagePath}/temp/list_02.jpg" />
					</a></li>
				</ul>
				<div class="btn_more">
					<a clas="icon_arr_more" href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=1"> 클래스 더보기 </a>
				</div>
			</div>
			<!--//전문가 교육소식-->
			<!--뷰티메뉴-->
			<div>
				<ul class="main_list_img">
					<h2>
						<p>
							각 분야의 뷰티전문가를 <br>만나보세요.
						</p>
					</h2>
					<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=1">
							<div>
								<img src="${imagePath}/common/icon_beauty_hair.png" />
							</div> 헤어
					</a></li>
					<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=2">
							<div>
								<img src="${imagePath}/common/icon_beauty_makeup.png" />
							</div> 메이크업
					</a></li>
					<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=3">
							<div>
								<img src="${imagePath}/common/icon_beauty_eyelash.png" />
							</div> 속눈썹/반영구
					</a></li>
					<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=4">
							<div>
								<img src="${imagePath}/common/icon_beauty_skin.png" />
							</div> 피부/왁싱
					</a></li>
					<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=5">
							<div>
								<img src="${imagePath}/common/icon_beauty_nail.png" />
							</div> 네일
					</a></li>
					<li><a href="${basePath}/offclass/a/t/selectOffClassList.do?classCtSt=6">
							<div>
								<img src="${imagePath}/common/icon_beauty_etc.png" />
							</div> 기타
					</a></li>
				</ul>
			</div>
			<!--//뷰티메뉴-->
			<!--슬라이드-->
			<div class="list_slide">
				<div class="list_slide_item">
					<a href="javascript:void(0);">
						<img photoNum="1" id="photo_0" src="${imagePath}/temp/bn_special.jpg" />
						<img photoNum="2" id="photo_1" style="display: none;" src="${imagePath}/temp/bn_special.jpg" />
						<img photoNum="3" id="photo_2" style="display: none;" src="${imagePath}/temp/bn_special.jpg" />
						<img photoNum="4" id="photo_3" style="display: none;" src="${imagePath}/temp/bn_special.jpg" />
						<img photoNum="5" id="photo_4" style="display: none;" src="${imagePath}/temp/bn_special.jpg" />
					</a>
				</div>
				<div class="slide_num_wrap">
					<a class="icon_arr_prev" href="javascript:void(0);" onclick="fn_imgMove('L');"></a>
					<span class="num"><strong class="num" id="slideNumText">1</strong>/5</span>
					<a class="icon_arr_next" href="javascript:void(0);" onclick="fn_imgMove('R');"></a>
				</div>
			</div>
			<!--//슬라이드-->
			<!--스페셜멘토 리스트-->
			<div class="list_main_wrap">
				<h2>
					<img src="${imagePath}/temp/tit_special.jpg" />
				</h2>
				<div class="list2_wrap">
					<div class="list2_item">
						<a href="#">
							<div class="img_wrap">
								<div class="img">
									<img src="${imagePath}/temp/img-tumb-290x295_2.png" alt="" />
								</div>
							</div>
							<div class="text_wrap">
								<div class="tit">대구</div>
								<div class="tit_info font_60">Self-하루만에 배우는 감쪽같은 속눈썹! 내 눈에 맞…</div>
								<div class="etc_info">
									<span>개강</span><span class="day_open">7월 23일(화)</span>
								</div>
							</div>
						</a>
					</div>
					<div class="list2_item">
						<a href="#">
							<div class="img_wrap">
								<div class="img">
									<img src="${imagePath}/temp/img-tumb-290x295_2.png" alt="" />
								</div>
							</div>
							<div class="text_wrap">
								<div class="tit">대구</div>
								<div class="tit_info font_60">Self-하루만에 배우는 감쪽같은 속눈썹! 내 눈에 맞…</div>
								<div class="etc_info">
									<span>개강</span><span class="day_open">7월 23일(화)</span>
								</div>
							</div>
						</a>
					</div>
					<div class="list2_item">
						<a href="#">
							<div class="img_wrap">
								<div class="img">
									<img src="${imagePath}/temp/img-tumb-290x295_2.png" alt="" />
								</div>
							</div>
							<div class="text_wrap">
								<div class="tit">대구</div>
								<div class="tit_info font_60">Self-하루만에 배우는 감쪽같은 속눈썹! 내 눈에 맞…</div>
								<div class="etc_info">
									<span>개강</span><span class="day_open">7월 23일(화)</span>
								</div>
							</div>
						</a>
					</div>
					<div class="list2_item">
						<a href="#">
							<div class="img_wrap">
								<div class="img">
									<img src="${imagePath}/temp/img-tumb-290x295_2.png" alt="" />
								</div>
							</div>
							<div class="text_wrap">
								<div class="tit">대구</div>
								<div class="tit_info font_60">Self-하루만에 배우는 감쪽같은 속눈썹! 내 눈에 맞…</div>
								<div class="etc_info">
									<span>개강</span><span class="day_open">7월 23일(화)</span>
								</div>
							</div>
						</a>
					</div>
					<div class="list2_item">
						<a href="#">
							<div class="img_wrap">
								<div class="img">
									<img src="${imagePath}/temp/img-tumb-290x295_2.png" alt="" />
								</div>
							</div>
							<div class="text_wrap">
								<div class="tit">대구</div>
								<div class="tit_info font_60">Self-하루만에 배우는 감쪽같은 속눈썹! 내 눈에 맞…</div>
								<div class="etc_info">
									<span>개강</span><span class="day_open">7월 23일(화)</span>
								</div>
							</div>
						</a>
					</div>
					<div class="list2_item">
						<a href="#">
							<div class="img_wrap">
								<div class="img">
									<img src="${imagePath}/temp/img-tumb-290x295_2.png" alt="" />
								</div>
							</div>
							<div class="text_wrap">
								<div class="tit">대구</div>
								<div class="tit_info font_60">Self-하루만에 배우는 감쪽같은 속눈썹! 내 눈에 맞…</div>
								<div class="etc_info">
									<span>개강</span><span class="day_open">7월 23일(화)</span>
								</div>
							</div>
						</a>
					</div>
					<div class="list2_item">
						<a href="#">
							<div class="img_wrap">
								<div class="img">
									<img src="${imagePath}/temp/img-tumb-290x295_2.png" alt="" />
								</div>
							</div>
							<div class="text_wrap">
								<div class="tit">대구</div>
								<div class="tit_info font_60">Self-하루만에 배우는 감쪽같은 속눈썹! 내 눈에 맞…</div>
								<div class="etc_info">
									<span>개강</span><span class="day_open">7월 23일(화)</span>
								</div>
							</div>
						</a>
					</div>
					<div class="list2_item">
						<a href="#">
							<div class="img_wrap">
								<div class="img">
									<img src="${imagePath}/temp/img-tumb-290x295_2.png" alt="" />
								</div>
							</div>
							<div class="text_wrap">
								<div class="tit">대구</div>
								<div class="tit_info font_60">Self-하루만에 배우는 감쪽같은 속눈썹! 내 눈에 맞…</div>
								<div class="etc_info">
									<span>개강</span><span class="day_open">7월 23일(화)</span>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!--//스페셜멘토 리스트-->
			<!--멘토지원 배너-->
			<div class="img_bn">
				<img src="${imagePath}/temp/bn_mentor.jpg" />
			</div>
			<!--//멘토지원 배너-->
			<!--푸터-->
			<footer>
				<%@ include file="/WEB-INF/jsp/mbeauate/common/footer.jsp"%>
			</footer>
			<!--// 푸터-->
			<!--메뉴-->
			<div id="floating_menu">
				<%@ include file="/WEB-INF/jsp/mbeauate/common/menu.jsp"%>
			</div>
			<!--// 메뉴-->
		</section>
	</div>
	
<script type="text/javascript">
//슬라이드 이미지  중간
var fn_imgMove = function(gubun) {
	var current = $("img[id^='photo_']:visible");
	var currentImgNum = current.attr("photoNum")*1+1;
	if(gubun == 'R') {
		if(current.is("img[id^='photo_']:last")) {
			alert("마지막 사진입니다.");
		} else {
			current.hide();
			current.next().show();
			$("#slideNumText").text(current.attr("photoNum")*1+1);
		}
	} else {
		if(current.is("img[id^='photo_']:first")) {
			alert("첫 사진입니다.");
		} else {
			current.hide();
			current.prev().show();
			$("#slideNumText").text(current.attr("photoNum")*1-1);
		}
	}
};
</script>
</body>
</htm>