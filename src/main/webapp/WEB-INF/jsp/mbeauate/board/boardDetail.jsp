<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<meta name="naver-site-verification" content="c03e63b14e10bb3c48bb213c40e148287b19ea7f"/>
<title>BEAUATE</title>
<link rel="stylesheet" type="text/css" href="${cssPath}/common.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/reset.css" />
<link rel="stylesheet" type="text/css" href="${cssPath}/input.css">
<script type="text/javascript" src="${scriptPath}/jquery/jquery-1.11.2.min.js"></script>
</head>
<body>
<input type="hidden" id="beforePostId" value="${boardVO.postId}">
	<div id="wrap">
		<header>
			<div class="sub_header">
				<a class="btn_back" href="#" onclick="window.history.back();return false;"></a>
				<h1>공지사항</h1>
				<a class="btn_home" href="${basePath}/home/a/n/main.do"></a>
			</div>
		</header>
		<section class="my_menu2">
			<div class="board-view">
				<div class="board-view-top">
					<div class="title"><c:out value="${boardVO.postTitle}"/></div>
					<div class="date"><fmt:formatDate value="${boardVO.postDt}" pattern="yy.MM.dd"/></div>
				</div>
				<div class="board-view-cot">
					<c:if test="${not empty boardVO.imgSrc }">
						<c:choose>
							<c:when test="${not empty boardVO.couponId }">
								<p>
									<a href="javascript:void(0);" onclick="javascript:fn_couponEvent('${boardVO.couponId}');"><img src="${uploadPath}/<c:out value="${boardVO.imgSrc }"/>" alt="" /></a>
								</p>
							</c:when>
							<c:otherwise>
								<p><img src="${uploadPath}/<c:out value="${boardVO.imgSrc }"/>" alt="" /></p>
							</c:otherwise>
						</c:choose>
						<br>
					</c:if>
					<p><c:out value="${boardVO.postCtt}"/></p>
				</div>
				<div class="board-view-fot">
<!-- 					<a href="javascript:void(0);" onclick="javascript:fn_searchNextOrPrev('N');" class="btn-prev">이전 목록</a> -->
					<a href="${basePath}/board/a/n/selectBoardList.do" class="btn-list">목록</a>
<!-- 					<a href="javascript:void(0);" onclick="javascript:fn_searchNextOrPrev('Y');" class="btn-next">다음 목록</a> -->
				</div>
			</div>
			<div class="h60"></div>
		</section>
	</div>
<script>

//nextYn : 다음글(Y), 이전글(N)
/* var fn_searchNextOrPrev = function(nextYn) {
	var params = {};
	params.postCategorySt = "${boardVO.postCategorySt}";
	params.postId = "${boardVO.postId}";
	params.nextYn = nextYn;
	params.postTitle = "${boardVO.postTitle}";
	params.postSubTitle = "${boardVO.postSubTitle}";
	params.imgSrc = "${boardVO.imgSrc}";
	params.postCtt = "${boardVO.postCtt}";
	$.ajax({	
		url: "${basePath}/board/a/t/selectBoardNextPrev.do",
		data: params,
		type: 'POST',
		dataType: 'html',
		cache: false,
		success: function(r) {
			$('#target').children().remove();
			$('#target').html(r);
			if($('#beforePostId').val() == params.postId) {
				alert("마지막 글입니다.");
			}
		},
		error : function() {
			alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
}; */

//쿠폰이벤트
var fn_couponEvent = function(couponId) {
	var usrId = "${sessionScope.loginVO.usrId}";
	if(usrId == null || usrId == "") {
		alert("로그인 후 사용이 가능합니다.");
		fn_loginPopUpLayer();
		return;
	}
	var params = {};
	params.usrId = usrId;
	params.couponId = couponId;
	//쿠폰내역 테이블에 쿠폰이 있으면 이미 받았다. 없으면 발급했다.
	$.ajax({	
		url: "${basePath}/board/w/t/insertCouponHistoryProc.do",
		data: params,
		type: 'POST',
		dataType: 'json',
		cache: false,
		success: function(r) {
			if(r.result) {
				alert("쿠폰 발급이 완료되었습니다.");
			} else {
				alert("이미 쿠폰을 발급 받으셨습니다.");
			}
		},
		error : function() {
			alert('오류가 발생했습니다.\n관리자에게 문의 바랍니다.');
		}
	});
};
</script>
</body>
</html>