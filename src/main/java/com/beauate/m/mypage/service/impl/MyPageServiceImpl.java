package com.beauate.m.mypage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.m.comment.service.CommentDao;
import com.beauate.m.comment.service.CommentVO;
import com.beauate.m.common.service.CommonUtils;
import com.beauate.m.common.service.DateUtil;
import com.beauate.m.common.service.StringUtil;
import com.beauate.m.coupon.service.CouponDao;
import com.beauate.m.coupon.service.CouponVO;
import com.beauate.m.couponhistory.service.CouponHistoryDao;
import com.beauate.m.couponhistory.service.CouponHistoryVO;
import com.beauate.m.jjim.service.JjimDao;
import com.beauate.m.jjim.service.JjimVO;
import com.beauate.m.mypage.service.MyPageService;
import com.beauate.m.offClass.service.ClassVO;
import com.beauate.m.offClass.service.OffClassDao;
import com.beauate.m.pay.service.PayDao;
import com.beauate.m.pay.service.PayVO;
import com.beauate.m.refund.service.RefundDao;
import com.beauate.m.refund.service.RefundVO;
import com.beauate.m.review.service.ReviewDao;
import com.beauate.m.review.service.ReviewVO;
import com.beauate.m.user.service.UserDao;
import com.beauate.m.user.service.UserVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("myPageService")
public class MyPageServiceImpl extends EgovAbstractServiceImpl implements MyPageService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="payDao")
	private PayDao payDao;
	
	@Resource(name="refundDao")
	private RefundDao refundDao;
	
	@Resource(name="refundIdGnrService")
	private EgovIdGnrService refundIdGnrService;
	
	@Resource(name="offClassDao")
	private OffClassDao offClassDao;
	
	@Resource(name="jjimDao")
	private JjimDao jjimDao;
	
	@Resource(name="reviewDao")
	private ReviewDao reviewDao;
	
	@Resource(name="reviewIdGnrService")
	private EgovIdGnrService reviewIdGnrService;
	
	@Resource(name="commentDao")
	private CommentDao commentDao;
	
	@Resource(name="couponDao")
	private CouponDao couponDao;
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	@Resource(name="commonUtils")
	private CommonUtils commonUtils;
	
	@Resource(name="couponHistoryDao")
	private CouponHistoryDao couponHistoryDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 메뉴리스트(신청한클래스,사용가능한 쿠폰 갯수)
	 * 2. 처리내용 : 마이페이지 메뉴리스트(신청한클래스,사용가능한 쿠폰 갯수)
	 * </pre>
	 * @Method Name : selectMyPageList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectMyPageList(PayVO payVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		int myPayCnt = payDao.selectMyPayCnt(payVO);
		CouponHistoryVO couponHistoryVO = new CouponHistoryVO();
		couponHistoryVO.setUsrId(payVO.getUsrId());
		int myCouponCnt = couponHistoryDao.selectMyCouponCnt(couponHistoryVO);
		
		rsltMap.put("myPayCnt", myPayCnt);
		rsltMap.put("myCouponCnt", myCouponCnt);
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 신청한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 신청한 클래스 리스트를 불러온다.
	 * </pre>
	 * @Method Name : selectApplyClassList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectApplyClassList(PayVO payVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		int pageUnit = 16; //16개씩 페이징
		int pageIndex = payVO.getPageIndex();
		//총카운트
		int cnt = payDao.selectPayListCnt(payVO);
		payVO.setFirstIndex(1);
		if(pageIndex == 1) {
			if(cnt > pageUnit) {
				payVO.setLastIndex(pageUnit);
			} else {
				payVO.setLastIndex(cnt);
			}
		} else {
			int lastIndex = pageUnit*pageIndex;
			if(cnt > lastIndex) {
				payVO.setLastIndex(lastIndex);
			} else {
				payVO.setLastIndex(cnt);
			}
		}
		
		List<PayVO> selectList = null;
		
		if(cnt > 0){
			//리스트
			selectList = payDao.selectPayList(payVO);
			//이미지 경로수정 yyyyMM/파일명
			selectList = fullImgPathChang(selectList);
			if(!StringUtil.isEmpty(selectList.get(0).getImgSrc3())) {
				selectList = fullImgPathChang33(selectList);
			}
		}
		//오늘날짜
		String today = DateUtil.getCurrentYearMonthDay();
		
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		rsltMap.put("today", today);
		
		return rsltMap;
	}
	
	//이미지 경로를 WAS의 경로로 변환한다.
	private List<PayVO> fullImgPathChang(List<PayVO> sqlList) {
		for(int i=0; i<sqlList.size(); i++) {
			String tempSrc = sqlList.get(i).getImgSrc2();
			log.debug(">> origin Path >> "+tempSrc);
			if(!StringUtil.isEmpty(tempSrc)) {
				int cnt = tempSrc.indexOf("\\");
				if(cnt == -1) {
					cnt = tempSrc.indexOf("//");
				}
				String resultSrc = tempSrc.substring(cnt+1);
				log.debug(">> result Path >> "+resultSrc);
				sqlList.get(i).setImgSrc2(resultSrc);
				log.debug(">> vo Path >> "+sqlList.get(i).getImgSrc2());
			}
		}
		return sqlList;
	}
	
	//이미지 경로를 WAS의 경로로 변환한다.
	private List<PayVO> fullImgPathChang33(List<PayVO> sqlList) {
		for(int i=0; i<sqlList.size(); i++) {
			String tempSrc = sqlList.get(i).getImgSrc3();
			log.debug(">> origin Path >> "+tempSrc);
			if(!StringUtil.isEmpty(tempSrc)) {
				int cnt = tempSrc.indexOf("\\");
				if(cnt == -1) {
					cnt = tempSrc.indexOf("//");
				}
				String resultSrc = tempSrc.substring(cnt+1);
				log.debug(">> result Path >> "+resultSrc);
				sqlList.get(i).setImgSrc3(resultSrc);
				log.debug(">> vo Path >> "+sqlList.get(i).getImgSrc3());
			}
		}
		return sqlList;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 찜 리스트
	 * 2. 처리내용 : 마이페이지 찜 리스트
	 * </pre>
	 * @Method Name : selectJjimList
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectJjimList(JjimVO jjimVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		int pageUnit = 16; //16개씩 페이징
		int pageIndex = jjimVO.getPageIndex();
		int cnt = jjimDao.selectJjimListCnt(jjimVO); //총카운트
		jjimVO.setFirstIndex(1);
		if(pageIndex == 1) {
			if(cnt > pageUnit) {
				jjimVO.setLastIndex(pageUnit);
			} else {
				jjimVO.setLastIndex(cnt);
			}
		} else {
			int lastIndex = pageUnit*pageIndex;
			if(cnt > lastIndex) {
				jjimVO.setLastIndex(lastIndex);
			} else {
				jjimVO.setLastIndex(cnt);
			}
		}
		
		List<JjimVO> selectList = null;
		
		if(cnt > 0){
			//리스트
			selectList = jjimDao.selectJjimList(jjimVO);
			//이미지 경로수정 yyyyMM/파일명
			selectList = fullImgPathChang2(selectList);
		}
		//오늘날짜
		String today = DateUtil.getCurrentYearMonthDay();
		
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		rsltMap.put("today", today);
		
		return rsltMap;
	}
	
	//이미지 경로를 WAS의 경로로 변환한다.
	private List<JjimVO> fullImgPathChang2(List<JjimVO> sqlList) {
		for(int i=0; i<sqlList.size(); i++) {
			String tempSrc = sqlList.get(i).getImgSrc1();
			log.debug(">> origin Path >> "+tempSrc);
			if(!StringUtil.isEmpty(tempSrc)) {
				int cnt = tempSrc.indexOf("\\");
				if(cnt == -1) {
					cnt = tempSrc.indexOf("//");
				}
				String resultSrc = tempSrc.substring(cnt+1);
				log.debug(">> result Path >> "+resultSrc);
				sqlList.get(i).setImgSrc1(resultSrc);
				log.debug(">> vo Path >> "+sqlList.get(i).getImgSrc1());
			}
		}
		return sqlList;
	}
	
	
	/**
	 * <pre>
	 * 1. 개요 : 결제내역삭제
	 * 2. 처리내용 :  결제내역삭제
	 * </pre>
	 * @Method Name : deletePayProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	public void deletePayProc(PayVO payVO) throws Exception {
		String [] payIdList = payVO.getPayId().split(",");
		if(payIdList.length == 1) {
			payVO.setDelYn("Y");
			payDao.deletePayProc(payVO);
		} else {
			for(String payId : payIdList) {
				payVO.setPayId(payId);
				payVO.setDelYn("Y");
				payDao.deletePayProc(payVO);
			}
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 환불처리
	 * 2. 처리내용 :  환불처리
	 * </pre>
	 * @Method Name : updatePayRefundProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @return void
	 * @throws Exception
	 */ 
	public void updatePayRefundProc(PayVO payVO) throws Exception {
		//결재내역 취소2로 저장
		payVO.setPaySt("2");
		payDao.updatePayRefundProc(payVO);
		
		//취소,환불내역 저장
		RefundVO refundVO = new RefundVO();
		refundVO.setRefundId(refundIdGnrService.getNextStringId());
		refundVO.setPayId(payVO.getPayId());
		refundDao.insertRefundProc(refundVO);
		
		//현재 클래스에 등록한 인원체크
		ClassVO tempVO = new ClassVO();
		tempVO.setClassId(payVO.getClassId());
		ClassVO queryVO = offClassDao.selectClassMngDetail(tempVO);
		int currentNo = Integer.parseInt(queryVO.getClassApplyNo());
		int applyNo = currentNo - 1;
		tempVO.setClassApplyNo(String.valueOf(applyNo));
		offClassDao.updateClassMngProc(tempVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 찜 삭제
	 * 2. 처리내용 :  찜 삭제
	 * </pre>
	 * @Method Name : deleteJjimProc
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @return void
	 * @throws Exception
	 */ 
	public void deleteJjimProc(JjimVO jjimVO) throws Exception {
		String [] jjimIdList = jjimVO.getJjimId().split(",");
		if(jjimIdList.length == 1) {
			jjimDao.deleteJjimProc(jjimVO);
		} else {
			for(String jjimId : jjimIdList) {
				jjimVO.setJjimId(jjimId);
				jjimDao.deleteJjimProc(jjimVO);
			}
		}
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 리뷰작성 등록처리
	 * 2. 처리내용 :  리뷰작성 등록처리
	 * </pre>
	 * @Method Name : insertReviewProc
	 * @date : 2019. 5. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return
	 * @throws Exception
	 */ 
	public void insertReviewProc(ReviewVO reviewVO) throws Exception {
		reviewVO.setReviewId(reviewIdGnrService.getNextStringId());
		reviewDao.insertReviewProc(reviewVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자가 하나의 클래스에 작성한 리뷰카운트
	 * 2. 처리내용 :  사용자가 하나의 클래스에 작성한 리뷰카운트
	 * </pre>
	 * @Method Name : selectUserReviewCnt
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return int
	 * @throws Exception
	 */ 
	public int selectUserReviewCnt(ReviewVO reviewVO) throws Exception {
		return reviewDao.selectUserReviewCnt(reviewVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내가 작성한 후기리스트
	 * 2. 처리내용 :  마이페이지 내가 작성한 후기리스트
	 * </pre>
	 * @Method Name : selectUserReviewCnt
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectMyReviewList(ReviewVO reviewVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<>();
		int pageUnit = 16; //16개씩 페이징
		int pageIndex = reviewVO.getPageIndex();
		int cnt = reviewDao.selectMyReviewListCnt(reviewVO); //총카운트
		reviewVO.setFirstIndex(1);
		if(pageIndex == 1) {
			if(cnt > pageUnit) {
				reviewVO.setLastIndex(pageUnit);
			} else {
				reviewVO.setLastIndex(cnt);
			}
		} else {
			int lastIndex = pageUnit*pageIndex;
			if(cnt > lastIndex) {
				reviewVO.setLastIndex(lastIndex);
			} else {
				reviewVO.setLastIndex(cnt);
			}
		}
		
		List<ReviewVO> selectList = null;
		
		if(cnt > 0){
			//리스트
			selectList = reviewDao.selectMyReviewList(reviewVO);
			//이미지 경로수정 yyyyMM/파일명
			selectList = fullImgPathChang3(selectList);
		}
		
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		
		return rsltMap;
	}
	
	//이미지 경로를 WAS의 경로로 변환 및 댓글리스트 포함시키기
	private List<ReviewVO> fullImgPathChang3(List<ReviewVO> sqlList) throws Exception {
		CommentVO commentVO = new CommentVO();
		for(int i=0; i<sqlList.size(); i++) {
			String tempSrc = sqlList.get(i).getImgSrc3();
			String reviewId = sqlList.get(i).getReviewId();
			//경로 변환
			if(!StringUtil.isEmpty(tempSrc)) {
				int cnt = tempSrc.indexOf("\\");
				if(cnt == -1) {
					cnt = tempSrc.indexOf("//");
				}
				String resultSrc = tempSrc.substring(cnt+1);
				sqlList.get(i).setImgSrc3(resultSrc);
			}
			//댓글리스트포함
			commentVO.setReviewId(reviewId);
			List<CommentVO> resultVO = commentDao.selectCommentDetail(commentVO);
			sqlList.get(i).setCommentList(resultVO);
		}
		return sqlList;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 후기 수정 및 삭제
	 * 2. 처리내용 :  마이페이지 후기 수정 및 삭제
	 * </pre>
	 * @Method Name : selectUserReviewCnt
	 * @date : 2019. 10. 16.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public void updateReviewProc(ReviewVO reviewVO) throws Exception {
		reviewDao.updateReviewProc(reviewVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 사용 가능한 쿠폰 리스트
	 * 2. 처리내용 : 사용 가능한 쿠폰 리스트
	 * </pre>
	 * @Method Name : selectCouponList
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param couponVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectCouponList(CouponVO couponVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(couponVO.getPageIndex());
		couponVO.setPageUnit(6); //한페이지당 게시물수 6
		paginationInfo.setRecordCountPerPage(couponVO.getPageUnit());
		paginationInfo.setPageSize(couponVO.getPageSize());
		
		couponVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		couponVO.setLastIndex(paginationInfo.getLastRecordIndex());
		couponVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<CouponVO> selectList = null;
		//총 카운트 
		int cnt = couponDao.selectCouponMngListCnt(couponVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = couponDao.selectCouponMngList(couponVO);
		}
		
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 결재내역 리스트
	 * 2. 처리내용 : 마이페이지 결재내역 리스트
	 * </pre>
	 * @Method Name : selectPayHisotryAjaxList
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param couponVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectPayHisotryAjaxList(PayVO payVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		
		//페이징 
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(payVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(payVO.getPageUnit());
		paginationInfo.setPageSize(payVO.getPageSize());
		
		payVO.setFirstIndex(paginationInfo.getFirstRecordIndex()+1); 
		payVO.setLastIndex(paginationInfo.getLastRecordIndex());
		payVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<PayVO> selectList = null;
		//총 카운트 
		int cnt = payDao.selectPayListCnt(payVO);
		paginationInfo.setTotalRecordCount(cnt);
		
		if(cnt > 0){
			//리스트
			selectList = payDao.selectPayList(payVO);
			if(!StringUtil.isEmpty(selectList.get(0).getImgSrc3())) {
				selectList = fullImgPathChang33(selectList);
			}
		}
		
		rsltMap.put("paginationInfo", paginationInfo);
		rsltMap.put("selectList", selectList);
		rsltMap.put("selectListCnt", cnt);
		
		return rsltMap;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보 수정
	 * 2. 처리내용 : 마이페이지 내 정보 수정
	 * </pre>
	 * @Method Name : updateMyInfo
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @return UserVO
	 * @throws Exception
	 */ 
	public UserVO updateMyInfo(UserVO userVO) throws Exception {
		UserVO resultVO = userDao.selectUser(userVO);
		//전화번호 하이픈추가
		String temp = resultVO.getMblPno();
		if(!StringUtil.isEmpty(temp)) {
			String mblPno = StringUtil.phone(temp);
			resultVO.setMblPno(mblPno);
		}
		return resultVO;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보 수정 > 비밀번호 정합성
	 * 2. 처리내용 : 마이페이지 내 정보 수정 > 비밀번호 정합성
	 * </pre>
	 * @Method Name : updateMyInfo
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @return UserVO
	 * @throws Exception
	 */ 
	public boolean selectPasswordChk(UserVO userVO) throws Exception {
		String tmpPwd = commonUtils.encryption(userVO.getUsrPw());
		UserVO resultVO = userDao.selectUser(userVO);

		boolean result = false;
		if(tmpPwd.equals(resultVO.getUsrPw())) {
			result = true;
		}
		return result;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보수정 > 비밀번호 변경 처리
	 * 2. 처리내용 : 마이페이지 내 정보수정 > 비밀번호 변경 처리
	 * </pre>
	 * @Method Name : updatePasswordProc
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @return void
	 * @throws Exception
	 */
	public void updatePasswordProc(UserVO userVO) throws Exception {
		String newUserPw = commonUtils.encryption(userVO.getNewUsrPw());
		log.debug("After usrPw:"+ newUserPw);
		userVO.setUsrPw(newUserPw);
		userDao.userPwReset(userVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보수정 > 휴대폰 변경 처리
	 * 2. 처리내용 : 마이페이지 내 정보수정 > 휴대폰 변경 처리
	 * </pre>
	 * @Method Name : updateMblPnoProc
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @return void
	 * @throws Exception
	 */
	public void updateMblPnoProc(UserVO userVO) throws Exception {
		userDao.updateUser(userVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보수정 > 회원탈퇴
	 * 2. 처리내용 : 마이페이지 내 정보수정 > 회원탈퇴
	 * </pre>
	 * @Method Name : deleteMemberProc
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @return void
	 * @throws Exception
	 */
	public void deleteMemberProc(UserVO userVO) throws Exception {
		userDao.updateUserProc(userVO);
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 리뷰작성
	 * 2. 처리내용 : 마이페이지 리뷰작성
	 * </pre>
	 * @Method Name : insertUserReview
	 * @date : 2019. 5. 17.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		신호석				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @return String
	 * @throws Exception
	 */
	public ClassVO insertUserReview(ClassVO classVO) throws Exception {
		classVO.setAdminYn("N");
		ClassVO resultVO = offClassDao.selectClassMngDetail(classVO);
		String tempSrc3 = resultVO.getImgSrc3();
		if(!StringUtil.isEmpty(tempSrc3)) {
			String resultSrc3 = StringUtil.getWasfilePath(tempSrc3);
			resultVO.setImgSrc3(resultSrc3);
		}
		return resultVO;
	}
}
