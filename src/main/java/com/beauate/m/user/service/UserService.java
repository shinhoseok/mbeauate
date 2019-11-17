package com.beauate.m.user.service;

public interface UserService {
	/**
	 * <pre>
	 * 1. 개요 : 사용자아이디 중복체크
	 * 2. 처리내용 : 사용자아이디 중복체크
	 * </pre>
	 * @Method Name : userIdChk
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public Integer selectUserIdChk(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 등록
	 * 2. 처리내용 : 사용자 등록
	 * </pre>
	 * @Method Name : insertUserProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void insertUserProc(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 통계 등록
	 * 2. 처리내용 : 사용자 통계 등록
	 * </pre>
	 * @Method Name : insertUserStatisticsProc
	 * @date : 2019. 6. 22.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 22.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param UserStatsVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public void insertUserStatisticsProc(UserStatsVO userStatsVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 상세정보
	 * 2. 처리내용 : 사용자 상세정보를 불러온다.
	 * </pre>
	 * @Method Name : selectUser
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @param 
	 * @return
	 * @throws Exception
	 */ 
	public UserVO selectUser(UserVO userVO) throws Exception;
}
