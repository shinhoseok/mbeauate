package com.beauate.m.mypage.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.m.common.service.CommonUtils;
import com.beauate.m.common.service.StringUtil;
import com.beauate.m.jjim.service.JjimVO;
import com.beauate.m.login.service.LoginVO;
import com.beauate.m.mypage.service.MyPageService;
import com.beauate.m.pay.service.PayVO;
import com.beauate.m.review.service.ReviewService;
import com.beauate.m.user.service.UserVO;

@Controller
public class MyPageController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "myPageService")
	private MyPageService myPageService;
	
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	@Resource(name="commonUtils")
	private CommonUtils commonUtils;
	
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
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/t/selectMyPageList.do")
	public String selectMyPageList(PayVO payVO ,ModelMap model, LoginVO sessionVO) throws Exception {
		
		payVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rsltMap = myPageService.selectMyPageList(payVO);
		model.addAttribute("rslt", rsltMap);
		
		return "/mypage/myPageList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 신청한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 신청한 클래스 리스트
	 * </pre>
	 * @Method Name : selectMyClassList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/t/selectMyClassList.do")
	public String selectMyClassList() throws Exception {
		return "/mypage/applyClassList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 신청한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 신청한 클래스 리스트
	 * </pre>
	 * @Method Name : selectMyClassList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/t/selectMyClassAjaxList.do")
	public String selectMyClassAjaxList(@ModelAttribute("payVO") PayVO payVO, ModelMap model, LoginVO sessionVO) throws Exception {
		payVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rsltMap = myPageService.selectApplyClassList(payVO);
		model.addAttribute("rslt", rsltMap);
		model.addAttribute("payVO", payVO);
		return "/mypage/applyClassListAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 결제내역삭제
	 * 2. 처리내용 :  결제내역삭제
	 * </pre>
	 * @Method Name : deletePayProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/mypage/w/n/deletePayProc.do")
	public String deletePayProc(PayVO payVO, ModelMap model, SessionStatus status) throws Exception {
		myPageService.deletePayProc(payVO);
		status.setComplete();	//중복 submit 방지
		return "redirect:/mypage/r/t/selectMyClassList.do";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 취소/환불처리
	 * 2. 처리내용 :  취소/환불처리
	 * </pre>
	 * @Method Name : updatePayRefundProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/mypage/w/n/updatePayRefundProc.do")
	public String updatePayRefundProc(PayVO payVO, ModelMap model, SessionStatus status) throws Exception {
		myPageService.updatePayRefundProc(payVO);
		status.setComplete();	//중복 submit 방지
		String message = null;
		message = "취소처리가 완료되었습니다.";

		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", "/mypage/r/t/selectMyClassList.do");
		
		return "/common/temp_action_message";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 찜한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 찜한 클래스 리스트
	 * </pre>
	 * @Method Name : selectMyJjimClassList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param jjimVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/n/selectMyJjimClassList.do")
	public String selectMyJjimClassList() throws Exception {
		return "/mypage/jjimClassList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 찜한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 찜한 클래스 리스트
	 * </pre>
	 * @Method Name : selectMyJjimClassList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param jjimVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/r/n/selectMyJjimClassAjaxList.do")
	public String selectMyJjimClassAjaxList(@ModelAttribute("jjimVO") JjimVO jjimVO, ModelMap model, LoginVO sessionVO) throws Exception {
		
		jjimVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rsltMap = myPageService.selectJjimList(jjimVO);
		model.addAttribute("rslt", rsltMap);
		model.addAttribute("jjimVO", jjimVO);
		
		return "/mypage/jjimClassListAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 찜삭제
	 * 2. 처리내용 :  찜삭제
	 * </pre>
	 * @Method Name : deleteJjimProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	@RequestMapping(value = "/mypage/w/n/deleteJjimProc.do")
	public String deleteJjimProc(JjimVO jjimVO, ModelMap model, SessionStatus status) throws Exception {
		
		String message;
		String redirectUrl;
		
		try {
			myPageService.deleteJjimProc(jjimVO);
			status.setComplete();	//중복 submit 방지
			redirectUrl = "/mypage/r/n/selectMyJjimClassList.do";
			message = "찜이 모두 삭제 되었습니다.";
		} catch (Exception e) {
			redirectUrl = "/mypage/r/n/selectMyJjimClassList.do";
			message = "현재 서비스가 원활하지 않습니다. 잠시후 다시 이용해 주십시요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return "/common/temp_action_message";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보수정
	 * 2. 처리내용 : 마이페이지 내 정보수정
	 * </pre>
	 * @Method Name : updateMyInfo
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
	@RequestMapping(value = "/mypage/r/n/updateMyInfo.do")
	public String updateMyInfo(UserVO userVO, ModelMap model, LoginVO sessionVO) throws Exception {
		userVO.setUsrId(sessionVO.getUsrId());
		UserVO resultVO = myPageService.updateMyInfo(userVO);
		model.addAttribute("resultVO", resultVO);
		return "/mypage/myInfoUpdate";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보수정 > 휴대폰,패스워드 변경 처리
	 * 2. 처리내용 : 마이페이지 내 정보수정 > 휴대폰,패스워드 변경 처리
	 * </pre>
	 * @Method Name : updateMblPnoProc
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/w/n/updateMblPnoProc.do")
	public String updateMblPnoProc(UserVO userVO, ModelMap model, LoginVO sessionVO, SessionStatus status) throws Exception {
		String message;
		String redirectUrl;
		if(!StringUtil.isEmpty(userVO.getUsrPw())) {
			userVO.setPwChangeGubun("Y");
			log.debug("Before usrPw:"+ userVO.getUsrPw());
			String passwd = commonUtils.encryption(userVO.getUsrPw());
			log.debug("After usrPw:"+ passwd);
			userVO.setUsrPw(passwd);
		}
		
		if(StringUtil.isEmpty(userVO.getMblPno())) {
			userVO.setMblPno(sessionVO.getMblPno());
		}
		
		try {
			userVO.setUsrId(sessionVO.getUsrId());
			myPageService.updateMblPnoProc(userVO);
			redirectUrl = "/mypage/r/n/updateMyInfo.do";
			message = "수정 되었습니다.";
			//중복 submit 방지
			status.setComplete();
		} catch (Exception e) {
			redirectUrl = "/mypage/r/n/updateMyInfo.do";
			message = "현재 서비스가 원활하지 않습니다. 잠시후 다시 이용해 주십시요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return "/common/temp_action_message";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보수정 > 회원탈퇴
	 * 2. 처리내용 : 마이페이지 내 정보수정 > 회원탈퇴
	 * </pre>
	 * @Method Name : deleteMemberProc
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/mypage/w/n/deleteMemberProc.do")
	public String deleteMemberProc(UserVO userVO, ModelMap model, LoginVO sessionVO, SessionStatus status) throws Exception {
		String message;
		String redirectUrl;
		
		try {
			userVO.setUsrId(sessionVO.getUsrId());
			myPageService.deleteMemberProc(userVO);
			redirectUrl = "/login/a/n/logOut.do";
			message = "탈퇴 되었습니다.";
			//중복 submit 방지
			status.setComplete();
		} catch (Exception e) {
			redirectUrl = "/mypage/r/n/updateMyInfo.do";
			message = "현재 서비스가 원활하지 않습니다. 잠시후 다시 이용해 주십시요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return "/common/temp_action_message";
	}
}
