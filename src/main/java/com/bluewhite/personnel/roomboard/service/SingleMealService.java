package com.bluewhite.personnel.roomboard.service;

import com.bluewhite.base.BaseCRUDService;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.common.entity.PageResult;
import com.bluewhite.personnel.roomboard.entity.SingleMeal;

public interface SingleMealService  extends BaseCRUDService<SingleMeal,Long>{
	
	/**
	 * 按条件查看
	 * @param 
	 * @return
	 */
	public PageResult<SingleMeal> findPage(SingleMeal singleMeal, PageParameter page);
	
	/**
	 * 新增
	 * @param 
	 */
	public SingleMeal addSingleMeal(SingleMeal singleMeal);
	
	/**
	 * 删除
	 * @param 
	 */
	public int deletes(String[] ids);
}
