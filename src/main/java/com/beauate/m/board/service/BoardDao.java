package com.beauate.m.board.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardDao")
public interface BoardDao {
	/**
	 * <pre>
	 * 1. 개요 : 게시판 관리 리스트 카운트
	 * 2. 처리내용 : 게시판 관리 리스트 카운트
	 * </pre>
	 * @Method Name : selectBoardMngListCnt
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return Integer
	 * @throws Exception
	 */ 	
	Integer selectBoardMngListCnt(BoardVO boardVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 관리 리스트
	 * 2. 처리내용 : 게시판 관리 리스트
	 * </pre>
	 * @Method Name : selectBoardMngList
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return List<BoardVO>
	 * @throws Exception
	 */ 	
	List<BoardVO> selectBoardMngList(BoardVO boardVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 관리 상세 조회
	 * 2. 처리내용 : 게시판 관리 상세 조회
	 * </pre>
	 * @Method Name : selectBoardMngDetail
	 * @date : 2019. 5. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 5. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return BoardVO
	 * @throws Exception
	 */ 	
	BoardVO selectBoardMngDetail(BoardVO boardVO) throws Exception;
	
	/**
	 * <pre>
	 * 1. 개요 : 게시판 관리 상세 다음글, 이전글
	 * 2. 처리내용 : 게시판 관리 상세 다음글, 이전글
	 * </pre>
	 * @Method Name : selectBoardNextPrev
	 * @date : 2019. 10. 12.
	 * @author : 신호석
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일					작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 12  		신호석			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param boardVO
	 * @return BoardVO
	 * @throws Exception
	 */
	BoardVO selectBoardNextPrev(BoardVO boardVO) throws Exception;
}
