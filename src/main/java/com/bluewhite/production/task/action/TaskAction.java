package com.bluewhite.production.task.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.bluewhite.common.BeanCopyUtils;
import com.bluewhite.common.ClearCascadeJSON;
import com.bluewhite.common.DateTimePattern;
import com.bluewhite.common.Log;
import com.bluewhite.common.entity.CommonResponse;
import com.bluewhite.common.entity.ErrorCode;
import com.bluewhite.common.entity.PageParameter;
import com.bluewhite.common.utils.NumUtils;
import com.bluewhite.production.bacth.entity.Bacth;
import com.bluewhite.production.finance.dao.PayBDao;
import com.bluewhite.production.finance.entity.PayB;
import com.bluewhite.production.procedure.entity.Procedure;
import com.bluewhite.production.productionutils.constant.ProTypeUtils;
import com.bluewhite.production.task.entity.Task;
import com.bluewhite.production.task.service.TaskService;
import com.bluewhite.system.user.entity.User;
import com.bluewhite.system.user.service.UserService;

@Controller
public class TaskAction {
	
private static final Log log = Log.getLog(TaskAction.class);
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PayBDao payBDao;
	
	private ClearCascadeJSON clearCascadeJSON;

	{
		clearCascadeJSON = ClearCascadeJSON
				.get()
				.addRetainTerm(Task.class,"id","remark","userNames","bacthNumber","allotTime","productName","userIds","procedure","procedureName","number","status","expectTime"
						,"expectTaskPrice","taskTime","payB","taskPrice","taskActualTime","type","createdAt","performance","performanceNumber","performancePrice","flag")
				.addRetainTerm(Procedure.class,"id","procedureTypeId");
	}
	
	
	/**
	 * 获取任务加绩类型列表
	 */
	@RequestMapping(value = "/task/taskPerformance", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse taskPerformance(HttpServletRequest request) {
		CommonResponse cr = new CommonResponse();
		List<Map<String,Object>> mapList= ProTypeUtils.taskPerformance();
		cr.setData(mapList);
		cr.setMessage("查询成功");
		return cr;
	}
	
	/**
	 * 给批次添加任务
	 * 
	 * 
	 */
	@RequestMapping(value = "/task/addTask", method = RequestMethod.POST)
	@ResponseBody
	public CommonResponse addTask(HttpServletRequest request,Task task) {
		CommonResponse cr = new CommonResponse();
			//新增
			if(!StringUtils.isEmpty(task.getUserIds())){
				task.setAllotTime(ProTypeUtils.countAllotTime(task.getAllotTime(), task.getType()));
				taskService.addTask(task);
				cr.setMessage("任务分配成功");
			}else{
				cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
				cr.setMessage("领取人不能为空");
			}
		return cr;
	}
	
	
	/**
	 * 修改任务
	 * 
	 * 
	 */
	@RequestMapping(value = "/task/upTask", method = RequestMethod.POST)
	@ResponseBody
	public CommonResponse upTask(HttpServletRequest request,Task task) {
		CommonResponse cr = new CommonResponse();
			if(!StringUtils.isEmpty(task.getId())){
				int count = 0;
				Task tk =  taskService.findOne(task.getId());
				for(Task ta :tk.getBacth().getTasks()){
					if(ta.getProcedureId().equals(tk.getProcedureId())){
						count+=ta.getNumber();
					}
				}
				if((count-tk.getNumber()+task.getNumber())>tk.getBacth().getNumber()){
					cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
					cr.setMessage("修改数量不能超过该批次总数:"+tk.getBacth().getNumber());
					return cr;
				}
				Task oldTask = taskService.findOne(task.getId());
				BeanCopyUtils.copyNullProperties(oldTask,task);
				task.setCreatedAt(oldTask.getCreatedAt());
				String[] arrayRefVar = {String.valueOf(task.getProcedureId())};
				task.setProcedureIds(arrayRefVar);
				taskService.addTask(task);
				cr.setMessage("修改成功");
			}else{
				cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
				cr.setMessage("任务不能为空");
			}
		return cr;
	}
	
	
	/**
	 * 给批次添加任务(方式2)
	 * 应业务要求，增加按时间占比，分配不同任务数量给不同的员工，进行新增任务
	 * @throws Exception 
	 * 
	 */
	@RequestMapping(value = "/task/addTaskTwo", method = RequestMethod.POST)
	@ResponseBody
	public CommonResponse addTaskTwo(HttpServletRequest request,Task task) throws Exception {
		CommonResponse cr = new CommonResponse();
			//根据时间占比，组装出新任务
			List<Task> taskList = taskService.assembleTask(task);
			//新增
			for(Task tasks : taskList){
				if(!StringUtils.isEmpty(tasks.getUserIds())){
					tasks.setAllotTime(ProTypeUtils.countAllotTime(task.getAllotTime(), task.getType()));
					taskService.addTask(tasks);
					cr.setMessage("任务分配成功");
				}else{
					cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
					cr.setMessage("领取人不能为空");
				}
			}
		return cr;
	}
	
	

	/** 
	 * 分页查询所有任务
	 * 
	 */
	@RequestMapping(value = "/task/allTask", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse allTask(HttpServletRequest request,Task task,PageParameter page) {
		CommonResponse cr = new CommonResponse();
		cr.setData(clearCascadeJSON.format(taskService.findPages(task, page)).toJSON());
		cr.setMessage("查询成功");
		return cr;
	}
	
	
	/**
	 * 删除任务
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/task/delete", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse delete(HttpServletRequest request,String ids) {
		CommonResponse cr = new CommonResponse();
		if(!StringUtils.isEmpty(ids)){
			taskService.deleteTask(ids);
			cr.setMessage("删除成功");
		}else{
			cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
			cr.setMessage("不能为空");
		}
		return cr;
	}
	
	
	/**
	 * 查询该任务的所有领取人
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/task/taskUser", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse taskUser(HttpServletRequest request,Long id) {
		CommonResponse cr = new CommonResponse();
		if(id!=null){
			Task task = taskService.findOne(id);
			List<User> userList = new ArrayList<User>();
			if (!StringUtils.isEmpty(task.getUserIds())) {
				String[] idArr = task.getUserIds().split(",");
				if (idArr.length>0) {
					for (int i = 0; i < idArr.length; i++) {
						Long userid = Long.parseLong(idArr[i]);
						User user = userService.findOne(userid);
						userList.add(user);
						}
				}
			}
			cr.setData(ClearCascadeJSON.get().addRetainTerm(User.class, "id","userName")
					.format(userList).toJSON());
			cr.setMessage("查询成功");
		}else{
			cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
			cr.setMessage("不能为空");
		}
		return cr;
	}
	
	
	/********一楼包装*********/
	
	/**
	 * 获取任务加绩类型列表
	 */
	@RequestMapping(value = "/task/pickTaskPerformance", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse pickTaskPerformance(HttpServletRequest request) {
		CommonResponse cr = new CommonResponse();
		List<Map<String,Object>> mapList= ProTypeUtils.pickTaskPerformance();
		cr.setData(mapList);
		cr.setMessage("查询成功");
		return cr;
	}
	
	
	/**
	 * 通过任务id，重新分配人员的加绩工资
	 */
	@RequestMapping(value = "/task/giveTaskPerformance", method = RequestMethod.POST)
	@ResponseBody
	public CommonResponse giveTaskPerformance(HttpServletRequest request,String[] taskIds,String[] ids, String[] performance , Double[] performanceNumber,Integer update) {
		CommonResponse cr = new CommonResponse();
		if (!StringUtils.isEmpty(taskIds)) {
			if (taskIds.length>0) {
				for (int i = 0; i < taskIds.length; i++) {
						Long id = Long.parseLong(taskIds[i]);
						Task task = taskService.findOne(id);
						if(!StringUtils.isEmpty(ids) && !StringUtils.isEmpty(performance) && !StringUtils.isEmpty(performanceNumber)){
							task.setPerformance(performance[i]);
							task.setPerformanceNumber(performanceNumber[i]);
							//任务加绩具体数值
							double performancePrice = NumUtils.round(ProTypeUtils.sumtaskPerformancePrice(task), null);
							task.setPerformancePrice(performancePrice);
							if(update==1){
								List<PayB> payBListO = payBDao.findByTaskId(id);
								payBListO.stream().filter(PayB->PayB.getPerformancePayNumber()!=null).collect(Collectors.toList());
								if(payBListO.size()>0){
									for(PayB pl : payBListO){
										pl.setPerformance(null);
										pl.setPerformancePayNumber(null);
										pl.setPerformanceNumber(null);
									}
									payBDao.save(payBListO);
								}
							}
							if (!StringUtils.isEmpty(ids)) {
								if (ids.length>0) {
									for (int ii = 0; ii < ids.length; ii++) {
										Long userid = Long.parseLong(ids[ii]);
										PayB payB = payBDao.findByTaskIdAndUserId(task.getId(),userid);
										payB.setPerformance(performance[i]);
										payB.setPerformancePayNumber(performancePrice/ids.length);
										payB.setPerformanceNumber(performanceNumber[i]);
										payBDao.save(payB);
									}
								}
							}
							List<PayB> payBList = payBDao.findByTaskId(id);
							task.setPerformancePrice(payBList.stream().filter(PayB->PayB.getPerformancePayNumber()!=null).mapToDouble(PayB::getPerformancePayNumber).sum());
							
						}else{
							task.setPerformance(null);
							task.setPerformanceNumber(null);
							task.setPerformancePrice(0.0);
							List<PayB> payBListO = payBDao.findByTaskId(id);
							payBListO.stream().filter(PayB->PayB.getPerformancePayNumber()!=null).collect(Collectors.toList());
							if(payBListO.size()>0){
								for(PayB pl : payBListO){
									pl.setPerformance(null);
									pl.setPerformancePayNumber(null);
									pl.setPerformanceNumber(null);
								}
								payBDao.save(payBListO);
							}
							
						}
						taskService.save(task);
				}
			}
		}
		cr.setMessage("添加成功");
		return cr;
	}
	
	
	/**
	 * 通过任务id，获取人员的加绩工资
	 * 
	 */
	@RequestMapping(value = "/task/getUserPerformance", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse getUserPerformance(HttpServletRequest request,Long id) {
		CommonResponse cr = new CommonResponse();
		List<PayB> payBList = payBDao.findByTaskId(id);
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		Map<Object, List<PayB>> mapPayB = payBList.stream().filter(PayB->PayB.getPerformance()!=null).collect(Collectors.groupingBy(PayB::getPerformance,Collectors.toList()));
		for(Object ps : mapPayB.keySet()){
			map = new HashMap<String, Object>();
			List<PayB> psList= mapPayB.get(ps);
			List<String> userNameList = new ArrayList<String>();
			for(PayB payB : psList){
				userNameList.add(payB.getUserName());
			}
			map.put("performance", ps);
			map.put("username", userNameList);
			listMap.add(map);
		}
		cr.setData(listMap);
		cr.setMessage("查询成功");
		return cr;
	}
	
	
	
	
	/********二楼机工*********/
	
	/**
	 * 添加返工任务任务
	 * 
	 * 
	 */
	@RequestMapping(value = "/task/addReTask", method = RequestMethod.POST)
	@ResponseBody
	public CommonResponse addReTask(HttpServletRequest request,Task task) {
		CommonResponse cr = new CommonResponse();
			//修改
			if(!StringUtils.isEmpty(task.getId())){
				Task oldTask = taskService.findOne(task.getId());
				BeanCopyUtils.copyNullProperties(oldTask,task);
				task.setCreatedAt(oldTask.getCreatedAt());
				taskService.save(task);
				cr.setMessage("修改成功");
			}else{
				//新增
				if(!StringUtils.isEmpty(task.getUserIds())){
					task.setAllotTime(ProTypeUtils.countAllotTime(task.getAllotTime(), task.getType()));
					taskService.addReTask(task);
					cr.setMessage("任务分配成功");
				}else{
					cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
					cr.setMessage("领取人不能为空");
				}
			}
		return cr;
	}
	
	
	/**
	 * 删除技工返工任务
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/task/deleteReTask", method = RequestMethod.GET)
	@ResponseBody
	public CommonResponse deleteReTask(HttpServletRequest request,String ids) {
		CommonResponse cr = new CommonResponse();
		if(!StringUtils.isEmpty(ids)){
			taskService.deleteReTask(ids);
			cr.setMessage("删除成功");
		}else{
			cr.setCode(ErrorCode.ILLEGAL_ARGUMENT.getCode());
			cr.setMessage("不能为空");
		}
		return cr;
	}
	
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat(
				DateTimePattern.DATEHMS.getPattern());
		binder.registerCustomEditor(java.util.Date.class, null,
				new CustomDateEditor(dateTimeFormat, true));
		binder.registerCustomEditor(byte[].class,
				new ByteArrayMultipartFileEditor());
	}
	

}
