package com.beauate.m.refund.service;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("refundDao")
public interface RefundDao {
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 결재취소처리
	 * 2. 처리내용 : 마이페이지 결재취소처리
	 * </pre>
	 * @Method Name : insertRefundProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	Integer insertRefundProc(RefundVO refundVO) throws Exception;

}
