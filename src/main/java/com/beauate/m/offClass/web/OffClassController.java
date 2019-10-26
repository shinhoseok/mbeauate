package com.beauate.m.offClass.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.m.login.service.LoginVO;
import com.beauate.m.offClass.service.ClassVO;
import com.beauate.m.offClass.service.OffClassService;
import com.beauate.m.review.service.ReviewVO;

@Controller
public class OffClassController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "offClassService")
	private OffClassService offClassService;
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 리스트(첫화면 페이징없이 헤어,메이크업, 전체)
	 * 2. 처리내용 : 오프라인클래스 리스트(첫화면 페이징없이 헤어,메이크업, 전체)
	 * </pre>
	 * @Method Name : selectOffClassList
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offclass/a/t/selectOffClassList.do")
	public String selectOffClassList(@ModelAttribute("classVO") ClassVO classVO, ModelMap model) throws Exception {
		
		Map<String, Object> rsltMap = offClassService.selectOffClassList(classVO);
		model.addAttribute("rslt", rsltMap);
		model.addAttribute("classVO", classVO);
		
		return "/offClass/offClassList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 리스트(첫화면 전체 ajax)
	 * 2. 처리내용 : 오프라인클래스 리스트(첫화면 전체 ajax)
	 * </pre>
	 * 
	 * @Method Name : selectOffClassAjaxList
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offclass/a/n/selectOffClassAjaxList.do")
	public String selectOffClassAjaxList(ClassVO classVO, ModelMap model) throws Exception {
		Map<String, Object> rsltMap = offClassService.selectAllOffClassList(classVO);
		model.addAttribute("rslt", rsltMap);
		model.addAttribute("classVO", classVO);
		return "/offClass/offClassAllList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 상세화면
	 * 2. 처리내용 : 오프라인클래스 상세화면
	 * </pre>
	 * @Method Name : selectOffClassDetail
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/offclass/a/t/selectOffClassDetail.do")
	public String selectOffClassDetail(@ModelAttribute("classVO") ClassVO classVO, ModelMap model, LoginVO sessionVO) throws Exception {
		classVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rsltMap = offClassService.selectOffClassDetail(classVO);
		model.addAttribute("rslt", rsltMap);
		return "/offClass/offClassDetail";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 상세화면
	 * 2. 처리내용 : 오프라인클래스 상세화면
	 * </pre>
	 * @Method Name : selectReviewList
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param classVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/offclass/a/n/selectReviewList.do")
	public String selectReviewList(ReviewVO reviewVO, ModelMap model) throws Exception {
		Map<String, Object> rsltMap = offClassService.selectReviewList(reviewVO);
		model.addAttribute("rslt", rsltMap);
		model.addAttribute("reviewVO", reviewVO);
		return "/offClass/offClassReviewList";
	}
}
