package com.beauate.m.mypage.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 메뉴리스트
	 * 2. 처리내용 : 마이페이지 메뉴리스트
	 * </pre>
	 * @Method Name : selectMyPageList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/t/selectMyPageList.do")
	public String selectMyPageList() throws Exception {
		return "/mypage/myPageList";
	}
}
