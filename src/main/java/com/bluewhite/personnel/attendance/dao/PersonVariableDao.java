package com.bluewhite.personnel.attendance.dao;

import com.bluewhite.base.BaseRepository;
import com.bluewhite.personnel.attendance.entity.PersonVariable;

public interface PersonVariableDao  extends BaseRepository<PersonVariable, Long>{
	
	
	PersonVariable findByType(Integer type);
	
}
