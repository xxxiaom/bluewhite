package com.bluewhite.personnel.attendance.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.bluewhite.base.BaseEntity;
import com.bluewhite.system.user.entity.User;

/**
 * 签到记录 
 * 
 * @author zhangliang
 *
 */
@Entity
@Table(name = "person_attendance"  ,indexes = {	@Index(columnList = "time")})     
public class Attendance extends BaseEntity<Long> {
	
	/**
	 * 员工编号（考勤机上的编号）
	 * 
	 */
	@Column(name = "number")
	private String number;
	
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
	 * 签到考勤时间
	 */
	@Column(name = "time")
	private Date time;
	
	/**
	 * 
	 * 签到状态  0 上班 1下班 2补签
	 */
	@Column(name = "inout_mode")
	private Integer inOutMode;
	
	/**
	 *  验证方式：0为密码验证，1为指纹验证，2为卡验，15为 面部验证
	 */
	@Column(name = "verify_mode")
	private Integer verifyMode;
	
	/**
	 * 员工姓名
	 */
	@Transient
	private String userName;
	
	/**
	 * 查询字段
	 */
	@Transient
	private Date orderTimeBegin;
	/**
	 * 查询字段
	 */
	@Transient
	private Date orderTimeEnd;
	
	/**
	 * 查询字段（部门）
	 */
	@Transient
	private Long orgNameId;
	
	/**
	 * 查询字段（部门）
	 */
	@Transient
	private String orgName;

	

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}


	public Long getOrgNameId() {
		return orgNameId;
	}

	public void setOrgNameId(Long orgNameId) {
		this.orgNameId = orgNameId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getOrderTimeBegin() {
		return orderTimeBegin;
	}

	public void setOrderTimeBegin(Date orderTimeBegin) {
		this.orderTimeBegin = orderTimeBegin;
	}

	public Date getOrderTimeEnd() {
		return orderTimeEnd;
	}

	public void setOrderTimeEnd(Date orderTimeEnd) {
		this.orderTimeEnd = orderTimeEnd;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
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

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getInOutMode() {
		return inOutMode;
	}

	public void setInOutMode(Integer inOutMode) {
		this.inOutMode = inOutMode;
	}

	public Integer getVerifyMode() {
		return verifyMode;
	}

	public void setVerifyMode(Integer verifyMode) {
		this.verifyMode = verifyMode;
	}
	
	
	
	
	

}
