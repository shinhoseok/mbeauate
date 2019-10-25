package com.beauate.m.role.service;

import java.io.Serializable;

import com.beauate.m.common.service.CommDefaultVO;

@SuppressWarnings("serial")
public class RoleVO extends CommDefaultVO implements Serializable {
	/** 권한 코드 */
	private String rlCd;
	
	/** 권한 이름 */
	private String rlName;
	
	/** 권한 설명 */
	private String rlDes;
	
	/** 권한 분류 */
	private String rlCls;

	public String getRlCd() {
		return rlCd;
	}

	public void setRlCd(String rlCd) {
		this.rlCd = rlCd;
	}

	public String getRlName() {
		return rlName;
	}

	public void setRlName(String rlName) {
		this.rlName = rlName;
	}

	public String getRlDes() {
		return rlDes;
	}

	public void setRlDes(String rlDes) {
		this.rlDes = rlDes;
	}

	public String getRlCls() {
		return rlCls;
	}

	public void setRlCls(String rlCls) {
		this.rlCls = rlCls;
	}
}
