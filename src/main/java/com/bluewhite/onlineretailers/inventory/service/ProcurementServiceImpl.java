package com.bluewhite.onlineretailers.inventory.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.Predicate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bluewhite.base.BaseServiceImpl;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.common.entity.PageResult;
import com.bluewhite.onlineretailers.inventory.dao.ProcurementDao;
import com.bluewhite.onlineretailers.inventory.entity.Commodity;
import com.bluewhite.onlineretailers.inventory.entity.Procurement;
@Service
public class ProcurementServiceImpl extends BaseServiceImpl<Procurement, Long> implements  ProcurementService{
	
	@Autowired
	private ProcurementDao dao;
	@Autowired
	private CommodityService commodityService;
	

	@Override
	public PageResult<Procurement> findPage(Procurement param, PageParameter page) {
		 Page<Procurement> pages = dao.findAll((root,query,cb) -> {
	        	List<Predicate> predicate = new ArrayList<>();
	        	//按id过滤
	        	if (param.getId() != null) {
					predicate.add(cb.equal(root.get("id").as(Long.class),param.getId()));
				}
	        	
	        	//按编号过滤
	        	if (!StringUtils.isEmpty(param.getStatus())) {
					predicate.add(cb.equal(root.get("status").as(String.class),param.getStatus()));
				}
	        	
				Predicate[] pre = new Predicate[predicate.size()];
				query.where(predicate.toArray(pre));
	        	return null;
	        }, page);

	        PageResult<Procurement> result = new PageResult<>(pages,page);
	        return result;
	    }

	@Override
	public Procurement saveProcurement(Procurement procurement) {
		if(!StringUtils.isEmpty(procurement.getCommodityNumber())){
			JSONArray jsonArray = JSON.parseArray(procurement.getCommodityNumber());
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				Commodity commodity = commodityService.findOne(jsonObject.getLong("commodityId"));
				//入库单
				if(procurement.getType()==0){
				}
				//出库单
				if(procurement.getType()==1){
				}
				procurement.getCommoditys().add(commodity);
			}
		}
		return dao.save(procurement);
	}

}
