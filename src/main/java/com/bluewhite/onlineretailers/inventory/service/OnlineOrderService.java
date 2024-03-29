package com.bluewhite.onlineretailers.inventory.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bluewhite.base.BaseCRUDService;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.common.entity.PageResult;
import com.bluewhite.common.utils.excel.ExcelListener;
import com.bluewhite.onlineretailers.inventory.entity.OnlineCustomer;
import com.bluewhite.onlineretailers.inventory.entity.OnlineOrder;
import com.bluewhite.onlineretailers.inventory.entity.OnlineOrderChild;
import com.bluewhite.onlineretailers.inventory.entity.Procurement;
import com.bluewhite.onlineretailers.inventory.entity.ProcurementChild;
@Service
public interface OnlineOrderService extends BaseCRUDService<OnlineOrder,Long>{
	
	/**
	 * 分页查看销售单
	 * @param onlineOrder
	 * @param page
	 * @return
	 */
	public PageResult<OnlineOrder> findPage(OnlineOrder onlineOrder, PageParameter page);
	
	/**
	 * 分页查看销售单子单
	 * @param onlineOrder
	 * @param page
	 * @return
	 */
	public PageResult<OnlineOrderChild> findPage(OnlineOrderChild onlineOrderChild, PageParameter page);
	
	/**
	 * 反冲销售单
	 * @param ids
	 */
	public int deleteOnlineOrder(String ids);
	
	
	/**
	 * 新增销售单
	 * @param onlineOrder
	 */
	public OnlineOrder addOnlineOrder(OnlineOrder onlineOrder);

	/**
	 * 一键发货销售单
	 * @param onlineOrder
	 */
	public int delivery(String delivery);
	
	/**
	 * 导入销售单
	 * @param excelListener
	 * @return
	 */
	public int excelOnlineOrder(ExcelListener excelListener,Long onlineCustomerId,Long userId,Long warehouseId);
	
	/**
	 * 根据时间和类型获取销售报表
	 * @param type
	 * @param date
	 * @param beginTime
	 * @return
	 */
	List<Map<String, Object>> reportSales(OnlineOrder onlineOrder);
	
	/**
	 * 根据时间和类型获取销售子报表
	 * @param type
	 * @param date
	 * @param beginTime
	 * @return
	 */
	List<OnlineOrderChild> reportSalesChild(OnlineOrderChild onlineOrderChild);
	
	/**
	 * 根据时间和类型获取商品
	 * @param onlineOrder
	 * @return
	 */
	public List<Map<String, Object>> reportSalesGoods(Procurement procurement);
	
	/**
	 * 根据销员工获取销售报表
	 * @param onlineOrder
	 * @return
	 */
	public List<Map<String, Object>> reportSalesUser(OnlineOrder onlineOrder);
	/**
	 * 获取商品最后一次订单单价
	 * @param commodityId
	 * @return
	 */
	public double getOnlineOrderPrice(Long commodityId);
	

}
