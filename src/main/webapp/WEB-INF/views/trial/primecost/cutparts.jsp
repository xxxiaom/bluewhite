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
<title>裁片</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />


</head>

<body>
	<section id="main-wrapper" class="theme-default">

		<%@include file="../../decorator/leftbar.jsp"%>

		<!--main content start-->

		<section id="main-content" class="animated fadeInUp">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">裁片填写页面</h3>
							<div class="actions pull-right">
								<i class="fa fa-expand"></i> <i class="fa fa-chevron-down"></i>
							</div>
						</div>
						<div class="row" style="height: 30px; margin: 15px 0 10px">
							<div class="col-xs-11 col-sm-11  col-md-11">
								<form class="form-search">
									<div class="row">
										<div class="col-xs-11 col-sm-11 col-md-11">
											<div class="input-group">
												<table>
													<tr>
														<td>产品名:</td>
														<td><input type="text" name="name" id="productName"
															placeholder="请输入产品名称"
															class="form-control search-query name"
															data-provide="typeahead" autocomplete="off"/ ></td>
														<td>&nbsp&nbsp</td>
														<td>默认数量:</td>
														<td><input type="text" name="number" id="number"
															disabled="disabled" placeholder="请输入默认数量"
															class="form-control search-query number" /></td>
														<td>&nbsp&nbsp</td>
														<td>默认耗损:</td>
														<td><input type="text" name="name" id="loss"
															placeholder="请输入产品名称"
															class="form-control search-query name" /></td>
														<td>&nbsp&nbsp</td>
														<td>裁剪价格:</td>
														<td><input type="text" name="name" id="ntwo"
															disabled="disabled"
															class="form-control search-query name" /></td>
													</tr>
												</table>
												<span class="input-group-btn">
													<button type="button"
														class="btn btn-info btn-square btn-sm btn-3d searchtask">
														查&nbsp找</button>
												</span>
												<td>&nbsp&nbsp&nbsp&nbsp</td> <span class="input-group-btn">
													<button type="button" id="save"
														class="btn btn-success  btn-sm btn-3d">保存</button>
												</span>
												<td>&nbsp&nbsp&nbsp&nbsp</td> <span class="input-group-btn">
													<button type="button" id="addCutting"
														class="btn btn-success  btn-sm btn-3d export">新增
													</button>
												</span>
												<td>&nbsp&nbsp&nbsp&nbsp</td> <span class="input-group-btn">
													<button type="button"
														class="btn btn-danger  btn-sm btn-3d start">一键删除
													</button>
												</span>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="center"><label> <input type="checkbox"
												class="ace checks" /> <span class="lbl"></span>
										</label></th>
										<th class="text-center">裁片名</th>
										<th class="text-center">片数</th>
										<th class="text-center">单片周长</th>
										<th class="text-center">片数周长</th>
										<th class="text-center">编号</th>
										<th class="text-center">名称</th>
										<th class="text-center">是否复合</th>
										<th class="text-center">单片用料</th>
										<th class="text-center">单位</th>
										<th class="text-center">全套比用料</th>
										<th class="text-center">单只用料</th>
										<th class="text-center">耗损</th>
										<th class="text-center">产品单价</th>
										<th class="text-center">产品单位</th>
										<th class="text-center">单片用料</th>
										<th class="text-center">单片价格</th>
										<th class="text-center">复物料编号</th>
										<th class="text-center">复物料名</th>
										<th class="text-center">是否对复</th>
										<th class="text-center">复物单价</th>
										<th class="text-center">复物备注</th>
										<th class="text-center">复物料耗损</th>
										<th class="text-center">复物用料</th>
										<th class="text-center">复单片价格</th>
										<th class="text-center">复加工费</th>
										<th class="text-center">压货环节</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody id="tablecontent">

								</tbody>
								<thead>
									<tr>
										<td class="center">合计</td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center" id="total2"></td>
										<td class="text-center" id="total"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center" id="totaltw"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
										<td class="text-center"></td>
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
				</div>
			</div>
		</section>
	</section>
	<!--隐藏框 产品新增开始  -->
	<div id="addDictDivType" style="display: none;">
		<div class=" col-xs-12  col-sm-12  col-md-12 ">
			<div class="space-10"></div>
			<div style="height: 30px"></div>
			<form class="form-horizontal addDictDivTypeForm">
				<div class="form-group">
					<label class="col-sm-3 control-label">名称:</label>
					<div class="col-sm-6">
						<input type="text" id="groupName" class="form-control">
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--隐藏框 产品新增结束  -->



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
	</section>



	<script src="${ctx }/static/js/vendor/jquery-3.3.1.min.js"></script>
	<script src="${ctx }/static/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${ctx }/static/plugins/navgoco/jquery.navgoco.min.js"></script>
	<script src="${ctx }/static/plugins/switchery/switchery.min.js"></script>
	<script src="${ctx }/static/plugins/pace/pace.min.js"></script>
	<script
		src="${ctx }/static/plugins/fullscreen/jquery.fullscreen-min.js"></script>
	<script src="${ctx }/static/js/src/app.js"></script>
	<script src="${ctx }/static/js/laypage/laypage.js"></script>
	<script src="${ctx }/static/plugins/dataTables/js/jquery.dataTables.js"></script>
	<script
		src="${ctx }/static/plugins/dataTables/js/dataTables.bootstrap.js"></script>
	<script src="${ctx }/static/js/vendor/typeahead.js"></script>
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
		  	this.getNum = function(){
		  		return _num;
		  	}
		  	this.setNum = function(num){
		  		_num=num;
		  	}
		  	var productIdAll="${productId}";
		  	var productNameAll="${productNamexx}";
		  	var productNumberAll="${productNumberxx}";
		  	self.setCache(productIdAll)
		  	$("#productName").val(productNameAll);
		  	$("#number").val(productNumberAll);
			 var data={
						page:1,
				  		size:100,	
				  		productId:productIdAll,
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
				      url:"${ctx}/product/getCutParts",
				      data:data,
				      type:"GET",
				      beforeSend:function(){
					 	  index = layer.load(1, {
						  shade: [0.1,'#fff'] //0.1透明度的白色背景
						  });
					  }, 
		      		  success: function (result) {
		      			  if(result.data.rows!=null && result.data.rows!=""){
		      			$("#ntwo").val(result.data.rows[0].oneCutPartsPrice)
		      			$("#total2").text(result.data.statData.perimeter)
		      			$("#total").text(result.data.statData.allPerimeter)
		      			$("#totaltw").text(result.data.statData.addMaterial)
		      			  }
		      			 $(result.data.rows).each(function(i,o){
		      				 
		      			 		var a="";
		      				 if(o.composite==1){
		      					 a="复合"
		      				 }
		      				var b="";
		      				 if(o.doubleComposite==1){
		      					 b="面料对复合"
		      				 }
		      				 
		      				html +='<tr><td class="center reste"><label> <input type="checkbox" class="ace checkboxId" value="'+o.id+'"/><span class="lbl"></span></label></td>'
		      				/* +'<td  style="padding: 2px 0px 2px 4px;"><input type="text" style="border: none;width:68px; height:30px; background-color: #BFBFBF;" data-provide="typeahead" autocomplete="off" class="text-center  cuttingName" value="'+o.cutPartsName+'" /></td>' */
		      				+'<td class="text-center edit cutPartsNametw" >'+o.cutPartsName+'</td>'
		      				+'<td class="text-center editt cutPartsNumbertw" >'+o.cutPartsNumber+'</td>'
		      				+'<td class="text-center  perimetertw" >'+o.perimeter+'</td>'
		      				+'<td class="text-center" >'+o.allPerimeter+'</td>'
		      				+'<td class="text-center materielNumbertw" >'+o.materielNumber+'</td>'
		      				+'<td class="text-center editmaterielName name" >'+o.materielName+'</td>'
		      				+'<td class="text-center edit name materielIds hidden">'+o.materielId+'</td>'
		      				+'<td class="text-center composite name" >'+a+'</td>'
		      				+'<td class="text-center oneMaterial name" >'+o.oneMaterial+'</td>'
		      				+'<td class="text-center unite name" >'+o.unit+'</td>'
		      				+'<td class="text-center  name" style="background:yellow">'+parseFloat((o.scaleMaterial).toFixed(3))+'</td>'
		      				+'<td class="text-center  name" style="background:yellow">'+o.addMaterial+'</td>'
		      				+'<td class="text-center manualLoss name" style="background:yellow">'+o.manualLoss+'</td>'
		      				+'<td class="text-center  unitPrice productCost" style="background:yellow">'+parseFloat((o.productCost).toFixed(3))+'</td>'
		      				+'<td class="text-center  unit productRemark" >'+o.productRemark+'</td>'
		      				+'<td class="text-center  name" >'+parseFloat((o.batchMaterial).toFixed(3))+'</td>'
		      				+'<td class="text-center  name" >'+parseFloat((o.batchMaterialPrice).toFixed(3))+'</td>'
		      				+'<td class="text-center  name complexMaterielNumbertw" >'+o.complexMaterielNumber+'</td>'
		      				+'<td class="text-center complexMaterielName name" >'+o.complexMaterielName+'</td>'
		      				+'<td class="text-center doubleComposite name" >'+b+'</td>'
		      				+'<td class="text-center  unitPricetw complexProductCost" >'+parseFloat((o.complexProductCost*1).toFixed(3))+'</td>'
		      				+'<td class="text-center  unittw complexProductRemark" >'+o.complexProductRemark+'</td>'
		      				+'<td class="text-center compositeManualLosstw name" >'+o.compositeManualLoss*1+'</td>'
		      				+'<td class="text-center  name" >'+parseFloat((o.complexBatchMaterial*1).toFixed(3))+'</td>'
		      				+'<td class="text-center  name" >'+parseFloat((o.batchComplexMaterialPrice*1).toFixed(3))+'</td>'
		      				+'<td class="text-center  name" >'+parseFloat((o.batchComplexAddPrice*1).toFixed(3))+'</td>'
		      				+'<td class="text-center  name helpWork" data-overstockid='+o.overstockId+'  data-id='+o.id+' data-productid='+o.productId+'></td>'
							+'<td class="text-center "><button class="btn btn-sm btn-info  btn-trans update" data-id='+o.id+' data-composite='+o.composite+' data-unit='+o.unitId+' data-doublecomposite='+o.doubleComposite+'>编辑</button></td></tr>'
							
		      			}); 
		      			self.setCount(result.data.pageNum)
				        //显示分页
					   	layer.close(index);
					   	 $("#tablecontent").html(html); 
					   	self.loadEvents();
					   self.checkedd();
				      },error:function(){
							layer.msg("加载失败！", {icon: 2});
							layer.close(index);
					  }
				  });
			}
			  this.checkedd=function(){
					
					$(".checks").on('click',function(){
						
	                    if($(this).is(':checked')){ 
				 			$('.checkboxId').each(function(){  
	                    //此处如果用attr，会出现第三次失效的情况  
	                     		$(this).prop("checked",true);
				 			})
	                    }else{
	                    	$('.checkboxId').each(function(){ 
	                    		$(this).prop("checked",false);
	                    		
	                    	})
	                    }
	                }); 
					
				}
			this.loadEvents = function(){
				
				//压货环节
				var data6 = {
							type:"overstock",
						}
						var index;
						var html6 = '';
						var htmlto6= '';
						$.ajax({
						url:"${ctx}/product/getBaseOne",
						data:data6,
						type:"GET",
						success: function (result) {
						$(result.data).each(function(i,o){
							html6 +='<option value="'+o.id+'">'+o.name+'</option>'
							}); 
							htmlto6='<select class="text-center form-control selecttailorType8" ><option value="">请选择</option>'+html6+'</select>'
							 $(".helpWork").html(htmlto6)
							 
							 $(".selecttailorType8").each(function(i,o){
								var id=	$(o).parent().data("overstockid");
								$(o).val(id)
							})
									$(".selecttailorType8").change(function(i,o){
									      				var that=$(this);
									      				var overstockId=that.parent().parent().find(".selecttailorType8").val();
									      				var name=that.parent().parent().find(".selecttailorType8 option:selected").text();
									      				var dataeee={
									      						 id:that.parent().data('id'),
																 productId:that.parent().data('productid'),
																 overstockId:overstockId,
																 overstock:name,
									      				}
									      				var index;
									      				 $.ajax({
														      url:"${ctx}/product/updateCutParts",
														      data:dataeee,
														      type:"POST",
														      beforeSend:function(){
																	index = layer.load(1, {
																		  shade: [0.1,'#fff'] //0.1透明度的白色背景
																		});
																},
																success:function(result){
																	if(0==result.code){
																	$(result.data).each(function(i,o){
														      			 }); 
																	layer.close(index);
																	}else{
																		layer.msg(result.message, {icon: 2});
																		layer.close(index);
																	}
																},error:function(){
																	layer.msg("加载失败！", {icon: 2});
																	layer.close(index);sa
															  }
														  }); 
													})
									      		  },error:function(){
														layer.msg("加载失败！", {icon: 2});
														layer.close(index);
												  }
											  });
				
				
				
				//修改方法
				//选择单位
				var data = {
					type:"unit",
				}
				var index;
			    var html = '';
			    var htmlto= '';
			    $.ajax({
				      url:"${ctx}/product/getBaseOne",
				      data:data,
				      type:"GET",
				     
		      		  success: function (result) {
		      			 $(result.data).each(function(i,o){
		      				html +='<option value="'+o.id+'">'+o.name+'</option>'
		      			}); 
				       htmlto='<select class="text-center selectunit"  style="border: none;width:50px; height:30px; background-color: #BFBFBF;text-align-last: center"><option value=""></option>'+html+'</select>'
		      		  },error:function(){
							layer.msg("加载失败！", {icon: 2});
							layer.close(index);sa
					  }
				  });
			    
				$('.update').on('click',function(){
					var aa=$(this).data("composite")
					var cc=$(this).data("unit")
					var dd=$(this).data("doublecomposite")
					if($(this).text() == "编辑"){
						$(this).text("保存")
						
						$(this).parent().siblings(".edit").each(function() {  // 获取当前行的其他单元格

				            $(this).html("<input class='input-mini text-center cuttingName' style='border: none;width:68px; height:30px; background-color: #BFBFBF;'  type='text' value='"+$(this).text()+"'>");
				        })
						$(this).parent().siblings(".editt").each(function() {  // 获取当前行的其他单元格

				            $(this).html("<input class='input-mini text-center' style='border: none;width:40px; height:30px; background-color: #BFBFBF;'  type='text' value='"+$(this).text()+"'>");
				        })
				        $(this).parent().siblings(".perimetertw").each(function() {  // 获取当前行的其他单元格

				            $(this).html("<input class='input-mini text-center' style='border: none;width:40px; height:30px; background-color: #BFBFBF;'  type='text' value='"+$(this).text()+"'>");
				        })
						$(this).parent().siblings(".materielNumbertw").each(function() {  // 获取当前行的其他单元格

				            $(this).html("<input class='input-mini text-center materielNumber' style='border: none;width:80px; height:30px; background-color: #BFBFBF;'  type='text' value='"+$(this).text()+"'>");
				        })
				        $(this).parent().siblings(".composite").each(function() {  // 获取当前行的其他单元格
				        	 $(this).html('<select   class="input-mini  selectdoubleComposite"  style="border: none;width:60px; height:30px; background-color: #BFBFBF;appearance:none;text-align-last: center"><option value="0"></option><option value="1">复合</option></select>');
				        })
				        $(this).parent().siblings(".oneMaterial").each(function() {  // 获取当前行的其他单元格

				            $(this).html("<input class='input-mini text-center' style='border: none;width:60px; height:30px; background-color: #BFBFBF;'  type='text' value='"+$(this).text()+"'>");
				        })
				        $(this).parent().siblings(".unite").each(function() {  // 获取当前行的其他单元格
				        	 $(this).html(htmlto);
				        })
				        $(this).parent().siblings(".manualLoss").each(function() {  // 获取当前行的其他单元格

				            $(this).html("<input class='input-mini text-center' style='border: none;width:40px; height:30px; background-color: #BFBFBF;'  type='text' value='"+$(this).text()+"'>");
				        })
				        $(this).parent().siblings(".complexMaterielNumbertw").each(function() {  // 获取当前行的其他单元格

				            $(this).html("<input class='input-mini complexMaterielNumber  text-center' style='border: none;width:80px; height:30px; background-color: #BFBFBF;'  type='text' value='"+$(this).text()+"'>");
				        })
				        $(this).parent().siblings(".doubleComposite").each(function() {  // 获取当前行的其他单元格
				        	 $(this).html("<select  class='input-mini text-center selectdoubleCompositetw' style='border: none;width:90px; height:30px; background-color: #BFBFBF;text-align-last: center'><option value='0'></option><option value='1'>面料对复合</option></select>");
				        })
				        $(this).parent().siblings(".compositeManualLosstw").each(function() {  // 获取当前行的其他单元格

				            $(this).html("<input class='input-mini text-center' style='border: none;width:40px; height:30px; background-color: #BFBFBF;'  type='text' value='"+$(this).text()+"'>");
				        })
				       
				        $('.selectdoubleComposite').each(function(i,o){
						var id=aa;
						$(o).val(id);
						})
						$('.selectunit').each(function(i,o){
						
						$(o).val(cc)
						}) 
						 $('.selectdoubleCompositetw').each(function(i,o){
						$(o).val(dd);
						})
						self.mater();
					}else{
							$(this).text("编辑")
							/* $(this).parent().parent().find(".composite").find(".selectdoubleComposite").attr("disabled",'disabled');
						  $(this).parent().parent().find(".composite").find(".selectdoubleComposite").css('background','none'); */
						$(this).parent().siblings(".edit").each(function() {  // 获取当前行的其他单元格

					            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框

					       
					                $(this).html(obj_text.val()); 
									
							})
							$(this).parent().siblings(".editt").each(function() {  // 获取当前行的其他单元格

					            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
					                $(this).html(obj_text.val()); 
							})
							$(this).parent().siblings(".perimetertw").each(function() {  // 获取当前行的其他单元格

					            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
					                $(this).html(obj_text.val()); 
							})
							$(this).parent().siblings(".materielNumbertw").each(function() {  // 获取当前行的其他单元格

					            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
					                $(this).html(obj_text.val()); 
							})
							$(this).parent().siblings(".oneMaterial").each(function() {  // 获取当前行的其他单元格

					            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
					                $(this).html(obj_text.val()); 
							})
							$(this).parent().siblings(".manualLoss").each(function() {  // 获取当前行的其他单元格

					            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
					                $(this).html(obj_text.val()); 
							})
							$(this).parent().siblings(".complexMaterielNumbertw").each(function() {  // 获取当前行的其他单元格

					            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
					                $(this).html(obj_text.val()); 
							})
							$(this).parent().siblings(".compositeManualLosstw").each(function() {  // 获取当前行的其他单元格

					            obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
					                $(this).html(obj_text.val()); 
							})
							/* $(this).parent().siblings(".doubleComposite").each(function() {  // 获取当前行的其他单元格

								$(this).removeAttr("style");
					            
							}) */
							var postData = {
									id:$(this).data('id'),
									cutPartsName:$(this).parent().parent('tr').find(".cutPartsNametw").text(),
									cutPartsNumber:$(this).parent().parent('tr').find(".cutPartsNumbertw").text(),
									materielNumber:$(this).parent().parent('tr').find(".materielNumbertw").text(),
									materielName:$(this).parent().parent('tr').find(".editmaterielName").text(),
									materielId:$(this).parent().parent('tr').find(".materielIds").text(),
									composite:$(this).parent().parent('tr').find(".composite").find(".selectdoubleComposite").val(),
									oneMaterial:$(this).parent().parent('tr').find(".oneMaterial").text(),
									unitId:$(this).parent().parent('tr').find(".unite").find(".selectunit").val(),
									unit:$(this).parent().parent('tr').find(".unite option:selected").text(),
									manualLoss:$(this).parent().parent('tr').find(".manualLoss").text(),
									productCost:$(this).parent().parent('tr').find(".productCost").text(),
									productRemark:$(this).parent().parent('tr').find(".productRemark").text(),
									complexMaterielNumber:$(this).parent().parent('tr').find(".complexMaterielNumbertw").text(),
									complexMaterielName:$(this).parent().parent('tr').find(".complexMaterielName").text(),
									doubleComposite:$(this).parent().parent('tr').find(".doubleComposite").find(".selectdoubleCompositetw").val(),
									complexProductCost:$(this).parent().parent('tr').find(".complexProductCost").text(),
									complexProductRemark:$(this).parent().parent('tr').find(".complexProductRemark").text(),
									compositeManualLoss:$(this).parent().parent('tr').find(".compositeManualLosstw").text(),
									perimeter:$(this).parent().parent('tr').find(".perimetertw").text(),
							}
							
							var index;
							$.ajax({
								url:"${ctx}/product/updateCutParts",
								data:postData,
								type:"POST",
								beforeSend:function(){
									index = layer.load(1, {
										  shade: [0.1,'#fff'] //0.1透明度的白色背景
										});
								},
								
								success:function(result){
									if(0==result.code){
									layer.msg(result.message, {icon: 1});
									var data={
											page:1,
									  		size:100,	
									  		productId:productIdAll,
									} 
								   self.loadPagination(data);
									layer.close(index);
									}else{
										layer.msg(result.message, {icon: 2});
										layer.close(index);
									}
								},error:function(){
									layer.msg("操作失败！", {icon: 2});
									layer.close(index);
								}
							});
					}
				})
			} 
			this.mater=function(){
				//提示裁片名
				$(".cuttingName").typeahead({
					//ajax 拿way数据
					source : function(query, process) {
							return $.ajax({
								url : '${ctx}/product/getBaseOne',
								type : 'GET',
								data : {
									name:query,
									type:"cutParts",
								},
								success : function(result) {
									//转换成 json集合
									 var resultList = result.data.map(function (item) {
										 	//转换成 json对象
					                        var aItem = {name: item.name, id:item.id}
					                        //处理 json对象为字符串
					                        return JSON.stringify(aItem);
					                    });
									//提示框返回数据
									 if(resultList==""){
											var aItemtw = {"name":"", "id":""}
											resultList.push(JSON.stringify(aItemtw)); 
										} 
									 return process(resultList);
								},
							})
							//提示框显示
						}, highlighter: function (item) {
						    //转出成json对象
							 var item = JSON.parse(item);
							return item.name
							//按条件匹配输出
		                }, matcher: function (item) {
		                	//转出成json对象
					        var item = JSON.parse(item);
					        self.setNum(item.id)
					    	return item.name
					    },
						//item是选中的数据
						updater:function(item){
							//转出成json对象
							var item = JSON.parse(item);
							self.setNum(item.id)
								return item.name
						},
					});
				//选择单位
				var data = {
					type:"unit",
				}
				var index;
			    var html = '';
			    $.ajax({
				      url:"${ctx}/product/getBaseOne",
				      data:data,
				      type:"GET",
				     
		      		  success: function (result) {
		      			 $(result.data).each(function(i,o){
		      				html +='<option value="'+o.id+'">'+o.name+'</option>'
		      			}); 
				       var htmlto='<select class="  selectgroupChange" style="border: none;width:50px; height:30px; background-color: #BFBFBF;"><option value=""></option>'+html+'</select>'
				       $(".selectCompany").html(htmlto); 
				       $('.selectgroupChange').each(function(i,o){
							$(o).val(154)
								})	
				      },error:function(){
							layer.msg("加载失败！", {icon: 2});
							layer.close(index);
					  }
				  });
				
				
			
			}
			this.events = function(){
				
				var datttte={
						productId:productIdAll,
				}
				$.ajax({
					url:"${ctx}/product/updateMaterielAndOther",
					data:datttte,
					traditional: true,
					type:"GET",
					async: false,
					beforeSend:function(){
						index = layer.load(1, {
							  shade: [0.1,'#fff'] //0.1透明度的白色背景
							});
					},
					
					success:function(result){
						if(0==result.code){
							
						}else{
							layer.msg("失败！", {icon: 2});
							layer.close(index);
						}
					},error:function(){
						layer.msg("操作失败！", {icon: 2});
						layer.close(index);
					}
				});
				//一键删除
				$('.start').on('click',function(){
					  var  that=$(".table-hover");
					  var arr=new Array()//员工id
					  	that.parent().parent().parent().parent().parent().find(".checkboxId:checked").each(function() {  
							arr.push($(this).val());   
						});
					  var postData = {
								ids:arr,
						}
						var index;
						 index = layer.confirm('确定删除吗', {btn: ['确定', '取消']},function(){
						$.ajax({
							url:"${ctx}/product/deleteCutParts",
							data:postData,
							traditional: true,
							type:"GET",
							beforeSend:function(){
								index = layer.load(1, {
									  shade: [0.1,'#fff'] //0.1透明度的白色背景
									});
							},
							
							success:function(result){
								if(0==result.code){
								layer.msg("删除成功！", {icon: 1});
								var data = {
					        			page:1,
								  		size:100,
								  		 productId:productIdAll, 
							  	}
								self.loadPagination(data)
								layer.close(index);
								}else{
									layer.msg("删除失败！", {icon: 2});
									layer.close(index);
								}
							},error:function(){
								layer.msg("操作失败！", {icon: 2});
								layer.close(index);
							}
						});
						 })
				})
				//查询
				$('.searchtask').on('click',function(){
					var data = {
				  			page:1,
				  			size:100,
				  			productId:self.getCache(),
				  			primeCostNumber:$('#number').val(),
				  			name: $('#name').val(),
				  	}
		            self.loadPagination(data);
				});
				/*保存  */
				$('#save').on('click',function(){
					if($('#number').val()==""){
						 return layer.msg("默认数量不能为空！", {icon: 2});
					}
					if($('#productName').val()==""){
						 return layer.msg("产品名不能为空！", {icon: 2});
					}
					var leng = $(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').length;
				for (var i = 0; i <leng; i++) {
					/* if($(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.sliceNumber').val()==""){
						return layer.msg("片数不能为空", {icon: 2});
					} */
					var a=$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.cuttingName').val()
					if(a!=undefined && a!=""){
					if($(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.cuttingName').val()!=""){
						if($(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.sliceNumber').val()==""){
							return layer.msg("片数不能为空", {icon: 2});
						}
						if($(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.manualLoss').val()==""){
							return layer.msg("默认耗损不能为空", {icon: 2});
						}
						if($(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.oneMaterial').val()==""){
							return layer.msg("单片用料不能为空", {icon: 2});
						}
					}
					var postData = {
						productId:self.getCache(),
						number:$('#number').val(),
						baseId:self.getNum(),
						cutPartsName:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.cuttingName').val(),
						cutPartsNumber:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.sliceNumber').val(),
						materielNumber:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.materielNumber').val(),
						materielName:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.materiel').text(),
						materielId:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.materielId').text(),
						composite:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.selectname').val(),
						oneMaterial:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.oneMaterial').val(),
						unit:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.selectgroupChange option:selected').text(),
						unitId:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.selectgroupChange').val(),
						manualLoss:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.manualLoss').val(),
						productCost:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.unitPrice').text(),
						productRemark:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.unit').text(),
						complexMaterielName:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.complexMateriel').val(),
						complexMaterielNumber:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.complexMaterielNumber').text(),
						doubleComposite:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.bilayer').val(),
						complexProductCost:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.unitPricetw').text(),			
						complexProductRemark:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.unittw').text(),
						compositeManualLoss:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.compositeManualLoss').val(),
						perimeter:$(this).parent().parent().parent().parent().parent().parent().parent().next().find('#tablecontent tr').eq(i).find('.perimeter').val(),
					}
					var index;
					$.ajax({
						url:"${ctx}/product/addCutParts",
						data:postData,
						type:"POST",
						async:false,
						beforeSend:function(){
							index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								});
						},
						
						success:function(result){
							if(0==result.code){
							layer.msg("新增成功！", {icon: 1});
							 var _data={
									page:1,
							  		size:100,
							  		productId:self.getCache(),
							}
							self.loadPagination(_data) 
							layer.close(index);
							}else{
								layer.msg("新增失败！", {icon: 2});
								layer.close(index);
							}
						},error:function(){
							layer.msg("操作失败！", {icon: 2});
							layer.close(index);
						}
					});
					}
					
						
				}
						
					
					
		})
				
				
				
				//提示产品名
				$("#productName").typeahead({
					//ajax 拿way数据
					source : function(query, process) {
							return $.ajax({
								url : '${ctx}/getProductPages',
								type : 'GET',
								data : {
									name:query,
								},
								
								success : function(result) {
									//转换成 json集合
									 var resultList = result.data.rows.map(function (item) {
										 	//转换成 json对象
					                        var aItem = {name: item.name, id:item.id, number:item.primeCost==null ? "" : item.primeCost.number}
					                        //处理 json对象为字符串
					                        return JSON.stringify(aItem);
					                    });
									//提示框返回数据
									 return process(resultList);
								},
							})
							//提示框显示
						}, highlighter: function (item) {
						    //转出成json对象
							 var item = JSON.parse(item);
							return item.name+"-"+item.id
							//按条件匹配输出
		                }, matcher: function (item) {
		                	//转出成json对象
					        var item = JSON.parse(item);
					        self.setCache(item.id)
					        $('#number').val(item.number)
					    	return item.name
					    },
						//item是选中的数据
						updater:function(item){
							//转出成json对象
							var item = JSON.parse(item);
							self.setCache(item.id)
							 $('#number').val(item.number)
								return item.name
						},
						
					});
				
				//新增
					
					var html="";
				$('#addCutting').on('click',function(){
					var a=$('#loss').val();
					for (var i = 0; i < 10; i++) {
					 html='<tr><td></td><td  style="padding: 9px 0px 2px 4px;"><input type="text" style="border: none;width:68px; height:30px; background-color: #BFBFBF;" data-provide="typeahead" autocomplete="off" class="text-center  cuttingName" /></td>'
					 +'<td class="text-center edit name" style="padding: 9px 0px 2px 4px;"><input type="text" style="border: none;width:40px; height:30px; background-color: #BFBFBF;" class="text-center sliceNumber" /></td>'
					 +'<td class="text-center edit " ><input type="text"    style="border: none;width:40px; height:30px; background-color: #BFBFBF;" class="text-center perimeter"  /></td>'
					 +'<td class="text-center edit " ></td>'
					 +'<td class="text-center edit " ><input type="text"    style="border: none;width:70px; height:30px; background-color: #BFBFBF;" class="text-center materielNumber"  /></td>'
					 +'<td class="text-center edit name materiel"></td>'
					 +'<td class="text-center edit name materielId hidden"></td>'
					 +'<td class="text-center edit name" style="padding: 2px 0px 2px 4px;"><select class="text-center  selectname" style="border: none;width:60px; height:30px; background-color: #BFBFBF;"><option value="0"></option><option value="1">复</option></select></td>'
					 +'<td class="text-center edit name" style="padding: 2px 0px 2px 4px;"><input type="text" style="border: none;width:60px; height:30px; background-color: #BFBFBF;" class="text-center oneMaterial" /></td>'
					 +'<td class="text-center edit selectCompany" style="padding: 2px 0px 2px 4px;></td>'
					 +'<td class="text-center edit name"></td>'
					 +'<td class="text-center edit name"></td>'
					 +'<td class="text-center edit name"</td>'
					 +'<td class="text-center edit name" style="padding: 2px 0px 2px 0px;"><input type="text" value="'+a+'" style="border: none;width:40px; height:30px; background-color: #BFBFBF;" class="text-center manualLoss" /></td>'
					 +'<td class="text-center edit unitPrice" ></td>'
					 +'<td class="text-center edit unit"></td>'
					 +'<td class="text-center edit name"> </td>'
					 +'<td class="text-center edit name"> </td>'
					 +'<td class="text-center edit" style="padding: 2px 0px 2px 0px;"><input type="text"    style="border: none;width:120px; height:30px; background-color: #BFBFBF;" class="text-center  complexMaterielNumber "  /></td>'
					 +'<td class="text-center edit name complexMateriel"></td>'
					 +'<td class="text-center edit name" style="padding: 2px 0px 2px 0px;"><select class="text-center bilayer" style="border: none;width:90px; height:30px; background-color: #BFBFBF;"><option value="0"></option><option value="1">面料对复合</option></select></td>'
					 +'<td class="text-center edit unitPricetw" ></td>'
					 +'<td class="text-center edit unittw" ></td>'
					 +'<td class="text-center edit name" style="padding: 2px 0px 2px 0px;"><input type="text"  style="border: none;width:40px; height:30px; background-color: #BFBFBF;" class="text-center compositeManualLoss" /></td>'
					 +'<td class="text-center edit name"> </td>'
					 +'<td class="text-center edit name"> </td>'
					 +'<td class="text-center edit name"> </td></tr>';
					$("#tablecontent").prepend(html);
					}
					self.mater();
				})
			
				var that;
				$(document).on('click','.materielNumber',function(){
					 that=$(this)
					//提示物料名
					$(".materielNumber").typeahead({
						//ajax 拿way数据
						scrollHeight:1,
						source : function(query, process) {
								return $.ajax({
									url : '${ctx}/product/getMateriel',
									type : 'GET',
									data : {
										number:query,
										type:"material",
									},
									success : function(result) {
										//转换成 json集合
										 var resultList = result.data.map(function (item) {
											 	//转换成 json对象
						                        var aItem = {name: item.name, number:item.number, price:item.price, unit:item.unit, id:item.id}
						                        //处理 json对象为字符串
						                        return JSON.stringify(aItem);
						                    });
										//提示框返回数据
										 return process(resultList);
									},
								})
								
								//提示框显示
							}, highlighter: function (item) {
							    //转出成json对象
								 var item = JSON.parse(item);
								return item.name+"-"+item.number
								//按条件匹配输出
			                }, matcher: function (item) {
			                	//转出成json对象
						        var item = JSON.parse(item);
						        that.parent().next().text(item.name);
						        that.parent().next().next().text(item.id);
						        that.parent().parent().find('.unitPrice').text(item.price);
						        that.parent().parent().find('.unit').text(item.unit);
						    	return item.number
						    },
							//item是选中的数据
							updater:function(item){
								//转出成json对象
								var item = JSON.parse(item);
								that.parent().next().text(item.name);
								that.parent().next().next().text(item.id);
								that.parent().parent().find('.unitPrice').text(item.price);
								that.parent().parent().find('.unit').text(item.unit);
									return item.number
							},
							
						});
				});
			
				var thae;
				$(document).on('click','.complexMaterielNumber',function(){
					 thae=$(this)
					//提示复合物料名
					$(".complexMaterielNumber").typeahead({
						//ajax 拿way数据
						scrollHeight:1,
						source : function(query, process) {
								return $.ajax({
									url : '${ctx}/product/getMateriel',
									type : 'GET',
									data : {
										number:query,
										type:"material",
									},
									success : function(result) {
										//转换成 json集合
										 var resultList = result.data.map(function (item) {
											 	//转换成 json对象
						                        var aItem = {name: item.name, number:item.number, price:item.price, unit:item.unit}
						                        //处理 json对象为字符串
						                        return JSON.stringify(aItem);
						                    });
										//提示框返回数据
										 return process(resultList);
									},
								})
								
								//提示框显示
							}, highlighter: function (item) {
							    //转出成json对象
								 var item = JSON.parse(item);
								return item.name+"-"+item.number
								//按条件匹配输出
			                }, matcher: function (item) {
			                	//转出成json对象
						        var item = JSON.parse(item);
						        thae.parent().next().text(item.name);
						        thae.parent().parent().find('.unitPricetw').text(item.price);
						        thae.parent().parent().find('.unittw').text(item.unit);
						    	return item.number
						    },
							//item是选中的数据
							updater:function(item){
								//转出成json对象
								var item = JSON.parse(item);
								thae.parent().next().text(item.name);
								thae.parent().parent().find('.unitPricetw').text(item.price);
								thae.parent().parent().find('.unittw').text(item.unit);
									return item.number
							},
							
						});
				});
				
			}
   	}
   			var login = new Login();
				login.init();
			})
    
    </script>

</body>

</html>