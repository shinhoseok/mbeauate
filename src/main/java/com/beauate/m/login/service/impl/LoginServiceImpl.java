package com.beauate.m.login.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.beauate.m.common.service.CommonUtils;
import com.beauate.m.common.service.StringUtil;
import com.beauate.m.login.service.LoginDao;
import com.beauate.m.login.service.LoginService;
import com.beauate.m.login.service.LoginVO;
import com.beauate.m.role.service.RoleVO;
import com.beauate.m.user.service.UserDao;
import com.beauate.m.user.service.UserVO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="commonUtils")
	private CommonUtils commonUtils;
	
	@Resource(name="loginDao")
	private LoginDao loginDao;
	
	@Resource(name="propertiesService")
	private EgovPropertyService propertiesService; 

	@Resource(name="mailSender")
	private MailSender mailSender;
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	public LoginVO selectLoginUserInfo(LoginVO loginVO) throws Exception {
		return loginDao.selectLoginUserInfo(loginVO);
	}
	
	public List<RoleVO> selectUserRoleList(LoginVO loginVO) throws Exception {
		return loginDao.selectUserRoleList(loginVO);
	}
	
	public int selectPortalManageRoleCnt(LoginVO loginVO) throws Exception {
		return loginDao.selectPortalManageRoleCnt(loginVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 비밀번호찾기 임시비밀번호 발송
	 * 2. 처리내용 : 비밀번호찾기 임시비밀번호 발송
	 * </pre>
	 * @Method Name : selectPwdSearch
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 
	public String selectPwdSearch(String emailAddr) throws Exception {
		String secureKey = "";
		log.debug(">>> selectPwdSearch impl : "+emailAddr+" , "+ propertiesService.getString("mail.from.adress"));

		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(emailAddr);
		mailMessage.setFrom(propertiesService.getString("mail.from.adress"));
		mailMessage.setSubject(propertiesService.getString("mail.title"));
		//인증키생성
		secureKey = commonUtils.numberGen(6,2);
		mailMessage.setText(propertiesService.getString("mail.text")+" "+secureKey);
		mailSender.send(mailMessage);

		return secureKey;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 비밀번호 변경
	 * 2. 처리내용 : 비밀번호 변경
	 * </pre>
	 * @Method Name : userPwReset
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
	 * @return Integer
	 * @throws Exception
	 */ 
	public Integer userPwReset(UserVO userVO) throws Exception {
		String usrPw = "";
		if(!StringUtil.isEmpty(userVO.getUsrPw())) {
			usrPw = commonUtils.encryption(userVO.getUsrPw());
		}
		log.debug("After usrPw:"+ usrPw);
		userVO.setUsrPw(usrPw);
		
		return userDao.userPwReset(userVO);	
	}
}
