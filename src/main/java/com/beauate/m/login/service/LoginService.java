package com.beauate.m.login.service;

import java.util.List;

import com.beauate.m.role.service.RoleVO;
import com.beauate.m.user.service.UserVO;

public interface LoginService {
	
	/**
	 * <pre>
	 * 1. 개요 : 뷰아떼 사용자인지 체크
	 * 2. 처리내용 : 뷰아떼 사용자인지 체크 
	 * </pre>
	 * @Method Name : selectLoginUserInfo
	 * @date : 2019. 6. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @return String
	 * @throws Exception
	 */ 
	public LoginVO selectLoginUserInfo(LoginVO loginVO) throws Exception;
	
	public List<RoleVO> selectUserRoleList(LoginVO loginVO) throws Exception;
	
	public int selectPortalManageRoleCnt(LoginVO loginVO) throws Exception;
	
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
	 * @return String
	 * @throws Exception
	 */ 
	public String selectPwdSearch(String emailAddr) throws Exception;
	
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
	public Integer userPwReset(UserVO userVO) throws Exception;
}
