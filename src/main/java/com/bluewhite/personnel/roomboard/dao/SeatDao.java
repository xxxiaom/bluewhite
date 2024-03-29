package com.bluewhite.personnel.roomboard.dao;

import com.bluewhite.base.BaseRepository;
import com.bluewhite.personnel.roomboard.entity.Seat;

public interface SeatDao extends BaseRepository<Seat, Long>{
	/*
	 * 根据岗位ID 年龄范围 手速去查询奖励
	 */
	public Seat findByPositionIdAndAgeAndSpeed(Long positionId,Integer age,Integer speed);

}
