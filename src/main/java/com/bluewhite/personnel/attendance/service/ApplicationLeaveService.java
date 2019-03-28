package com.bluewhite.personnel.attendance.service;

import java.util.List;

import com.bluewhite.base.BaseCRUDService;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.common.entity.PageResult;
import com.bluewhite.finance.attendance.entity.AttendancePay;
import com.bluewhite.personnel.attendance.entity.ApplicationLeave;
import com.bluewhite.personnel.attendance.entity.AttendanceTime;

public interface ApplicationLeaveService  extends BaseCRUDService<ApplicationLeave,Long>{
	/**
	 * 修改请假事项
	 * @param applicationLeave
	 */
	ApplicationLeave updateApplicationLeave(ApplicationLeave applicationLeave);
	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int deleteApplicationLeave(String ids);
	
	/**
	 * 按条件查看考级统计后的记录
	 * @param attendanceTime
	 * @return
	 */
	public PageResult<ApplicationLeave> findApplicationLeavePage(ApplicationLeave applicationLeave, PageParameter page);
	
	/**
	 * 新增请假事项
	 * @param applicationLeave
	 */
	ApplicationLeave saveApplicationLeave(ApplicationLeave applicationLeave);

}
