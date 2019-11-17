package com.beauate.m.coupon.service;

public interface CouponService {
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰 상세
	 * 2. 처리내용 : 쿠폰 상세
	 * </pre>
	 * @Method Name : selectCpnMngDetail
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param couponVO
	 * @return CouponVO
	 * @throws Exception
	 */ 
	public CouponVO selectCpnMngDetail(CouponVO couponVO) throws Exception;
}
