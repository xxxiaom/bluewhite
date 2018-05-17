package com.bluewhite.production.procedure.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluewhite.basedata.entity.BaseData;
import com.bluewhite.common.ClearCascadeJSON;
import com.bluewhite.common.Log;
import com.bluewhite.common.entity.CommonResponse;
import com.bluewhite.common.entity.ErrorCode;
import com.bluewhite.production.procedure.entity.Procedure;
import com.bluewhite.production.procedure.service.ProcedureService;
@Controller
public class ProcedureAction {
	
private static final Log log = Log.getLog(ProcedureAction.class);
	
	@Autowired
	private ProcedureService procedureService;
	
	private ClearCascadeJSON clearCascadeJSON;

	{
		clearCascadeJSON = ClearCascadeJSON.get().addRetainTerm(Procedure.class,
				"id","name", "workingTime","productId","isDel","procedureType")
				.addRetainTerm(BaseData.class, "name", "remark");
	}
	
	/**
	 * 根据产品添加工序
	 * 
	 * type 工序所属部门类型 (1=一楼质检，2=一楼包装，3=二楼针工)
	 * @param request 请求
	 * @return cr
	 * @throws Exception
	 */
	@RequestMapping(value = "/addProcedure", method = RequestMethod.POST)
	@ResponseBody
	public CommonResponse addProcedur(HttpServletRequest request,Procedure procedure) {
		CommonResponse cr = new CommonResponse();
		if(procedure.getProductId()!=null){
			cr.setData(clearCascadeJSON.format(procedureService.save(procedure)).toJSON());;
			cr.setMessage("工序添加成功");
		}else{
			cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
			cr.setMessage("产品不能为空");
		}
		return cr;
	}
	
	
	/**
	 * 根据产品查询工序
	 * @param request
	 * @param procedure
	 * @return
	 */
	@RequestMapping(value = "/getProcedure", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse getProcedure(HttpServletRequest request,Procedure procedure) {
		CommonResponse cr = new CommonResponse();
		if(procedure.getProductId()!=null){
			cr.setData(clearCascadeJSON.format(procedureService.findByProductIdAndType(procedure.getProductId(),procedure.getType())).toJSON());
			cr.setMessage("工序添加成功");
		}else{
			cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
			cr.setMessage("产品不能为空");
		}
		return cr;
	}
	
	
	/**
	 * 删除工序
	 * @param request
	 * @param procedure
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public CommonResponse delete(HttpServletRequest request,Long id) {
		CommonResponse cr = new CommonResponse();
		if(id!=null){
			procedureService.delete(id);
			cr.setMessage("工序删除成功");
		}else{
			cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
			cr.setMessage("工序不能为空");
		}
		return cr;
	}
	

}
