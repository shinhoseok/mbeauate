package com.beauate.m.board.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beauate.m.board.service.BoardService;
import com.beauate.m.board.service.BoardVO;
import com.beauate.m.couponhistory.service.CouponHistoryService;
import com.beauate.m.couponhistory.service.CouponHistoryVO;

@Controller
public class BoardController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name = "couponHistoryService")
	private CouponHistoryService couponHistoryService;
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 리스트
	 * 2. 처리내용 : 게시판 리스트
	 * </pre>
	 * @Method Name : selectBoardList
	 * @date : 2019. 5. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param boardVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/board/a/n/selectBoardList.do")
	public String selectBoardList() throws Exception {
		return "/board/boardList";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 리스트
	 * 2. 처리내용 : 게시판 리스트
	 * </pre>
	 * @Method Name : selectBoardList
	 * @date : 2019. 5. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param boardVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/board/a/n/selectBoardListAjax.do")
	public String selectBoardListAjax(BoardVO boardVO, ModelMap model) throws Exception {
		Map<String, Object> rsltMap = boardService.selectBoardList(boardVO);
		model.addAttribute("rslt", rsltMap);
		return "/board/boardListAjax";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 상세보기
	 * 2. 처리내용 : 게시판 상세보기
	 * </pre>
	 * @Method Name : selectBoardDetail
	 * @date : 2019. 5. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/board/a/n/selectBoardDetail.do")
	public String selectBoardDetail(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		BoardVO resultVO = boardService.selectBoardDetail(boardVO);
		model.addAttribute("boardVO", resultVO);
		
		return "/board/boardDetail";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 상세보기 다음글/이전글
	 * 2. 처리내용 : 게시판 상세보기 다음글/이전글
	 * </pre>
	 * @Method Name : selectBoardNextPrev
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/board/a/t/selectBoardNextPrev.do")
	public String selectBoardNextPrev(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		BoardVO resultVO = boardService.selectBoardNextPrev(boardVO);
		model.addAttribute("boardVO", resultVO);
		
		return "/board/boardDetail";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 할인쿠폰 이벤트 공지사항 이벤트
	 * 2. 처리내용 : 할인쿠폰 이벤트 공지사항 이벤트
	 * </pre>
	 * @Method Name : insertCouponHistoryProc
	 * @date : 2019. 10. 12.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자				변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */ 	
	@RequestMapping(value = "/board/w/t/insertCouponHistoryProc.do")
	public String insertCouponHistoryProc(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		CouponHistoryVO couponHistoryVO = new CouponHistoryVO();
		couponHistoryVO.setCouponId(boardVO.getCouponId());
		couponHistoryVO.setUsrId(boardVO.getUsrId());
		boolean result = couponHistoryService.insertCouponHistoryProc(couponHistoryVO);
		model.addAttribute("result", result);
		
		return "jsonView";
	}
}
