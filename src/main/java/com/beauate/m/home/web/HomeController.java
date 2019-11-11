package com.beauate.m.home.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.m.home.service.HomeService;
import com.beauate.m.offClass.service.ClassVO;

@Controller
public class HomeController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "homeService")
	private HomeService homeService;
	/**
	 * <pre>
	 * 1. 개요 : 메인화면
	 * 2. 처리내용 : 메인화면
	 * </pre>
	 * @Method Name : main
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param 
	 * @param 
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value="/home/a/n/main.do")
	public String main(ClassVO classVO, ModelMap model) throws Exception{
		List<ClassVO> bestList = homeService.selectMainList(classVO);
		model.addAttribute("bestList", bestList);
		return "/home/main";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 하단 메뉴리스트
	 * 2. 처리내용 : 하단 메뉴리스트
	 * </pre>
	 * @Method Name : selectMenuList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param 
	 * @param 
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value="/home/a/n/selectMenuList.do")
	public String selectMenuList() throws Exception{
		return "/home/menuList";
	}
}
