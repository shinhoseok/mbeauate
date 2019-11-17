package com.beauate.m.home.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.m.common.service.DateUtil;
import com.beauate.m.common.service.StringUtil;
import com.beauate.m.home.service.HomeService;
import com.beauate.m.offClass.service.ClassVO;
import com.beauate.m.offClass.service.OffClassDao;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("homeService")
public class HomeServiceImpl extends EgovAbstractServiceImpl implements HomeService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="offClassDao")
	private OffClassDao offClassDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 메인 리스트(첫화면 페이징없이 최신순 클래스)
	 * 2. 처리내용 :  메인 리스트(첫화면 페이징없이 최신순 클래스)
	 * </pre>
	 * @Method Name : selectMainList
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param classVO
	 * @return
	 * @throws Exception
	 */ 
	public Map<String, Object> selectMainList(ClassVO classVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		//최신순 8장
		classVO.setImgCnt("8");
		classVO.setSortSubject("newOffClass");
		List<ClassVO> bestList = offClassDao.selectOffClassList(classVO);
		if(bestList != null) {
			bestList = fullImgPathChang(bestList);
		}
		
		//오늘날짜
		String today = DateUtil.getCurrentYearMonthDay();
		
		rsltMap.put("bestList", bestList);
		rsltMap.put("today", today);
		
		return rsltMap;
	}
	
	//이미지 경로를 WAS의 경로로 변환한다.
	private List<ClassVO> fullImgPathChang(List<ClassVO> sqlList) {
		for(int i=0; i<sqlList.size(); i++) {
			String tempSrc = sqlList.get(i).getImgSrc();
			log.debug(">> origin Path >> "+tempSrc);
			if(!StringUtil.isEmpty(tempSrc)) {
				int cnt = tempSrc.indexOf("\\");
				if(cnt == -1) {
					cnt = tempSrc.indexOf("//");
				}
				String resultSrc = tempSrc.substring(cnt+1);
				log.debug(">> result Path >> "+resultSrc);
				sqlList.get(i).setImgSrc(resultSrc);
				log.debug(">> vo Path >> "+sqlList.get(i).getImgSrc());
			}
		}
		return sqlList;
	}
}
