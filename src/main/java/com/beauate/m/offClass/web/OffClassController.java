package com.beauate.m.offClass.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.m.common.service.StringUtil;
import com.beauate.m.coupon.service.CouponService;
import com.beauate.m.coupon.service.CouponVO;
import com.beauate.m.login.service.LoginVO;
import com.beauate.m.offClass.service.ClassVO;
import com.beauate.m.offClass.service.OffClassService;
import com.beauate.m.pay.service.PayVO;
import com.beauate.m.review.service.ReviewVO;

@Controller
public class OffClassController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "offClassService")
	private OffClassService offClassService;
	
	@Resource(name = "couponService")
	private CouponService couponService;
	
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
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 결제화면
	 * 2. 처리내용 : 오프라인클래스 결제화면
	 * </pre>
	 * @Method Name : selectOffClassApplyDetail
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
	@RequestMapping(value = "/offclass/r/t/selectOffClassApplyDetail.do")
	public String selectOffClassApplyDetail(@ModelAttribute("classVO") ClassVO classVO, ModelMap model, LoginVO sessionVO) throws Exception {
		classVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rsltMap = offClassService.selectOffClassApplyDetail(classVO);
		model.addAttribute("rslt", rsltMap);
		model.addAttribute("menTiMblPno", StringUtil.phone(sessionVO.getMblPno()));

		return "/offClass/offClassPay";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 결제화면 할인쿠폰적용 ajax
	 * 2. 처리내용 : 오프라인클래스 결제화면 할인쿠폰적용 ajax
	 * </pre>
	 * @Method Name : selectClassCoupon
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponId
	 * @param classCost
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offclass/r/n/selectClassCoupon.do")
	public String selectClassCoupon(String couponId, String classCost, ModelMap model) throws Exception {
		CouponVO paramVO = new CouponVO();
		paramVO.setCouponId(couponId);
		CouponVO couponVO = couponService.selectCpnMngDetail(paramVO);
		
		model.addAttribute("couponVO", couponVO);
		model.addAttribute("classCost", classCost);
		
		return "/offClass/offClassPayAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 결제시 수강인원체크
	 * 2. 처리내용 : 오프라인클래스 결제시 수강인원체크
	 * </pre>
	 * @Method Name : selectClassMemChk
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
	@RequestMapping(value = "/offclass/r/n/selectClassMemChk.do")
	public String selectClassMemChk(ClassVO classVO, ModelMap model) throws Exception {
		Map<String, Object> rsltMap = offClassService.selectClassMemChk(classVO);
		model.addAttribute("rslt", rsltMap);
		return "jsonView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 오프라인클래스 결제처리
	 * 2. 처리내용 : 오프라인클래스 결제처리
	 * </pre>
	 * @Method Name : selectClassCoupon
	 * @date : 2019. 10. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offclass/w/t/insertPayProc.do")
	public String insertPayProc(PayVO payVO, SessionStatus status, ModelMap model, LoginVO sessionVO) throws Exception {
		payVO.setUsrId(sessionVO.getUsrId());
		ClassVO resultVO = offClassService.insertPayProc(payVO);
		status.setComplete();	//중복 submit 방지
		String userMblPno = StringUtil.phone(sessionVO.getMblPno());
		String mentoMblPno = StringUtil.phone(payVO.getMentoMblPno());
		
		model.addAttribute("resultVO", resultVO);
		model.addAttribute("payVO", payVO);
		model.addAttribute("sessionVO", sessionVO);
		model.addAttribute("userMblPno", userMblPno);
		model.addAttribute("mentoMblPno", mentoMblPno);
		
		
		return "/offClass/offClassPayComplete";
	}
}
