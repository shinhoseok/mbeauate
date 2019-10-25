package com.beauate.m.user.web;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
public class UserController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name="commonUtils")
	private CommonUtils commonUtils;
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	/**
	 * <pre>
	 * 1. 개요 : 회원가입
	 * 2. 처리내용 : 회원가입
	 * </pre>
	 * @Method Name : userInsert
	 * @date : 2019. 9. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/a/t/insertUser.do")
	public String insertUser(@ModelAttribute("userVO") UserVO userVO) throws Exception{
		return "/user/userInsert";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자아이디 중복체크
	 * 2. 처리내용 : 사용자 아이디가 중복되어있는지 체크하는 메서드
	 * </pre>
	 * @Method Name : selectUserIdChk
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
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/a/n/selectUserIdChk.do")
	public String selectUserIdChk(@ModelAttribute("userVO") UserVO userVO, ModelMap model) throws Exception {
		
		int cnt = userService.selectUserIdChk(userVO);
		if(cnt > 0){
			model.addAttribute("chkResult", false);
		}else{
			model.addAttribute("chkResult", true);
		}

		return "jsonView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 회원가입
	 * 2. 처리내용 : 회원가입
	 * </pre>
	 * @Method Name : insertUserProc
	 * @date : 2019. 9. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param request
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/w/n/insertUserProc.do")
	public String insertUserProc(HttpServletRequest request, @ModelAttribute("userVO") UserVO userVO, SessionStatus status, ModelMap model) throws Exception {
		
		try {
			//회원가입처리
			userService.insertUserProc(userVO);
			//중복 submit 방지
			status.setComplete();
			
			//로그인처리
			LoginVO loginVO = new LoginVO();
			loginVO.setEmailAddr(userVO.getEmailAddr());
			loginVO.setUsrPw(userVO.getUsrPw());
			//========================== @.사용자 정보 세팅
			LoginVO resultVO = (LoginVO)loginService.selectLoginUserInfo(loginVO);
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
//			return "redirect:/common/a/n/portalAdminBridge.do";
			return "redirect:/home/a/n/main.do";

		} catch (Exception e) {
			String message= "현재 서비스가 원활하지 않습니다.\n잠시후 다시 이용해 주십시요.";
			String redirectUrl = "/user/a/t/insertUser.do";
			
			model.addAttribute("message", message);
			model.addAttribute("redirectUrl", redirectUrl);
			
			return"/common/temp_action_message";
		}
	}
}
