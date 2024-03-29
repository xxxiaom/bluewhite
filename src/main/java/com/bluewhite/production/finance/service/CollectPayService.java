package com.bluewhite.production.finance.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bluewhite.base.BaseCRUDService;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.common.entity.PageResult;
import com.bluewhite.production.finance.entity.CollectPay;
import com.bluewhite.production.finance.entity.GroupProduction;
import com.bluewhite.production.finance.entity.MonthlyProduction;
import com.bluewhite.production.finance.entity.NonLine;
@Service
public interface CollectPayService extends BaseCRUDService<CollectPay,Long>{

	public PageResult<CollectPay> findPages(CollectPay collect, PageParameter page);
	/**
	 * 按条件汇总员工绩效
	 * @param collectPay
	 */
	public List<CollectPay> collect(CollectPay collectPay);
	
	/**
	 * 质检月产量报表
	 * @param collectInformation
	 * @return
	 */
	public List<MonthlyProduction> monthlyProduction(MonthlyProduction monthlyProduction);
	
	
	/**
	 * 计算各组人员考情时间和B工资+杂工的汇总
	 * @param monthlyProduction
	 * @return
	 */
	public List<Map<String,Object>> bPayAndTaskPay(MonthlyProduction monthlyProduction);
	
	/**
	 * 获取非一线人员的绩效汇总表，每个组的男女组长，按月
	 * @param monthlyProduction
	 * @return
	 */
	public List<NonLine>  headmanPay(NonLine nonLine);
	
	
	/**
	 * 查询出二楼整个月的绩效
	 * @param collectPay
	 * @return
	 */
	public List<CollectPay> twoPerformancePay(CollectPay collectPay);
	
	
	/**
	 * 根据系数进行调节绩效
	 * @param collectPay
	 * @return
	 */
	public CollectPay upadtePerformancePay(CollectPay collectPay);
	
	/**
	 * 二楼统计出打棉组做其他任务的b工资和数量
	 * @param collectPay
	 */
	public List<CollectPay> cottonOtherTask(CollectPay collectPay);
	
	
	/**
	 * 获取非一线人员的绩效汇总表，每个组的男女组长，按月修改
	 * @param monthlyProduction
	 * @return
	 */
	public NonLine updateHeadmanPay(NonLine nonLine);
	
	/**
	 * 检验组产量报表
	 * @param collectInformation
	 * @return
	 */
	public List<GroupProduction> groupProduction(GroupProduction groupProduction);
	
	/**
	 * 获取当月的产量 
	 * 
	 */
	public Object getMouthYields(Long id,String date);
	
	
	CollectPay findCollectPay(CollectPay collectPay);
	

	


}
