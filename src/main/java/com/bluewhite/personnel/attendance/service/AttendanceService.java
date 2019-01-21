package com.bluewhite.personnel.attendance.service;

import java.util.List;
import java.util.Map;

import com.bluewhite.base.BaseCRUDService;
import com.bluewhite.personnel.attendance.entity.Attendance;
import com.bluewhite.system.user.entity.User;


public interface AttendanceService  extends BaseCRUDService<Attendance,Long>{
	/**
	 * 查询考勤机中的人员信息
	 * @param address
	 * @return
	 */
	public List<Map<String, Object>> getAllUser(String address);
	/**
	 * 同步人员信息到系统
	 * @param address
	 * @return
	 */
	public int syncAttendanceUser(String address);
	
	/**
	 * 修改考勤机中的人员信息
	 * @param address
	 * @return
	 */
	public boolean updateUser(String address,String number,String name, int isPrivilege, boolean enabled);
	
	/**
	 * 删除考勤机中的人员信息
	 * @param address
	 * @param number
	 * @return
	 */
	public boolean deleteUser(String address, String number);
	
	/**
	 * 查看考勤机中全部考勤记录
	 * @param address
	 */
	public List<Map<String, Object>> allAttendance(String address);

}
