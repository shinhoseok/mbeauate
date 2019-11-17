package com.beauate.m.login.service;

import java.util.List;

import com.beauate.m.role.service.RoleVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("loginDao")
public interface LoginDao {
	
	/**
	 * <pre>
	 * 1. 개요 : 뷰아떼 사용자인지 체크
	 * 2. 처리내용 : 뷰아떼 사용자인지 체크 
	 * </pre>
	 * @Method Name : selectLoginUserInfo
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
	public LoginVO selectLoginUserInfo(LoginVO loginVO) throws Exception;
	
	public List<RoleVO> selectUserRoleList(LoginVO loginVO) throws Exception;
	
	public int selectPortalManageRoleCnt(LoginVO loginVO) throws Exception;
}
