package com.beauate.m.alarm.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.beauate.m.alarm.service.AlarmDao;
import com.beauate.m.alarm.service.AlarmService;
import com.beauate.m.alarm.service.AlarmVO;
import com.beauate.m.common.service.StringUtil;
import com.beauate.m.offClass.service.ClassVO;
import com.beauate.m.offClass.service.OffClassDao;
import com.beauate.m.user.service.UserDao;
import com.beauate.m.user.service.UserVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("alarmService")
public class AlarmServiceImpl extends EgovAbstractServiceImpl implements AlarmService {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="alarmDao")
	private AlarmDao alarmDao;
	
	@Resource(name="offClassDao")
	private OffClassDao offClassDao;
	
	@Resource(name = "alarmIdGnrService")
	private EgovIdGnrService alarmIdGnrService;
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 조회 후 등록처리
	 * 2. 처리내용 :  알람 조회 후 등록처리
	 * </pre>
	 * @Method Name : selectAlarmDetail
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param alarmVO
	 * @return String
	 * @throws Exception
	 */ 
	public String selectAlarmDetail(AlarmVO alarmVO) throws Exception {
		AlarmVO selectVO = alarmDao.selectAlarmDetail(alarmVO);
		
		String resultYn = "N";
		//알람을 안했다면 등록
		if(selectVO == null) {
			alarmVO.setAlarmId(alarmIdGnrService.getNextStringId());
			alarmDao.insertAlarmProc(alarmVO);
			resultYn = "Y";
		}
		
		return resultYn;
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 알람 신청정보조회
	 * 2. 처리내용 :  알람 신청정보조회
	 * </pre>
	 * @Method Name : selectUserPhon
	 * @date : 2019. 10. 16.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일			작성자					변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 16  뷰아떼1			                    최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param alarmVO
	 * @return String
	 * @throws Exception
	 */ 
	public Map<String, Object> selectUserPhon(ClassVO classVO) throws Exception {
		Map<String, Object> rsltMap = new HashMap<String, Object>();
		UserVO userParamVO = new UserVO();
		userParamVO.setUsrId(classVO.getUsrId());
		UserVO userVO = userDao.selectUser(userParamVO);
		if(!StringUtil.isEmpty(userVO.getMblPno())) {
			String hiponPhone = StringUtil.phone(userVO.getMblPno());
			userVO.setMblPno(hiponPhone);
		}
		
		ClassVO resultVO = offClassDao.selectClassMngDetail(classVO);
		String tempSrc3 = resultVO.getImgSrc3();
		if(!StringUtil.isEmpty(tempSrc3)) {
			String resultSrc3 = StringUtil.getWasfilePath(tempSrc3);
			resultVO.setImgSrc3(resultSrc3);
		}
		rsltMap.put("userVO", userVO);
		rsltMap.put("resultVO", resultVO);
		
		return rsltMap;
	}
}
