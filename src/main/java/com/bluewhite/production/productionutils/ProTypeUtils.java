package com.bluewhite.production.productionutils;

import com.bluewhite.common.Constants;
import com.bluewhite.common.SessionManager;
import com.bluewhite.common.entity.CurrentUser;
/**
 * 生产控制计算工具类
 * @author zhangliang
 *
 */
public  class ProTypeUtils {
	
	/**
	 * 当部门预计生产价格计算系数 1=一楼质检
	 */
	private final static double  FRIST_QUALITY = 0.00750375;
	/**
	 * 当部门预计生产价格计算系数 2=一楼包装
	 */
	private final static double  FRIST_PACK = 0.00750375;
	/**
	 * 当部门预计生产价格计算系数 3=二楼针工
	 */
	private final static double  TOW_DEEDLE = 0.00750375;
	
	
	
	/**
	 * 根据不同权限返回工序的不同类型
	 * 1=一楼质检，2=一楼包装，3=二楼针工
	 * @return
	 */
	public static Integer roleGetProType(){
		CurrentUser cu = SessionManager.getUserSession();
		Integer type = null ;
		// 生产部一楼质检
		if(cu.getRole().contains(Constants.PRODUCT_FRIST_QUALITY)){
			type = 1;
		}
		//生产部一楼打包
		if(cu.getRole().contains(Constants.PRODUCT_FRIST_PACK)){
			type = 2;
		}
		//生产部二楼针工
		if(cu.getRole().contains(Constants.PRODUCT_TOW_DEEDLE)){
			type = 3;
		}
		return type;
	}
	
	/**
	 * 根据不同的部门，计算出当部门预计生产价格
	 * @param price
	 * @param type
	 * @return
	 */
	public static Double sumProTypePrice(Double price,Integer type){
		Double sumPrice = 0.0 ;
		switch (type) {
		case 1:// 生产部一楼质检
			sumPrice = price*ProTypeUtils.FRIST_QUALITY;
			break;
		case 2://生产部一楼打包
			sumPrice = price*ProTypeUtils.FRIST_PACK;
				break;
		case 3://生产部二楼针工
			sumPrice = price*ProTypeUtils.TOW_DEEDLE;
			break;
		default:
			break;
		}
		return sumPrice;
	}
	

}
