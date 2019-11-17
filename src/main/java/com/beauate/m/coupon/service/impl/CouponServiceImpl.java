package com.beauate.m.coupon.service.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.m.code.service.CodeDao;
import com.beauate.m.coupon.service.CouponDao;
import com.beauate.m.coupon.service.CouponService;
import com.beauate.m.coupon.service.CouponVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("couponService")
public class CouponServiceImpl extends EgovAbstractServiceImpl implements CouponService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="couponDao")
	private CouponDao couponDao;
	
	@Resource(name="codeDao")
	private CodeDao codeDao;
	
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
	public CouponVO selectCpnMngDetail(CouponVO couponVO) throws Exception {
		return couponDao.selectCpnMngDetail(couponVO);
	}
}
