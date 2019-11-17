package com.beauate.m.alarm.web;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.beauate.m.alarm.service.AlarmService;
import com.beauate.m.alarm.service.AlarmVO;
import com.beauate.m.login.service.LoginVO;
import com.beauate.m.offClass.service.ClassVO;
import com.beauate.m.user.service.UserService;

@Controller
public class AlarmController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "alarmService")
	private AlarmService alarmService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	/**
	 * <pre>
	 * 1. 개요 : 알람이 있는지 확인 후 등록
	 * 2. 처리내용 : 알람이 있는지 확인 후 등록
	 * </pre>
	 * @Method Name : selectAlarmProc
	 * @date : 2019. 10. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * 
	 * @param jjimVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/alarm/w/n/selectAlarmProc.do")
	public String selectAlarmProc(AlarmVO alarmVO, SessionStatus status, ModelMap model) throws Exception {
		
		String resultYn = alarmService.selectAlarmDetail(alarmVO);
		status.setComplete();	//중복 submit 방지
		model.addAttribute("resultYn", resultYn);
		
		return "jsonView";
	}
	
	/**
	 * <pre>
	 * 1. 개요 : 알람이 신청시 사용자 핸드폰 조회
	 * 2. 처리내용 : 알람이 신청시 사용자 핸드폰 조회
	 * </pre>
	 * @Method Name : selectUserPhon
	 * @date : 2019. 10. 17.
	 * @author : 뷰아떼1
	 * @history : 
	 *	-----------------------------------------------------------------------
	 *	변경일				작성자						변경내용  
	 *	----------- ------------------- ---------------------------------------
	 *	2019. 10. 17.		뷰아떼1				최초 작성 
	 *	-----------------------------------------------------------------------
	 * @param jjimVO
	 * @param model
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/alarm/r/n/selectUserPhon.do")
	public String selectUserPhon(ClassVO classVO, ModelMap model, LoginVO sessionVO) throws Exception {
		
		classVO.setUsrId(sessionVO.getUsrId());
		Map<String, Object> rsltMap = alarmService.selectUserPhon(classVO);
		model.addAttribute("rslt", rsltMap);
		
		return "/offClass/offClassAlarm";
	}
}
