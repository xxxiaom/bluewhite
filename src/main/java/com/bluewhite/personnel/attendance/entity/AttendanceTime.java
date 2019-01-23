package com.bluewhite.personnel.attendance.entity;

import java.util.Date;

import javax.persistence.Column;

public class AttendanceTime {
	
	
	/**
	 * 员工考勤日期
	 * 
	 */
	private Date time;
	
	/**
	 * 员工编号（考勤机上的编号）
	 * 
	 */
	private String number;
	
	/**
	 * 员工姓名
	 * 
	 */
	private String username;
	
	/**
	 * 上班签到时间  0—Check-In 
	 * 
	 */
	private Date checkIn ;
	
	/**
	 * 下班签到时间 1—Check-Out
	 * 
	 */
	private Date checkOut;
	
	/**
	 * 
	 * 出勤时长
	 */
	private Double turnWorkTime;
	
	/**
	 * 加班时长
	 * 
	 */
	private Double overtime;
	
	/**
	 * 星期
	 * 
	 */
	private String week;

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}

	public Double getTurnWorkTime() {
		return turnWorkTime;
	}

	public void setTurnWorkTime(Double turnWorkTime) {
		this.turnWorkTime = turnWorkTime;
	}

	public Double getOvertime() {
		return overtime;
	}

	public void setOvertime(Double overtime) {
		this.overtime = overtime;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}
	
	
	
	

}
