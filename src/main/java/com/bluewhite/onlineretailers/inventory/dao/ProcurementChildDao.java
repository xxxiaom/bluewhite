package com.bluewhite.onlineretailers.inventory.dao;

import java.util.Date;
import java.util.List;

import com.bluewhite.base.BaseRepository;
import com.bluewhite.onlineretailers.inventory.entity.ProcurementChild;

public interface ProcurementChildDao extends BaseRepository<ProcurementChild, Long>{
	/**
	 * 根据商品和类型和大于某个数量入库子单
	 * @return
	 */
	List<ProcurementChild> findByCommodityIdAndStatusAndResidueNumberGreaterThan(Long commodityId, Integer status, int residueNumber);

	
	/**
	 * 根据销售子单id获取出库单
	 * @return
	 */
	List<ProcurementChild> findByOnlineOrderId(Long id);

	/**
	 * 
	 * @param orderTimeBegin
	 * @param orderTimeEnd
	 * @return
	 */
	List<ProcurementChild> findByCreatedAtBetween(Date orderTimeBegin, Date orderTimeEnd);
	

}
