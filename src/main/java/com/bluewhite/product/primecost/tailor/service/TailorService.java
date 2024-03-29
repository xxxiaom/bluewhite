package com.bluewhite.product.primecost.tailor.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bluewhite.base.BaseCRUDService;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.common.entity.PageResult;
import com.bluewhite.product.primecost.tailor.entity.OrdinaryLaser;
import com.bluewhite.product.primecost.tailor.entity.Tailor;

@Service
public interface TailorService extends BaseCRUDService<Tailor,Long> {
	
	
	/**
	 * 
	 * 新增裁剪
	 * @param tailor
	 * @return
	 */
	public Tailor  saveTailor(Tailor tailor) ;
	
	/**
	 * 分页查询裁剪
	 * @param tailor
	 * @param page
	 * @return
	 */
	public PageResult<Tailor> findPages(Tailor tailor, PageParameter page);
	
	
	/**
	 * 获取裁剪页面所需要的数据
	 * @param tailor
	 * @return
	 */
	public OrdinaryLaser getOrdinaryLaserDate(Tailor tailor,OrdinaryLaser  prams);
	/**
	 * 获取各种裁剪方式页面所需要的数据
	 * @param tailor
	 * @return
	 */
	public Tailor getTailorDate(Tailor tailor,OrdinaryLaser ordinaryLaser);

	
	public List<Tailor> findByProductId(Long productId);
	

}
