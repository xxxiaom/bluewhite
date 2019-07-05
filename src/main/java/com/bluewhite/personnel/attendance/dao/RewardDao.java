package com.bluewhite.personnel.attendance.dao;

import java.util.List;

import com.bluewhite.base.BaseRepository;
import com.bluewhite.personnel.attendance.entity.Reward;

public interface RewardDao extends BaseRepository<Reward, Long>{
	
	public List<Reward> findByRecruitIdAndType(Long recruitId,Integer type);
	
	public List<Reward> findBycoverRecruitIdAndType(Long coverRecruitId,Integer type);
}