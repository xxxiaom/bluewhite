<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html class="no-js">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>杂工管理</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="${ctx }/static/plugins/bootstrap/css/bootstrap.min.css">
	<script src="${ctx }/static/js/vendor/jquery-3.3.1.min.js"></script>
	<script src="${ctx }/static/js/layer/layer.js"></script>	
	<script src="${ctx }/static/js/laydate-icon/laydate.js"></script>
	<link rel="stylesheet" href="${ctx }/static/css/main.css">
	<script src="${ctx }/static/js/laypage/laypage.js"></script>
	<script src="${ctx }/static/plugins/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${ctx }/static/layui-v2.4.5/layui/css/layui.css" media="all">
</head>

<body>
	
<div class="panel panel-default">
	<div class="panel-body">					
		<!--查询开始  -->	
		<table>
			<tr>
				<td>批次名:</td>
				<td><input type="text" name="number" id="number" placeholder="请输入批次号"
					class="form-control search-query number" /></td>
				<td>&nbsp&nbsp</td>
				<td>工序名称:</td>
				<td><input type="text" name="name" id="name" placeholder="请输入产品名称"
					class="form-control search-query name" /></td>
				<td>&nbsp&nbsp</td>
				<td>开始时间:</td>
				<td><input id="startTime" placeholder="请输入开始时间" class="form-control laydate-icon"
					onClick="laydate({elem: '#startTime', istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"></td>
				<td>&nbsp&nbsp</td>
				<td>结束时间:</td>
				<td><input id="endTime" placeholder="请输入结束时间" class="form-control laydate-icon"
					onClick="laydate({elem: '#endTime', istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"></td>
				<td>&nbsp&nbsp</td>
				<td><span class="input-group-btn">
						<button type="button" class="btn btn-info btn-square btn-sm btn-3d searchtask">查&nbsp找</button></span></td>
				<td>&nbsp&nbsp&nbsp&nbsp</td> 
				<td><span class="input-group-btn">
						<button type="button" id="addgroup"class="btn btn-success btn-sm btn-3d pull-right">新增杂工</button></span></td>
				<td>&nbsp&nbsp&nbsp&nbsp</td> 
				<td><span class="input-group-btn">
					<button type="button"class="btn btn-success  btn-sm btn-3d addDict">加绩</button></span></td>
				<td>&nbsp&nbsp&nbsp&nbsp</td> 
				<td><span class="input-group-btn">
						<button type="button"class="btn btn-success  btn-sm btn-3d updatetw">加绩修改</button></span></td>
			</tr>
		</table>
		<h1 class="page-header"></h1>		
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="center"><label> <input type="checkbox"
							class="ace checks" /> <span class="lbl"></span>
					</label></th>
					<th class="text-center">批次名</th>
					<th class="text-center">日期</th>
					<th class="text-center">工序名</th>
					<th class="text-center">现场管理时间</th>
					<th class="text-center">备注</th>
					<th class="text-center">任务价值</th>
					<th class="text-center">B工资净值</th>
					<th class="text-center">添加工价</th>
					<th class="text-center">加绩工资</th>
					<th class="text-center">人员详情</th>
					<th class="text-center">操作</th>
				</tr>
			</thead>
			<tbody id="tablecontent">

			</tbody>
			<thead>
				<tr>
					<td class="text-center">合计</td>
					<td class="text-center"></td>
					<td class="text-center"></td>
					<td class="text-center"></td>
					<td class="text-center"></td>
					<td class="text-center"></td>
					<td class="text-center" id="totale"></td>
					<td class="text-center" id="totaltw"></td>
					<td class="text-center"></td>
					<td class="text-center"></td>
					<td class="text-center"></td>
					<td class="text-center"></td>
				</tr>
			</thead>
		</table>
		<div id="pager" class="pull-right"></div>
	</div>
</div>



	<div id="savegroup" style="display: none;">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">人员分组详情</h4>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
	<!--隐藏框 产品新增结束  -->
	<!--隐藏框 新增杂工开始  -->
	<div id="addDictDivType" style="display: none;">
		<div class=" col-xs-12  col-sm-12  col-md-12 ">
			<div class="space-10"></div>
			<div style="height: 30px"></div>
			<form class="form-horizontal addDictDivTypeForm">
				<div class="row col-xs-12  col-sm-12  col-md-12 ">
					<div class="form-group">
						<label class="col-sm-3 control-label">日期:</label>
						<div class="col-sm-6">
							<input id="Time" placeholder="时间可不填"
								class="form-control laydate-icon"
								onClick="laydate({elem: '#Time', istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
						</div>
					</div>

					<div class="form-group">

						<label class="col-sm-3 control-label">批次名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control bacth">
						</div>
					</div>
					<div class="form-group">

						<label class="col-sm-3 control-label">工序名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control sumnumber">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">现场管理时间</label>
						<div class="col-sm-6 ">
							<input type="text" class="form-control timedata">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">加绩工序选择</label>
						<div class="col-sm-6 working"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">完成人</label>
						<div class="col-sm-6 completetw">
							<input type="text" class="form-control">
						</div>
						<div class="col-sm-2 selecttw"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">备注</label>
						<div class="col-sm-6">
							<input type="text" class="form-control remarks">
						</div>
					</div>
				</div>
		</div>

		</form>
	</div>
	</div>
	<!--隐藏框 新增结束  -->
	<!--隐藏框 工序加绩分配开始  -->
	<div id="addDictDivTypetw" style="display: none;">
		<div class=" col-xs-12  col-sm-12  col-md-12 ">
			<div class="space-10"></div>
			<div style="height: 30px"></div>
			<form class="form-horizontal addDictDivTypeFormtw">
				<div class="row col-xs-12  col-sm-12  col-md-12" id="type"></div>
				<div class="form-group">

					<label class="col-sm-1 control-label" style="width: 17.1%;">完成人:</label>
					<div class="col-sm-2 complete">
						<input type="text" class="form-control">
					</div>
					<div class="col-sm-2 select"></div>
				</div>
		</div>

		</form>
	</div>
	</div>
	<!--隐藏框 工序加绩分配结束  -->
	<!--隐藏框 查看加价开始  -->
	<div id="savegrouptw" style="display: none;">
		<div class="modal fade" id="myModaltw" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">查看加价</h4>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
	<!--隐藏框 查看加价结束  -->
	</section>



	<script>
   jQuery(function($){
   	var Login = function(){
			var self = this;
			//表单jsonArray
			//初始化js
			var _cache;
			this.setCache = function(cache){
		  		_cache=cache;
		  	}
		  	this.getCache = function(){
		  		return _cache;
		  	}
		  	this.getCount = function(){
		  		return _count;
		  	}
		  	this.setCount = function(count){
		  		_count=count;
		  	}
			 var data={
						page:1,
				  		size:13,	
				  		type:2,

				} 
			this.init = function(){
				
				//注册绑定事件
				self.events();
				self.loadPagination(data);
			}
			//加载分页
			  this.loadPagination = function(data){
			    var index;
			    var html = '';
			    $.ajax({
				      url:"${ctx}/farragoTask/allFarragoTask",
				      data:data,
				      type:"GET",
				      beforeSend:function(){
					 	  index = layer.load(1, {
						  shade: [0.1,'#fff'] //0.1透明度的白色背景
						  });
					  }, 
		      		  success: function (result) {
		      			$("#totaltw").text(result.data.statData.stateCount)
		      			  $("#totale").text(result.data.statData.statAmount)
		      			 $(result.data.rows).each(function(i,o){
		      				html +='<tr><td class="center reste"><label> <input type="checkbox" class="ace checkboxId" data-procedurename="'+o.name+'" value="'+o.id+'"/><span class="lbl"></span></label></td>'
		      				+'<td class="text-center edit name">'+o.bacth+'</td>'
		      				+'<td class="text-center edit name">'+o.allotTime+'</td>'
		      				+'<td class="text-center edit name">'+o.name+'</td>'
		      				+'<td class="text-center edit name">'+o.time+'</td>'
		      				+'<td class="text-center edit name">'+o.remarks+'</td>'
		      				+'<td class="text-center edit name">'+parseFloat((o.price).toFixed(3))+'</td>'
		      				+'<td class="text-center edit name">'+parseFloat((o.payB).toFixed(3))+'</td>'
		      				+'<td class="text-center "><button class="btn btn-primary btn-trans btn-sm savemodePerformance" data-toggle="modal" data-target="#myModaltw" data-id="'+o.id+'")">查看加价</button></td>'
		      				+'<td class="text-center edit name">'+parseFloat((o.performancePrice).toFixed(3))+'</td>'
		      				+'<td class="text-center"><button class="btn btn-primary btn-trans btn-sm savemode" data-toggle="modal" data-target="#myModal" data-id="'+o.id+'")">查看人员</button></td>'
							+'<td class="text-center"><button class="btn btn-sm btn-danger btn-trans delete" data-id='+o.id+'>删除</button></td></tr>'
							
		      			}); 
		      			self.setCount(result.data.pageNum)
				        //显示分页
					   	 laypage({
					      cont: 'pager', 
					      pages: result.data.totalPages, 
					      curr:  result.data.pageNum || 1, 
					      jump: function(obj, first){ 
					    	  if(!first){ 
					    		 
						        	var _data = {
						        			page:obj.curr,
									  		size:13,
									  		type:2,
									  		name:$('#name').val(),
								  			bacth:$('#number').val(),
								  			orderTimeBegin:$("#startTime").val(),
								  			orderTimeEnd:$("#endTime").val(), 
								  	}
						        
						            self.loadPagination(_data);
							     }
					      }
					    });  
					   	layer.close(index);
					   	 $("#tablecontent").html(html); 
					   	self.loadEvents();
					   
				      },error:function(){
							layer.msg("加载失败！", {icon: 2});
							layer.close(index);
					  }
				  });
			}
			
			this.loadEvents = function(){
				//删除方法
				$('.delete').on('click',function(){
					var postData = {
							id:$(this).data('id'),
					}
					
					var index;
					 index = layer.confirm('确定删除吗', {btn: ['确定', '取消']},function(){
					$.ajax({
						url:"${ctx}/farragoTask/delete",
						data:postData,
						type:"GET",
						beforeSend:function(){
							index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								});
						},
						
						success:function(result){
							if(0==result.code){
							layer.msg("删除成功！", {icon: 1});
							var _data = {
				        			page:self.getCount(),
							  		size:13,
							  		type:2,
							  		name:$('#name').val(),
						  			bacth:$('#number').val(),
						  			orderTimeBegin:$("#startTime").val(),
						  			orderTimeEnd:$("#endTime").val(), 
						  	}
							self.loadPagination(data)
							layer.close(index);
							}else{
								layer.msg("删除失败！", {icon: 1});
								layer.close(index);
							}
						},error:function(){
							layer.msg("操作失败！", {icon: 2});
							layer.close(index);
						}
					});
					 })
				})
				
				//人员详细显示方法
				$('.savemode').on('click',function(){
					var id=$(this).data('id')
					 var display =$("#savegroup").css("display")
					 if(display=='none'){
							$("#savegroup").css("display","block");  
						}
					var postData={
							id:id,
					}
					 var arr=new Array();
					var html="";
					$.ajax({
						url:"${ctx}/farragoTask/taskUser",
						data:postData,
						type:"GET",
						beforeSend:function(){
							index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								});
						},
						
						success:function(result){
							$(result.data).each(function(i,o){
							html+=o.userName+"&nbsp&nbsp&nbsp&nbsp"
							})
							$('.modal-body').html(html);
							layer.close(index);
							
						},error:function(){
							layer.msg("操作失败！", {icon: 2});
							layer.close(index);
						}
					});
					
					
					
				})
				//查看加价
				$('.savemodePerformance').on('click',function(){
					var id=$(this).data('id')
					 var display =$("#savegrouptw").css("display")
					 if(display=='none'){
							$("#savegrouptw").css("display","block");  
						}
					 var postData={
							id:id,
					}
					 var arr=new Array();
					var html="";
					$.ajax({
						url:"${ctx}/farragoTask/getUserPerformance",
						data:postData,
						type:"GET",
						beforeSend:function(){
							index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								});
						},
						
						success:function(result){
							$(result.data).each(function(i,o){
							html+=o.performance+":"+o.username+"&nbsp&nbsp&nbsp&nbsp"
							})
							$('.modal-body').html(html);
							layer.close(index);
							
						},error:function(){
							layer.msg("操作失败！", {icon: 2});
							layer.close(index);
						}
					}); 
					
					
					
				})
				
			}
			this.events = function(){
				
				$('.searchtask').on('click',function(){
					var data = {
				  			page:1,
				  			size:13,
				  			type:2,
				  			name:$('#name').val(),
				  			bacth:$('#number').val(),
				  			orderTimeBegin:$("#startTime").val(),
				  			orderTimeEnd:$("#endTime").val(), 
				  	}
		            self.loadPagination(data);
				});
				//加绩
				$('.addDict').on('click',function(){
					var  thae=$(".table-hover");
					var arr=""//员工id
					var arrytw=new Array()
					var tasksId=new Array()
					var CheckCount=0;
					var productName;
					  thae.parent().parent().parent().parent().parent().find(".checkboxId:checked").each(function() {  
						  CheckCount++;
						  arr=$(this).val();  
						  tasksId.push($(this).val());  
						  arrytw.push($(this).data('procedurename'));
						  productName=$(this).data('procedurename');
						});
					 /*  if(CheckCount>1){
							return layer.msg("只能选择一条任务", {icon: 2});
						} */
					if(arr==""){
						return layer.msg("请选择一条任务", {icon: 2});
					}
					var that=$(this)
					var productName=$(this).data('proname')
					var _index
					var index
					var postData
					//工序遍历  
				    var indextwo;
				    
				    var htmlth = '';
				    var htmlfr = '';
					//遍历人名组别
			      			  $('.complete').html("<select class='form-control selectcomplete'><option value="+0+">请选择</option><option value="+""+">全部</option></select>")
							//改变事件
			      			 $(".selectcomplete").change(function(){
			      				var htmltwo = "";
			      				var	id=$(this).val()
								   var data={
										  id:arr,
								   }
			      				$.ajax({
									url:"${ctx}/farragoTask/taskUser",
									data:data,
									type:"GET",
									beforeSend:function(){
										index = layer.load(1, {
											  shade: [0.1,'#fff'] //0.1透明度的白色背景
											});
									},
									
									success:function(result){
										$(result.data).each(function(i,o){
											htmltwo +='<div class="input-group"><input type="checkbox" class="stuCheckBoxee" value="'+o.id+'" data-username="'+o.userName+'">'+o.userName+'</input></div>'
										})
										var s="<div class='input-group'><input type='checkbox' class='checkallee'>全选</input></div>"
										$('.select').html(s+htmltwo)
										$(".checkallee").on('click',function(){
							                    if($(this).is(':checked')){ 
										 			$('.stuCheckBoxee').each(function(){  
							                    //此处如果用attr，会出现第三次失效的情况  
							                     		$(this).prop("checked",true);
										 			})
							                    }else{
							                    	$('.stuCheckBoxee').each(function(){ 
							                    		$(this).prop("checked",false);
							                    		
							                    	})
							                    }
							                });
										layer.close(index);
									},error:function(){
										layer.msg("操作失败！", {icon: 2});
										layer.close(index);
									}
								});
							 }) 
					//遍历杂工加绩比值
					var html=""
					$.ajax({
						url:"${ctx}/farragoTask/farragoTaskPerformance",
						type:"GET",
						beforeSend:function(){
							index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								});
						},
						
						success:function(result){
							$(result.data).each(function(i,o){
							html+='<option value="'+o.number+'" data-name="'+o.name+'">'+o.name+'</option>'
							})
						var htm=""
						for (var i = 0; i < arrytw.length; i++) {
						var array_element = arrytw[i];
						htm+="<label class='col-sm-2 control-label'>工序:</label><div class='col-sm-3 type'><input type='text' disabled='disabled' class='form-control' value="+array_element+"></div><div class='form-group'><label class='col-sm-2 control-label'>加绩工序:</label><div class='col-sm-3 workingtw'><select class='form-control selectchangtw'><option value='0'></option>"+html+"</select></div>"
						+"</div>"
						$('#type').html(htm)
						}
							layer.close(index);
							
						},error:function(){
							layer.msg("操作失败！", {icon: 2});
							layer.close(index);
						}
					});
				    
					var postData
					var dicDiv=$('#addDictDivTypetw');
					_index = layer.open({
						  type: 1,
						  skin: 'layui-layer-rim', //加上边框
						  area: ['60%', '400px'], 
						  btnAlign: 'c',//宽高
						  maxmin: true,
						  offset:(parent.document.documentElement.scrollTop+100)+'px',
						  title:productName,
						  content: dicDiv,
						  btn: ['确定', '取消'],
						  yes:function(index, layero){
							  var arry=new Array()
								$(".stuCheckBoxee:checked").each(function() {   
								    arry.push($(this).val());   
								}); 
								if(arr.length<=0){
									return layer.msg("至少选择一个员工！", {icon: 2});
								}
								var performanceNumber=new Array()
								var performance=new Array()
								$(".selectchangtw option:selected").each(function() {
									performanceNumber.push($(this).val());
									performance.push($(this).text());
								})
								var postData = {
										taskIds:tasksId,
										ids:arry,
										performanceNumber:performanceNumber,
										performance:performance,
										update:0,
								}
							    $.ajax({
									url:"${ctx}/farragoTask/giveTaskPerformance",
									data:postData,
						            traditional: true,
									type:"post",
									beforeSend:function(){
										index = layer.load(1, {
											  shade: [0.1,'#fff'] //0.1透明度的白色背景
											});
									},
									
									success:function(result){
										if(0==result.code){
										  $('.addDictDivTypeFormtw')[0].reset(); 
											layer.msg("添加成功！", {icon: 1});
										}else{
											layer.msg("添加失败", {icon: 2});
										}
										layer.close(index);
									},error:function(){
										layer.msg("操作失败！", {icon: 2});
										layer.close(index);
									}
								});  
							},
						   end:function(){
							  $('.addDictDivTypeFormtw')[0].reset(); 
							  $("#addDictDivTypetw").hide();
							  $('.select').text("");
							  var date={
										page:self.getCount(),
								  		size:13,	
								  		type:2,
								  		name:$('#name').val(),
							  			bacth:$('#number').val(),
							  			orderTimeBegin:$("#startTime").val(),
							  			orderTimeEnd:$("#endTime").val(), 
								} 
							   self.loadPagination(date);
							
						  } 
					});
				})
				//修改
				$('.updatetw').on('click',function(){
					var  thae=$(".table-hover");
					var arr=""//员工id
					var arrytw=new Array()
					var tasksId=new Array()
					var CheckCount=0;
					var productName;
					  thae.parent().parent().parent().parent().parent().find(".checkboxId:checked").each(function() {  
						  CheckCount++;
						  arr=$(this).val();  
						  tasksId.push($(this).val());  
						  arrytw.push($(this).data('procedurename'));
						  productName=$(this).data('procedurename');
						});
					 /*  if(CheckCount>1){
							return layer.msg("只能选择一条任务", {icon: 2});
						} */
					if(arr==""){
						return layer.msg("请选择一条任务", {icon: 2});
					}
					var that=$(this)
					var _index
					var index
					var postData
					//工序遍历  
				    var indextwo;
				    
				    var htmlth = '';
				    var htmlfr = '';
					//遍历人名组别
			      			  $('.complete').html("<select class='form-control selectcomplete'><option value="+0+">请选择</option><option value="+""+">全部</option></select>")
							//改变事件
			      			 $(".selectcomplete").change(function(){
			      				var htmltwo = "";
			      				var	id=$(this).val()
								   var data={
										  id:arr,
								   }
			      				$.ajax({
									url:"${ctx}/farragoTask/taskUser",
									data:data,
									type:"GET",
									beforeSend:function(){
										index = layer.load(1, {
											  shade: [0.1,'#fff'] //0.1透明度的白色背景
											});
									},
									
									success:function(result){
										$(result.data).each(function(i,o){
											htmltwo +='<div class="input-group"><input type="checkbox" class="stuCheckBox" value="'+o.id+'" data-username="'+o.userName+'">'+o.userName+'</input></div>'
										})
										var s="<div class='input-group'><input type='checkbox' class='checkall'>全选</input></div>"
										$('.select').html(s+htmltwo)
										$(".checkall").on('click',function(){
							                    if($(this).is(':checked')){ 
										 			$('.stuCheckBox').each(function(){  
							                    //此处如果用attr，会出现第三次失效的情况  
							                     		$(this).prop("checked",true);
										 			})
							                    }else{
							                    	$('.stuCheckBox').each(function(){ 
							                    		$(this).prop("checked",false);
							                    		
							                    	})
							                    }
							                });
										layer.close(index);
									},error:function(){
										layer.msg("操作失败！", {icon: 2});
										layer.close(index);
									}
								});
							 }) 
					//遍历杂工加绩比值
					var html=""
					$.ajax({
						url:"${ctx}/farragoTask/farragoTaskPerformance",
						type:"GET",
						beforeSend:function(){
							index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								});
						},
						
						success:function(result){
							$(result.data).each(function(i,o){
							html+='<option value="'+o.number+'" data-name="'+o.name+'">'+o.name+'</option>'
							})
						var htm=""
						for (var i = 0; i < arrytw.length; i++) {
						var array_element = arrytw[i];
						htm+="<label class='col-sm-2 control-label'>工序:</label><div class='col-sm-3 type'><input type='text' disabled='disabled' class='form-control' value="+array_element+"></div><div class='form-group'><label class='col-sm-2 control-label'>加绩工序:</label><div class='col-sm-3 workingtw'><select class='form-control selectchangtw'><option value='0'></option>"+html+"</select></div>"
						+"</div>"
						$('#type').html(htm)
						}
							layer.close(index);
							
						},error:function(){
							layer.msg("操作失败！", {icon: 2});
							layer.close(index);
						}
					});
				    
					var postData
					var dicDiv=$('#addDictDivTypetw');
					_index = layer.open({
						  type: 1,
						  skin: 'layui-layer-rim', //加上边框
						  area: ['60%', '400px'], 
						  btnAlign: 'c',//宽高
						  maxmin: true,
						  offset:(parent.document.documentElement.scrollTop+100)+'px',
						  title:productName,
						  content: dicDiv,
						  btn: ['确定', '取消'],
						  yes:function(index, layero){
							  var arry=new Array()
								$(".stuCheckBox:checked").each(function() {   
								    arry.push($(this).val());   
								}); 
								if(arr.length<=0){
									return layer.msg("至少选择一个员工！", {icon: 2});
								}
								var performanceNumber=new Array()
								var performance=new Array()
								$(".selectchangtw option:selected").each(function() {
									performanceNumber.push($(this).val());
									performance.push($(this).text());
								})
								var postData = {
										taskIds:tasksId,
										ids:arry,
										performanceNumber:performanceNumber,
										performance:performance,
										update:1,
								}
							    $.ajax({
									url:"${ctx}/farragoTask/giveTaskPerformance",
									data:postData,
						            traditional: true,
									type:"post",
									beforeSend:function(){
										index = layer.load(1, {
											  shade: [0.1,'#fff'] //0.1透明度的白色背景
											});
									},
									
									success:function(result){
										if(0==result.code){
										  $('.addDictDivTypeFormtw')[0].reset(); 
											layer.msg("添加成功！", {icon: 1});
										}else{
											layer.msg("添加失败", {icon: 2});
										}
										layer.close(index);
									},error:function(){
										layer.msg("操作失败！", {icon: 2});
										layer.close(index);
									}
								});  
							},
						   end:function(){
							  $('.addDictDivTypeFormtw')[0].reset(); 
							  $("#addDictDivTypetw").hide();
							  $('.select').text("");
							  var date={
										page:self.getCount(),
								  		size:13,	
								  		type:2,
								  		name:$('#name').val(),
							  			bacth:$('#number').val(),
							  			orderTimeBegin:$("#startTime").val(),
							  			orderTimeEnd:$("#endTime").val(), 
								} 
							   self.loadPagination(date);
							
						  } 
					});
					
					
				})
				//新增杂工
				$('#addgroup').on('click',function(){
					var _index
					var index
					var postData
					var dicDiv=$('#addDictDivType');
					var html=""
					var htmlth=""
					var data={
							type:2
					}
					
					//遍历人名组别
				    $.ajax({
					      url:"${ctx}/production/getGroup",
					      data:data,
					      type:"GET",
			      		  success: function (result) {
			      			  $(result.data).each(function(k,j){
			      				htmlth +='<option value="'+j.id+'">'+j.name+'</option>'
			      			  });  
			      			 $('.completetw').html("<select class='form-control selectcompletee'><option value="+0+">请选择</option><option value="+""+">全部</option>"+htmlth+"</select>") 
							//改变事件
			      			 $(".selectcompletee").change(function(){
			      				var htmltwo = "";
			      				var	id=$(this).val()
								   var data={
			      							type:2,
										 	id:id,
										 	temporarilyDate:$('#Time').val(),
								   }
			      				$.ajax({
									url:"${ctx}/production/allGroup",
									data:data,
									type:"GET",
									beforeSend:function(){
										index = layer.load(1, {
											  shade: [0.1,'#fff'] //0.1透明度的白色背景
											});
									},
									
									success:function(result){
										$(result.data).each(function(i,o){
										
										$(o.users).each(function(i,o){
											htmltwo +='<div class="input-group"><input type="checkbox" class="stuCheckBoxtt" value="'+o.id+'" data-username="'+o.userName+'">'+o.userName+'</input></div>'
										})
										})
										var s="<div class='input-group'><input type='checkbox' class='checkalltt'>全选</input></div>"
										$('.selecttw').html(s+htmltwo)
										$(".checkalltt").on('click',function(){
							                    if($(this).is(':checked')){ 
										 			$('.stuCheckBoxtt').each(function(){  
							                    //此处如果用attr，会出现第三次失效的情况  
							                     		$(this).prop("checked",true);
										 			})
							                    }else{
							                    	$('.stuCheckBoxtt').each(function(){ 
							                    		$(this).prop("checked",false);
							                    		
							                    	})
							                    }
							                });
										layer.close(index);
									},error:function(){
										layer.msg("操作失败！", {icon: 2});
										layer.close(index);
									}
								});
							 }) 
					      }
					  });
					//遍历杂工加绩比值
					$.ajax({
						url:"${ctx}/farragoTask/farragoTaskPerformance",
						type:"GET",
						beforeSend:function(){
							index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								});
						},
						
						success:function(result){
							$(result.data).each(function(i,o){
							html+='<option value="'+o.number+'" data-name="'+o.name+'">'+o.name+'</option>'
							})
							$('.working').html("<select class='form-control selectchang'><option value='0'>请选择</option>"+html+"</select>");
							layer.close(index);
							
						},error:function(){
							layer.msg("操作失败！", {icon: 2});
							layer.close(index);
						}
					});
					
					_index = layer.open({
						  type: 1,
						  skin: 'layui-layer-rim', //加上边框
						  area: ['50%', '530px'], 
						  btnAlign: 'c',//宽高
						  maxmin: true,
						  title:"新增杂工",
						  offset:'30px',
						  content: dicDiv,
						  btn: ['确定', '取消'],
						  yes:function(index, layero){
							  var performanceNumber=$(".selectchang").val();
							  var performance=$(".selectchang option:selected").text();
							 if(performance=="请选择"){
								 performance="";
							 }
							  var arr=new Array()
							  console.log($(".stuCheckBoxtt:checked").each(function() {}))
								$(".stuCheckBoxtt:checked").each(function() {   
								    arr.push($(this).val());   
								    console.log($(this).val())
								});
							  if(arr.length<=0){
								 return layer.msg("领取人不能为空", {icon:2 });
							  }
							  if($(".sumnumber").val()==""){
									 return layer.msg("工序不能为空", {icon:2 });
								  }
							  if($(".bacth").val()==""){
									 return layer.msg("批次号不能为空", {icon:2 });
								  }
							  postData={
									  allotTime:$("#Time").val(),
									  name:$(".sumnumber").val(),
									  time:$(".timedata").val(),
									  remarks:$(".remarks").val(),
									  performance:performance,
									  performanceNumber:performanceNumber,
									  userIds:arr,
									  bacth:$(".bacth").val(),
									  type:2,
							  }
							  $.ajax({
									url:"${ctx}/farragoTask/addFarragoTask",
									data:postData,
						            traditional: true,
									type:"post",
									beforeSend:function(){
										index = layer.load(1, {
											  shade: [0.1,'#fff'] //0.1透明度的白色背景
											});
									},
									
									success:function(result){
										if(0==result.code){
										layer.msg("添加成功！", {icon: 1});
										 self.loadPagination(data); 
										 layer.close(_index);
										 $('.addDictDivTypeForm')[0].reset();
											
										}else{
											layer.msg("添加失败", {icon: 2});
										}
										
										layer.close(index);
									},error:function(){
										layer.msg("操作失败！", {icon: 2});
										layer.close(index);
									}
								});
							},
						  end:function(){
							  $('#addDictDivType').hide();
						
							  $('.addDictDivTypeForm')[0].reset(); 
							
						  }
					});
				})
			}
   	}
   			var login = new Login();
				login.init();
			})
    
    </script>

</body>
</html>