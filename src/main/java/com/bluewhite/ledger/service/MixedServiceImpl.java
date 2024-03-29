package com.bluewhite.ledger.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.Predicate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.bluewhite.base.BaseServiceImpl;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.common.entity.PageResult;
import com.bluewhite.common.utils.DatesUtil;
import com.bluewhite.common.utils.NumUtils;
import com.bluewhite.ledger.dao.BillDao;
import com.bluewhite.ledger.dao.MixedDao;
import com.bluewhite.ledger.entity.Bill;
import com.bluewhite.ledger.entity.Mixed;

@Service
public class MixedServiceImpl extends BaseServiceImpl<Mixed, Long> implements MixedService{
	 
	@Autowired
	private MixedDao dao;
	
	@Autowired
	private BillDao billdao;
	
	
	@Override
	public PageResult<Mixed> findPages(Mixed param, PageParameter page) {
		Page<Mixed> pages = dao.findAll((root,query,cb) -> {
			List<Predicate> predicate = new ArrayList<>();
			//按乙方
        	if(!StringUtils.isEmpty(param.getMixPartyNames())){
        		predicate.add(cb.like(root.get("mixPartyNames").as(String.class), "%"+param.getMixPartyNames()+"%"));
        	}
        	//按合同签订日期
			if (!StringUtils.isEmpty(param.getOrderTimeBegin()) &&  !StringUtils.isEmpty(param.getOrderTimeEnd()) ) {
    			predicate.add(cb.between(root.get("mixtSubordinateTime").as(Date.class),
    					param.getOrderTimeBegin(),
    					param.getOrderTimeEnd()));
    		}
			Predicate[] pre = new Predicate[predicate.size()];
			query.where(predicate.toArray(pre));
        	return null;
		},page);
		
			PageResult<Mixed> result = new PageResult<Mixed>(pages, page);
        return result;
	}
	
	
	@Override
	public void addMixed(Mixed mixed) {
		dao.save(mixed);
		List<Bill> billList = billdao.findByPartyNamesIdAndBillDateBetween(mixed.getMixPartyNamesId(),DatesUtil.getFirstDayOfMonth(mixed.getMixtSubordinateTime()),	DatesUtil.getLastDayOfMonth(mixed.getMixtSubordinateTime()));
		Bill bill = new Bill();
		if(billList.size()>0){	
		bill =  billList.get(0);
		}else{
			bill.setPartyNames(mixed.getMixPartyNames());
			bill.setPartyNamesId(mixed.getMixPartyNamesId());
			bill.setBillDate(mixed.getMixtSubordinateTime());
		}
			NumUtils.setzro(bill);
			if(bill!=null){
				List<Mixed> mixedList = dao.findByMixPartyNamesIdAndMixtSubordinateTimeBetween(mixed.getMixPartyNamesId(),DatesUtil.getFirstDayOfMonth(mixed.getMixtSubordinateTime()),DatesUtil.getLastDayOfMonth(mixed.getMixtSubordinateTime()));
				double	acceptPayable = mixedList.stream().mapToDouble(Mixed::getMixPrice).sum();
				bill.setAcceptPayable(NumUtils.round(acceptPayable,4));
				//当月货款未到
				bill.setNonArrivalPay(NumUtils.sub(NumUtils.sum(bill.getAcceptPay(),bill.getAcceptPayable()),bill.getArrivalPay()));
				//当月客户多付货款转下月应付
				bill.setOverpaymentPay(bill.getNonArrivalPay()<0 ?bill.getNonArrivalPay() :0.0);
				billdao.save(bill);
			}
		
	}

	
	@Override
	@Transactional
	public void deleteMixed(String ids) {
		if (!StringUtils.isEmpty(ids)) {
			String[] idArr = ids.split(",");
			if (idArr.length > 0) {
				for (int i = 0; i < idArr.length; i++) {
					Long id = Long.parseLong(idArr[i]);
					Mixed  mixed=dao.findOne(id);
					List<Bill> billList = billdao.findByPartyNamesIdAndBillDateBetween(mixed.getMixPartyNamesId(),DatesUtil.getFirstDayOfMonth(mixed.getMixtSubordinateTime()),	DatesUtil.getLastDayOfMonth(mixed.getMixtSubordinateTime()));
					if(billList.size()>0){
						Bill bill = billList.get(0);
						NumUtils.setzro(bill);
						if(bill!=null){
							bill.setAcceptPayable(NumUtils.sub(bill.getAcceptPayable(),mixed.getMixPrice()));
							//当月货款未到
							bill.setNonArrivalPay(NumUtils.sub(NumUtils.sum(bill.getAcceptPay(),bill.getAcceptPayable()),bill.getArrivalPay()));
							//当月客户多付货款转下月应付
							bill.setOverpaymentPay(bill.getNonArrivalPay()<0 ?bill.getNonArrivalPay() :0.0);
							billdao.save(bill);
						}
						dao.delete(id);
					}
				}
			}
		}

	}
}
