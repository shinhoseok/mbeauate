package com.beauate.m.couponhistory.service.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.m.couponhistory.service.CouponHistoryDao;
import com.beauate.m.couponhistory.service.CouponHistoryService;
import com.beauate.m.couponhistory.service.CouponHistoryVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("couponHistoryService")
public class CouponHistoryServiceImpl extends EgovAbstractServiceImpl implements CouponHistoryService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="couponHistoryDao")
	private CouponHistoryDao couponHistoryDao;
	
	@Resource(name = "couponHistoryIdGnrService")
	private EgovIdGnrService couponHistoryIdGnrService;
	
	/**
	 * <pre>
	 * 1. 개요 : 쿠폰발급 > 발급내역이 있으면 안되 > 없으면 발급하고 등록
	 * 2. 처리내용 :  쿠폰내역 조회 후 삭제 혹은 등록처리
	 * </pre>
	 * @Method Name : selectCouponHistoryProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param CouponHistoryVO
	 * @return boolean
	 * @throws Exception
	 */ 
	public boolean insertCouponHistoryProc(CouponHistoryVO couponHistoryVO) throws Exception {
		CouponHistoryVO selectVO = couponHistoryDao.selectCouponHistoryDetail(couponHistoryVO);
		
		boolean resultYn = false;
		//쿠폰발급내역 없으면 쿠폰내역등록
		if(selectVO == null) {
			couponHistoryVO.setCpnHistoryId(couponHistoryIdGnrService.getNextStringId());
			couponHistoryDao.insertCouponHistoryProc(couponHistoryVO);
			resultYn = true;
		} else {//발급내역이 있으면 안됨
			resultYn = false;
		}
		
		return resultYn;
	}
}
