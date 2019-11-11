package com.beauate.m.home.service;

import java.util.List;

import com.beauate.m.offClass.service.ClassVO;

public interface HomeService {
	/**
	 * <pre>
	 * 1. 개요 : 메인 리스트(첫화면 페이징없이 최신순 클래스)
	 * 2. 처리내용 :  메인 리스트(첫화면 페이징없이 최신순 클래스)
	 * </pre>
	 * @Method Name : selectMainList
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @return
	 * @throws Exception
	 */ 
	public List<ClassVO> selectMainList(ClassVO classVO) throws Exception;
}
