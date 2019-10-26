<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<ul class="inner" id="menuTabs">
	<li tabId="1"><a href="javascript:void(0);">메뉴</a></li>
	<li tabId="2"><a href="javascript:void(0);">홈</a></li>
	<li tabId="3"><a href="javascript:void(0);">검색</a></li>
	<c:choose>
		<c:when test="${empty sessionScope.loginVO.emailAddr || sessionScope.loginVO.emailAddr eq ''}">
			<li tabId="4"><a href="javascript:void(0);">로그인</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="${basePath}/mypage/r/t/selectMyPageList.do">마이</a></li>
		</c:otherwise>
	</c:choose>
</ul>
<form name="menuForm" id="menuForm" action="">
</form>
<script>
$("ul#menuTabs li").click(function() {
	var tabId = $(this).attr("tabId");
	fn_menuCommon(tabId);
});

var fn_menuCommon = function(tabId) {
	if(tabId == '1') {
		url = "${basePath}/home/a/n/selectMenuList.do";
	} else if(tabId == '2') {
		url = "${basePath}/home/a/n/main.do";
	} else if(tabId == '3') {
		url = "${basePath}/mypage/r/n/selectUsePossibleCpnList.do";
	} else if(tabId == '4') {
		url = "${basePath}/login/a/n/login.do";
	} else {
		url = "${basePath}/mypage/r/n/updateMyInfo.do";
	}
	$("#menuForm").attr("action", url);
	$("#menuForm").submit();
};
</script>