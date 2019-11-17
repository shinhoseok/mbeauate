package com.beauate.m.mypage.service;

import java.util.Map;

import com.beauate.m.couponhistory.service.CouponHistoryVO;
import com.beauate.m.jjim.service.JjimVO;
import com.beauate.m.offClass.service.ClassVO;
import com.beauate.m.pay.service.PayVO;
import com.beauate.m.review.service.ReviewVO;
import com.beauate.m.user.service.UserVO;

public interface MyPageService {
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 메뉴리스트(신청한클래스,사용가능한 쿠폰 갯수)
	 * 2. 처리내용 : 마이페이지 메뉴리스트(신청한클래스,사용가능한 쿠폰 갯수)
	 * </pre>
	 * @Method Name : selectMyPageList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectMyPageList(PayVO payVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 신청한 클래스 리스트
	 * 2. 처리내용 : 마이페이지 신청한 클래스 리스트를 불러온다.
	 * </pre>
	 * @Method Name : selectApplyClassList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectApplyClassList(PayVO payVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 찜 리스트
	 * 2. 처리내용 : 마이페이지 찜 리스트
	 * </pre>
	 * @Method Name : selectJjimList
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param payVO
	 * @param model
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectJjimList(JjimVO jjimVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 결제내역삭제
	 * 2. 처리내용 :  결제내역삭제
	 * </pre>
	 * @Method Name : deletePayProc
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
	public void deletePayProc(PayVO payVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 환불처리
	 * 2. 처리내용 :  환불처리
	 * </pre>
	 * @Method Name : updatePayRefundProc
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
	public void updatePayRefundProc(PayVO payVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 찜 삭제
	 * 2. 처리내용 :  찜 삭제
	 * </pre>
	 * @Method Name : deleteJjimProc
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @return void
	 * @throws Exception
	 */ 
	public void deleteJjimProc(JjimVO jjimVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 리뷰작성 등록처리
	 * 2. 처리내용 :  리뷰작성 등록처리
	 * </pre>
	 * @Method Name : insertReviewProc
	 * @date : 2019. 5. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return
	 * @throws Exception
	 */ 
	public void insertReviewProc(ReviewVO reviewVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용자가 하나의 클래스에 작성한 리뷰카운트
	 * 2. 처리내용 :  사용자가 하나의 클래스에 작성한 리뷰카운트
	 * </pre>
	 * @Method Name : selectUserReviewCnt
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return int
	 * @throws Exception
	 */ 
	public int selectUserReviewCnt(ReviewVO reviewVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내가 작성한 후기리스트
	 * 2. 처리내용 :  마이페이지 내가 작성한 후기리스트
	 * </pre>
	 * @Method Name : selectUserReviewCnt
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param reviewVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectMyReviewList(ReviewVO reviewVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 후기 수정 및 삭제
	 * 2. 처리내용 :  마이페이지 후기 수정 및 삭제
	 * </pre>
	 * @Method Name : selectUserReviewCnt
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public void updateReviewProc(ReviewVO reviewVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용가능한 쿠폰카운트
	 * 2. 처리내용 : 사용가능한 쿠폰카운트
	 * </pre>
	 * @Method Name : selectCouponListCnt
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param couponVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Integer selectCouponListCnt(CouponHistoryVO couponHistoryVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 사용 가능한 쿠폰 리스트
	 * 2. 처리내용 : 사용 가능한 쿠폰 리스트
	 * </pre>
	 * @Method Name : selectCouponList
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param couponVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectCouponList(CouponHistoryVO couponHistoryVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 결재내역 리스트
	 * 2. 처리내용 : 마이페이지 결재내역 리스트
	 * </pre>
	 * @Method Name : selectPayHisotryAjaxList
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param couponVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public Map<String, Object> selectPayHisotryAjaxList(PayVO payVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보 수정
	 * 2. 처리내용 : 마이페이지 내 정보 수정
	 * </pre>
	 * @Method Name : selectPayHisotryAjaxList
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param couponVO
	 * @return Map<String, Object>
	 * @throws Exception
	 */ 
	public UserVO updateMyInfo(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보 수정 > 비밀번호 정합성
	 * 2. 처리내용 : 마이페이지 내 정보 수정 > 비밀번호 정합성
	 * </pre>
	 * @Method Name : updateMyInfo
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @return UserVO
	 * @throws Exception
	 */ 
	public boolean selectPasswordChk(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보수정 > 비밀번호 변경 처리
	 * 2. 처리내용 : 마이페이지 내 정보수정 > 비밀번호 변경 처리
	 * </pre>
	 * @Method Name : updatePasswordProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @return void
	 * @throws Exception
	 */
	public void updatePasswordProc(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보수정 > 휴대폰 변경 처리
	 * 2. 처리내용 : 마이페이지 내 정보수정 > 휴대폰 변경 처리
	 * </pre>
	 * @Method Name : updateMblPnoProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @return void
	 * @throws Exception
	 */
	public void updateMblPnoProc(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 내 정보수정 > 회원탈퇴
	 * 2. 처리내용 : 마이페이지 내 정보수정 > 회원탈퇴
	 * </pre>
	 * @Method Name : deleteMemberProc
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param userVO
	 * @return void
	 * @throws Exception
	 */
	public void deleteMemberProc(UserVO userVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 리뷰작성
	 * 2. 처리내용 : 마이페이지 리뷰작성
	 * </pre>
	 * @Method Name : insertUserReview
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @return String
	 * @throws Exception
	 */
	public ClassVO insertUserReview(ClassVO classVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 마이페이지 후기수정 페이지
	 * 2. 처리내용 : 마이페이지 후기수정 페이지
	 * </pre>
	 * @Method Name : updateUserReview
	 * @date : 2019. 5. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param reviewVO
	 * @return ReviewVO
	 * @throws Exception
	 */
	public ReviewVO updateUserReview(ReviewVO reviewVO) throws Exception;
}
