<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mbeauate/common/include.jsp"%>
<div class="footer_wrap">
	<div>
		<div>
			<p>미용교육전문 매거진</p>
			<h1>뷰아떼</h1>
		</div>
		<div>
			<ul class="row sns">
				<li onclick="javascript:fn_sns('insta');" style="position:relative; z-index:9999;"><a href="javascript:void(0);"></a></li>
				<li onclick="javascript:fn_sns('faceBook');" style="position:relative; z-index:9999;"><a href="javascript:void(0);"></a></li>
				<li onclick="javascript:fn_sns('naverBlog');" style="position:relative; z-index:9999;"><a href="javascript:void(0);"></a></li>
			</ul>
		</div>
	</div>
	<div class="info">
		<ul class="row">
			<li><a href="https://docs.google.com/document/d/1m_I1l9hSjZQIxQt1Yk61F5PXLw57SLy9aAUpmJ4TfL8/edit?usp=sharing" style="position:relative; z-index:9999;" target="_blank">개인정보취급방침</a></li>
			<li><a href="https://docs.google.com/document/d/1bnaICcR8reoAvfMxg2wP8jGKy0V3_SC0X6Yv4cwkctc/edit" style="position:relative; z-index:9999;" target="_blank">이용약관</a></li>
			<li><a href="${basePath}/mento/a/n/mentoApply.do" style="position:relative; z-index:9999;" >멘토지원</a></li>
			<li><a href="${basePath}/board/a/n/selectBoardList.do" style="position:relative; z-index:9999;">공지사항</a></li>
		</ul>
	</div>
	<div>
		<address>
			대표자 : 박소현 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소 : 경기도 안산시 단원구 원곡1동 931<br> 이메일 : beauate@beauate.com &nbsp;&nbsp;카카오톡플러스친구 : 뷰아떼<br>
			<p>COPYRIGHTS© 2019 BEAUATE. ALL RIGHTS RESERVED</p>
		</address>
	</div>
</div>


<!-- Channel Plugin Scripts -->
<script>
//SNS
var fn_sns = function(param) {
	if(param == 'insta') {
		window.open("https://www.instagram.com/beauate");
	} else if(param == 'faceBook') {
		alert("준비중입니다.");
	} else { //naverBlog
		window.open("https://blog.naver.com/beauate");
	}
};

  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "58472c3c-9a08-4d7c-a671-96de913e4d6e"
  });
</script>
<!-- End Channel Plugin -->