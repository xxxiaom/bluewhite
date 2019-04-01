package com.bluewhite.personnel.attendance.entity;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bluewhite.base.BaseEntity;
import com.bluewhite.common.utils.DatesUtil;
import com.bluewhite.common.utils.NumUtils;
import com.bluewhite.system.user.entity.User;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 考勤汇总列总表，按月按员工汇总（员工每月一条汇总数据）
 * @author zhangliang
 *
 */
@Entity
@Table(name = "person_attendance_collect" )
public class AttendanceCollect extends BaseEntity<Long>{
	
	/**
	 * 考勤汇总日期
	 * 
	 */
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	@Column(name = "time")
	private Date time;
	
	/**
	 * 员工id
	 */
	@Column(name = "user_id")
	private Long userId;
	
	/**
	 * 员工
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
	private User user;
	
	/**
	 * 出勤时长
	 */
	@Column(name = "turn_work")
	private Double turnWork;
	
	/**
	 * 
	 * 加班时长
	 */
	@Column(name = "over_time")
	private Double overtime;
	
	/**
	 * 
	 * 缺勤时长
	 */
	@Column(name = "duty_work")
	private Double dutyWork;
	
	/**
	 * 
	 * 总出勤时长(出勤+加班)
	 */
	@Column(name = "all_work")
	private Double allWork;
	
	/**
	 * 
	 * 工作日出勤时长
	 */
	@Column(name = "man_day")
	private Double manDay;
	
	/**
	 * 
	 * 工作日加班时长
	 */
	@Column(name = "man_day_dvertime")
	private Double manDayOvertime;
	
	/**
	 * 
	 * 周末出勤时长
	 */
	@Column(name = "weekend_turn_work")
	private Double weekendTurnWork;
	
	/**
	 * 请假时长
	 */
	@Column(name = "leave_time")
	private Double leaveTime;
	
	/**
	 * 调休时长
	 * 
	 */
	@Column(name = "take_work")
	private Double takeWork ;
	
	/**
	 * 请假事项详情
	 */
	@Column(name = "leave_details")
	private String leaveDetails;
	
	/**
	 * 备注
	 */
	@Column(name = "remarks")
	private String remarks;
	
	
	
    public  AttendanceCollect (){
    	
    }
	
	//有参构造，直接传入AttendanceTime的list，计算出汇总后的数据
    public AttendanceCollect (List<AttendanceTime> list){
    	
    	time = list.get(0).getTime();
    	userId = list.get(0).getUserId();
    	turnWork =  list.stream().filter(AttendanceTime->AttendanceTime.getTurnWorkTime()!=null).mapToDouble(AttendanceTime::getTurnWorkTime).sum();
    	overtime =  list.stream().filter(AttendanceTime->AttendanceTime.getOvertime()!=null).mapToDouble(AttendanceTime::getOvertime).sum();
    	dutyWork = list.stream().filter(AttendanceTime->AttendanceTime.getDutytime()!=null).mapToDouble(AttendanceTime::getDutytime).sum();
    	leaveTime = list.stream().filter(AttendanceTime->AttendanceTime.getLeaveTime()!=null).mapToDouble(AttendanceTime::getLeaveTime).sum();
    	takeWork =  list.stream().filter(AttendanceTime->AttendanceTime.getTakeWork()!=null).mapToDouble(AttendanceTime::getTakeWork).sum();
    	allWork = NumUtils.sum(turnWork, overtime);
    	for (int i = 0; i < list.size(); i++) {
    		if(i != 0){
    			String hd = list.get(i-1).getHolidayDetail();
    			if( list.get(i).getHolidayDetail() != null && list.get(i).getHolidayDetail().equals(hd)){
    				hd = list.get(i).getHolidayDetail();
    			}else  if(list.get(i).getHolidayDetail() != null){
    				leaveDetails =leaveDetails+","+list.get(i).getHolidayDetail();
    			}
    		}else{
    			leaveDetails = list.get(i).getHolidayDetail();
    		}
		}
    	
    	//工作日AttendanceTime集合
		List<AttendanceTime> manDayList = null;
		//周末AttendanceTime集合
		List<AttendanceTime> weekendTurnWorkList = null;
    	for(AttendanceTime attendanceTime : list ){
    		 manDayList = new ArrayList<>();
    		 weekendTurnWorkList = new ArrayList<>();
    		boolean flag = DatesUtil.isWeekend(attendanceTime.getTime());
    		if(flag){
    			weekendTurnWorkList.add(attendanceTime);
    		}else{
    			manDayList.add(attendanceTime);
    		}
    	}
    	manDay = manDayList.stream().filter(AttendanceTime->AttendanceTime.getTurnWorkTime()!=null).mapToDouble(AttendanceTime::getTurnWorkTime).sum();
    	manDayOvertime =  manDayList.stream().filter(AttendanceTime->AttendanceTime.getOvertime()!=null).mapToDouble(AttendanceTime::getOvertime).sum();
    	weekendTurnWork = weekendTurnWorkList.stream().filter(AttendanceTime->AttendanceTime.getTurnWorkTime()!=null).mapToDouble(AttendanceTime::getTurnWorkTime).sum();
    }
	
    
    

	public Double getTakeWork() {
		return takeWork;
	}

	public void setTakeWork(Double takeWork) {
		this.takeWork = takeWork;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	

	public Double getLeaveTime() {
		return leaveTime;
	}

	public void setLeaveTime(Double leaveTime) {
		this.leaveTime = leaveTime;
	}

	public String getLeaveDetails() {
		return leaveDetails;
	}

	public void setLeaveDetails(String leaveDetails) {
		this.leaveDetails = leaveDetails;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Double getTurnWork() {
		return turnWork;
	}

	public void setTurnWork(Double turnWork) {
		this.turnWork = turnWork;
	}

	public Double getOvertime() {
		return overtime;
	}

	public void setOvertime(Double overtime) {
		this.overtime = overtime;
	}

	public Double getDutyWork() {
		return dutyWork;
	}

	public void setDutyWork(Double dutyWork) {
		this.dutyWork = dutyWork;
	}

	public Double getAllWork() {
		return allWork;
	}

	public void setAllWork(Double allWork) {
		this.allWork = allWork;
	}

	public Double getManDay() {
		return manDay;
	}

	public void setManDay(Double manDay) {
		this.manDay = manDay;
	}

	public Double getManDayOvertime() {
		return manDayOvertime;
	}

	public void setManDayOvertime(Double manDayOvertime) {
		this.manDayOvertime = manDayOvertime;
	}

	public Double getWeekendTurnWork() {
		return weekendTurnWork;
	}

	public void setWeekendTurnWork(Double weekendTurnWork) {
		this.weekendTurnWork = weekendTurnWork;
	}
	
	
	
	
	

}
