package com.beauate.m.login.web;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.m.common.service.CommonUtils;
import com.beauate.m.common.service.GlobalConstants;
import com.beauate.m.login.service.LoginService;
import com.beauate.m.login.service.LoginVO;
import com.beauate.m.role.service.RoleVO;
import com.beauate.m.user.service.UserService;
import com.beauate.m.user.service.UserStatsVO;
import com.beauate.m.user.service.UserVO;

@Controller
public class LoginController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="commonUtils")
	private CommonUtils commonUtils;
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	/**
	 * <pre>
	 * 1. 개요 : 로그인 화면을 보여준다. 
	 * 2. 처리내용 : 로그인 화면을 보여준다. 
	 * </pre>
	 * @Method Name : login
	 * @date : 2019. 6. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/login/a/n/login.do")
	public String login(@ModelAttribute("loginVO") LoginVO loginVO) throws Exception {
		return "/login/login";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 뷰아떼 사용자인지 체크
	 * 2. 처리내용 : 뷰아떼 사용자인지 체크 
	 * </pre>
	 * @Method Name : selectIdPwdcheck
	 * @date : 2019. 6. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/login/a/n/selectIdPwdcheck.do")
	public String selectIdPwdcheck(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {
		//비밀 번호 암호화
		log.debug("Before usrPw:"+loginVO.getUsrPw());
		String passwd = commonUtils.encryption(loginVO.getUsrPw());
		loginVO.setUsrPw(passwd);
		LoginVO resultVO = (LoginVO)loginService.selectLoginUserInfo(loginVO);
		if(resultVO == null){
			model.addAttribute("message", "N");
		} else {
			model.addAttribute("message", "Y");
		}
		return "jsonView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 로그인처리
	 * 2. 처리내용 : 로그인처리 
	 * </pre>
	 * @Method Name : selectIdPwdcheck
	 * @date : 2019. 6. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/login/a/n/afterLogin.do")
	public String afterLogin(HttpServletRequest request, SessionStatus status, @ModelAttribute("loginVO") LoginVO loginVO, ModelMap model) throws Exception {
		
		//비밀 번호 암호화
		log.debug("Before usrPw:"+loginVO.getUsrPw());
		String passwd = commonUtils.encryption(loginVO.getUsrPw());
		loginVO.setUsrPw(passwd);
		//========================== @.사용자 정보 세팅
		LoginVO resultVO = new LoginVO();
		resultVO = (LoginVO)loginService.selectLoginUserInfo(loginVO);
		if(resultVO == null){
			model.addAttribute("message", "로그인정보가 잘못되었습니다. 확인해주십시오.");
			model.addAttribute("redirectUrl", "/home/a/n/main.do");

			return "/common/temp_action_message";
		}
		
		//========================== @.권한 세팅dmd
		resultVO.setRoleList((ArrayList<RoleVO>)loginService.selectUserRoleList(resultVO));

		//========================== @.상단 포탈관리 버튼 권한 구분값(포탈관리 메뉴에 권한이 한개라도 있으면 Y)
		int portalManageMenuCnt = loginService.selectPortalManageRoleCnt(resultVO);
		
		if(portalManageMenuCnt > 0){
			resultVO.setPortalManageGunbun("Y");
		}
		log.debug("loginService.selectUserRoleList.size:"+resultVO.getRoleList().size());
		
		request.getSession().setAttribute(GlobalConstants.LOGIN_SESSION_KEY, resultVO);
		
		//사용자 통계 등록
		UserStatsVO userStatsVO = new UserStatsVO();
		userStatsVO.setAccessId(resultVO.getUsrId());
		userStatsVO.setAccessIp(request.getRemoteAddr());
		userService.insertUserStatisticsProc(userStatsVO);
		status.setComplete();
		
		//관리자페이지 브릿지 mong
//		return "redirect:/common/a/n/portalAdminBridge.do";
		return "redirect:/home/a/n/main.do";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 로그아웃
	 * 2. 처리내용 : 로그아웃
	 * </pre>
	 * @Method Name : userLogout
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login/a/n/logOut.do")
	public String userLogout(HttpServletRequest request, LoginVO sessionVO, ModelMap model ) throws Exception{
		
		HttpSession session = request.getSession();
		session.setAttribute(GlobalConstants.LOGIN_SESSION_KEY, null);
		session.invalidate();
		
		return "redirect:/home/a/n/main.do";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 비밀번호 찾기
	 * 2. 처리내용 : 비밀번호 찾기
	 * </pre>
	 * @Method Name : userLogout
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param 
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value="/login/a/n/selectUserPwdChange.do")
	public String selectUserPwdChange() throws Exception{
		return "/login/userPwdChange";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 인증번호 발송
	 * 2. 처리내용 : 인증번호 발송
	 * </pre>
	 * @Method Name : userLogout
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value="/login/a/n/selectPwdMailSearch.do")
	public String selectPwdMailSearch(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model, HttpServletRequest request) throws Exception{
		
		String message;
		String redirectUrl;
		String secureKey = "";
		try {
			secureKey = loginService.selectPwdSearch(loginVO.getEmailAddr());
			loginVO.setSecureKey(secureKey);
			request.getSession().setAttribute(GlobalConstants.MAIL_SECURE_KEY, loginVO);
			log.debug("사용자 이메일 임시비밀번호 >>>>>>>>>>>>>>>>>>>>>> "+loginVO.getEmailAddr()+" >> "+loginVO.getSecureKey());
			redirectUrl = "/login/a/n/selectCertNumCheck.do";
			message = "인증번호가 전송 되었습니다.";
		} catch (Exception e) {
			redirectUrl = "/login/a/n/selectUserPwdChange.do";
			message = "현재 메일 서비스가 원활하지 않습니다. 잠시후 다시 이용해 주십시요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return "/common/temp_action_message";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 인증번호 검증화면
	 * 2. 처리내용 : 인증번호 검증화면
	 * </pre>
	 * @Method Name : selectCertNumCheck
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param 
	 * @param 
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value="/login/a/n/selectCertNumCheck.do")
	public String selectCertNumCheck() throws Exception{
		return "/login/certNumInsert";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 인증번호 검증처리
	 * 2. 처리내용 : 인증번호 검증처리
	 * </pre>
	 * @Method Name : selectCertNumCheck
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param String
	 * @param ModelMap
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value="/login/a/n/certNumCheckProc.do")
	public String certNumCheckProc(String mailSecureKey, ModelMap model, HttpServletRequest request) throws Exception{

		LoginVO loginVO = (LoginVO) request.getSession().getAttribute(GlobalConstants.MAIL_SECURE_KEY);
		String message;
		String redirectUrl;
		
		if(loginVO.getSecureKey().equals(mailSecureKey)) {
			redirectUrl = "/login/a/n/insertNewPassword.do";
			message = "인증 되었습니다.";
		} else {
			redirectUrl = "/login/a/n/selectCertNumCheck.do";
			message = "인증번호와 일치하지 않습니다. 다시 시도해주세요.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return "/common/temp_action_message";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 새 비밀번호 입력화면
	 * 2. 처리내용 : 새 비밀번호 입력화면
	 * </pre>
	 * @Method Name : insertNewPassword
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param
	 * @param
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value="/login/a/n/insertNewPassword.do")
	public String insertNewPassword() throws Exception{
		return "/login/newPwdInsert";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 새 비밀번호 수정처리
	 * 2. 처리내용 : 새 비밀번호 수정처리
	 * </pre>
	 * @Method Name : insertNewPassword
	 * @date : 2019. 9. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param
	 * @param
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value="/login/w/n/updateNewPwdProc.do")
	public String updateNewPwdProc(@ModelAttribute("loginVO") LoginVO loginVO, ModelMap model, HttpServletRequest request, SessionStatus status) throws Exception{
		String message;
		String redirectUrl;
		try {
			LoginVO resultVO = (LoginVO) request.getSession().getAttribute(GlobalConstants.MAIL_SECURE_KEY);
			UserVO userVO = new UserVO();
			userVO.setEmailAddr(resultVO.getEmailAddr());
			userVO.setUsrPw(loginVO.getUsrPw());
			log.debug("resultVO.getEmailAddr() >>>>>>>>>>>>>>> "+resultVO.getEmailAddr()+" >>>>>>> "+loginVO.getUsrPw());
			int cnt = loginService.userPwReset(userVO);
			model.addAttribute("updateCnt", cnt);
			log.debug("updatePwdChange Web >>> "+ cnt);
			
			redirectUrl = "/login/a/n/login.do";
			message = "수정 되었습니다.";
			//중복 submit 방지
			status.setComplete();
		} catch (Exception e) {
			redirectUrl = "/login/a/n/insertNewPassword.do";
			message = "현재 서비스가 원활하지 않습니다. 잠시후 다시 이용해 주십시요.";
		}
		model.addAttribute("message", message);
		model.addAttribute("redirectUrl", redirectUrl);
		
		return "/common/temp_action_message";
	}
}
