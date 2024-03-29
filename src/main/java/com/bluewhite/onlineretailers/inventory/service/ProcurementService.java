package com.bluewhite.onlineretailers.inventory.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bluewhite.base.BaseCRUDService;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.common.entity.PageResult;
import com.bluewhite.common.utils.excel.ExcelListener;
import com.bluewhite.onlineretailers.inventory.entity.Procurement;

@Service
public interface ProcurementService extends BaseCRUDService<Procurement, Long> {

	/**
	 * 分页查询
	 * 
	 * @param param
	 * @param page
	 * @return
	 */
	PageResult<Procurement> findPage(Procurement param, PageParameter page);

	/**
	 * 新增单据
	 * 
	 * @param procurement
	 */
	Procurement saveProcurement(Procurement procurement);

	/**
	 * 反冲单据
	 * 
	 * @param ids
	 * @return
	 */
	int deleteProcurement(String ids);
	
	/**
	 * 导入出库单据
	 * 
	 * @param ids
	 * @return
	 */
	int excelProcurement(ExcelListener excelListener,Long userId ,Long warehouseId);

	/**
	 * 根据时间和类型获取单据
	 * 
	 * @param type
	 * @param date
	 * @param beginTime
	 * @return
	 */
	List<Procurement> findByTypeAndCreatedAt(int type, Date startTime, Date endTime);
	
	/**
	 * 查询销售出库的出库单
	 * @param type
	 * @param startTime
	 * @param beginTime
	 * @return
	 */
	List<Procurement> findByTypeAndStatusAndCreatedAtBetween(int type,int status, Date startTime, Date endTime);

	List<Map<String, Object>> reportStorage(Procurement procurement);

	List<Map<String, Object>> reportStorageGoods(Procurement procurement);

	List<Map<String, Object>> reportStorageUser(Procurement procurement);

}
