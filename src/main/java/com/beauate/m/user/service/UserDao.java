package com.beauate.m.user.service;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userDao")
public interface UserDao {
	/**
	 * <pre>
	 * 1. 개요 : 사용자아이디 중복체크
	 * 2. 처리내용 :  사용자아이디 중복체크
	 * </pre>
	 * @Method Name : userIdChk
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	Integer selectUserIdChk(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 등록
	 * 2. 처리내용 :  사용자 등록
	 * </pre>
	 * @Method Name : userInsertProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	void insertUserProc(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 통계 등록
	 * 2. 처리내용 :  사용자 통계 등록
	 * </pre>
	 * @Method Name : insertUserStatisticsProc
	 * @date : 2019. 6. 22.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 6. 22  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userStatsVO
	 * @return void
	 * @throws Exception
	 */ 
	void insertUserStatisticsProc(UserStatsVO userStatsVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 비밀번호 초기화
	 * 2. 처리내용 :  사용자 비밀번호 초기화
	 * </pre>
	 * @Method Name : userPwReset
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	Integer userPwReset(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 통계 차트 리스트
	 * 2. 처리내용 :  사용자 통계 차트 리스트
	 * </pre>
	 * @Method Name : selectUserDetail
	 * @date : 2019. 9. 22.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 9. 22  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param String
	 * @return UserVO
	 * @throws Exception
	 */ 
	public UserVO selectUserDetail(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 상세정보
	 * 2. 처리내용 :  사용자 상세정보 조회
	 * </pre>
	 * @Method Name : selectUser
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	UserVO selectUser(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 수정 
	 * 2. 처리내용 :  사용자 수정 
	 * </pre>
	 * @Method Name : updateUser
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	void updateUser(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자 삭제
	 * 2. 처리내용 :  사용자 삭제
	 * </pre>
	 * @Method Name : userDeleteProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param userVO
	 * @return
	 * @throws Exception
	 */ 
	void updateUserProc(UserVO userVO) throws Exception;
}
