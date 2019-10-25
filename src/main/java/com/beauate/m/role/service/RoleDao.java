package com.beauate.m.role.service;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("roleDao")
public interface RoleDao {
	/** 사용자 권한 등록 */
	void insertRoleUserProc(RoleVO roleVO) throws Exception;
}
