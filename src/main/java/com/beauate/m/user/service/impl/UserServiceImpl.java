package com.beauate.m.user.service.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.m.common.service.CommonUtils;
import com.beauate.m.common.service.GlobalConstants;
import com.beauate.m.role.service.RoleDao;
import com.beauate.m.role.service.RoleVO;
import com.beauate.m.user.service.UserDao;
import com.beauate.m.user.service.UserService;
import com.beauate.m.user.service.UserStatsVO;
import com.beauate.m.user.service.UserVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="commonUtils")
	private CommonUtils commonUtils;
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	@Resource(name = "userIdGnrService")
	private EgovIdGnrService userIdGnrService;
	
	@Resource(name = "roleUserMappingIdGnrService")
	private EgovIdGnrService roleUserMappingIdGnrService;
	
	@Resource(name="roleDao")
	private RoleDao roleDao;
	
	@Resource(name = "userStatsIdGnrService")
	private EgovIdGnrService userStatsIdGnrService;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자아이디 중복체크
	 * 2. 처리내용 : 사용자아이디 중복체크
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
	 * 
	 * @param userVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public Integer selectUserIdChk(UserVO userVO) throws Exception {
		return userDao.selectUserIdChk(userVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 등록
	 * 2. 처리내용 : 사용자 등록
	 * </pre>
	 * @Method Name : insertUserProc
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
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void insertUserProc(UserVO userVO) throws Exception {
		
		//사용자 등록
		log.debug("Before usrPw:"+ userVO.getUsrPw());
		String passwd = commonUtils.encryption(userVO.getUsrPw());
		
		log.debug("After usrPw:"+ passwd);
		userVO.setUsrPw(passwd);
		userVO.setUsrId(userIdGnrService.getNextStringId());
		
		//정상회원 상태코드 등록
		userVO.setUserSt(GlobalConstants.NORMAL_MEMBER_CODE);
		userDao.insertUserProc(userVO);
		
		//사용자 권한 등록
		if(userVO.getUsrId() != null || userVO.getUsrId() != "") {
			RoleVO roleVO = new RoleVO();
			roleVO.setMppgId(roleUserMappingIdGnrService.getNextStringId());
			roleVO.setRlId(GlobalConstants.USER_AUTHORITY_DEFAULT);
			roleVO.setUsrId(userVO.getUsrId());
//			roleVO.setRgId(sessionVO.getUsrId());
			roleDao.insertRoleUserProc(roleVO);
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 통계 등록
	 * 2. 처리내용 : 사용자 통계 등록
	 * </pre>
	 * @Method Name : insertUserStatisticsProc
	 * @date : 2019. 6. 22.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 22.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userStatsVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void insertUserStatisticsProc(UserStatsVO userStatsVO) throws Exception {
		userStatsVO.setAccessLogId(userStatsIdGnrService.getNextStringId());
		userDao.insertUserStatisticsProc(userStatsVO);
	}
}
