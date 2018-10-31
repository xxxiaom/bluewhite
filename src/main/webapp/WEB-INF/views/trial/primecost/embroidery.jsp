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
    <title>绣花填写</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  
   
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
                                <h3 class="panel-title">绣花填写页面</h3>
                                <div class="actions pull-right">
                                    <i class="fa fa-expand"></i>
                                    <i class="fa fa-chevron-down"></i>
                                </div>
                            </div>
                             <div class="panel-body">
                                <div class="tab-wrapper tab-primary">
                                    <ul class="nav nav-tabs col-md-12">
                                        <li class="active col-md-2" style="width: 50%"><a href="#home1" class="home1" data-toggle="tab">机工页面</a>
                                        </li>
                                        <li class="col-md-2"style="width: 50%;"><a href="#profile1" class="profile1"  data-toggle="tab">机缝时间</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="home1">
                                        <!--查询开始  -->
          		 <div class="row" style="height: 30px; margin:15px 0 10px">
			<div class="col-xs-11 col-sm-11  col-md-11">
				<form class="form-search" >
					<div class="row">
						<div class="col-xs-11 col-sm-11 col-md-11">
							<div class="input-group"> 
								<table><tr>
								<td>产品名:</td><td><input type="text" name="name" id="productName" placeholder="请输入产品名称" class="form-control search-query name" data-provide="typeahead" autocomplete="off"/ ></td>
								<td>&nbsp&nbsp</td>
								<td>默认数量:</td><td><input type="text" name="number" id="number" placeholder="请输入默认数量" class="form-control search-query number" /></td>
									<td>&nbsp&nbsp</td>
								<td>默认耗损:</td><td><input type="text" name="name" id="loss" placeholder="请输入产品名称" class="form-control search-query name" /></td>
								<!-- <td>&nbsp&nbsp</td> -->
								<!-- <td>完成状态:</td><td><select class="form-control" id="selectstate"><option value=0>未完成</option><option value=1>已完成</option></select></td> -->
								</tr></table> 
								<span class="input-group-btn">
									<button type="button" class="btn btn-info btn-square btn-sm btn-3d searchtask">
											查&nbsp找
									</button>
								</span>
								<td>&nbsp&nbsp&nbsp&nbsp</td>
								<span class="input-group-btn">
									<button type="button" id="save" class="btn btn-success  btn-sm btn-3d">
									保存
									</button>
								</span>
								 <td>&nbsp&nbsp&nbsp&nbsp</td>
								<span class="input-group-btn">
									<button type="button" id="addCutting" class="btn btn-success  btn-sm btn-3d export">
									新增裁片
									</button>
								</span> 
								<td>&nbsp&nbsp&nbsp&nbsp</td>
								<span class="input-group-btn">
									<button type="button" class="btn btn-danger  btn-sm btn-3d start">
									一键删除
									</button>
								</span>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
            <!-- 查询结束 -->
                                        
                                            <table class="table table-hover" >
                                    <thead>
                                        <tr>
                                        <th class="text-center">
											<label> 
											<input type="checkbox" class="ace checks" /> 
											<span class="lbl"></span>
											</label>
											</th>
                                            <th class="text-center">绣花步骤</th>
                                            <th class="text-center">电脑推算绣花价格</th>
                                            <th class="text-center">目前市场价格</th>
                                            <th class="text-center">选择入成本价格↓</th>
                                            <th class="text-center">入成本价格</th>
                                            <th class="text-center">各单道比全套工价</th>
                                            <th class="text-center">物料压价</th>
                                            <th class="text-center">为机工准备的压价</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablecontent">
                                        
                                    </tbody>
                                </table>
                                        </div>
            <div class="tab-pane" id="profile1">
                      <!--查询开始  -->
          		 <div class="row" style="height: 30px; margin:15px 0 10px">
					<div class="col-xs-10 col-sm-10  col-md-10">
						<form class="form-search" >
							<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12">
							<div class="input-group"> 
								<table><tr><td>批次:</td><td><input type="text" name="number" id="number" placeholder="请输入批次号" class="form-control search-query number" /></td>
								</tr></table> 
								<span class="input-group-btn">
									<button type="button" class="btn btn-info btn-square btn-sm btn-3d searchtask">
										查找
										<i class="icon-search icon-on-right bigger-110"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
            <!-- 查询结束 -->  
                                   <table class="table table-hover">
                                    <thead>
                                        <tr>
                                        	<th class="text-center">机缝工序</th>
                                        	<th class="text-center">选择针号</th>
                                            <th class="text-center">选择线色或线号</th>
                                            <th class="text-center">选择针距↓</th>
                                            <th class="text-center">得到试制净快手时间</th>
                                            <th class="text-center">手填该工序回针次数</th>
                                            <th class="text-center">1请选直线机缝模式↓</th>
                                            <th class="text-center">手填该工序满足G列的CM↓</th>
                                            <th class="text-center">2请选弧线机缝模式↓</th>
                                            <th class="text-center">手填该工序满足I列的CM↓</th>
                                            <th class="text-center">3请选弯曲复杂机缝模式↓</th>
                                            <th class="text-center">手填该工序满足K列的CM↓</th>
                                            <th class="text-center">单一机缝需要时间/秒</th>
                                             <th class="text-center">设备折旧和房水电费</th>
                                            <th class="text-center">管理人员费用</th>
                                            <th class="text-center">电脑推算机缝该工序费用</th>
                                            <th class="text-center">试制机缝该工序费用</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablecontent2">
                                        
                                    </tbody>
                                </table>
                                 </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                        </div>
            </section>
        </section>




  
  
 
  
<div id="addworking" style="display: none;">
			<div class="panel-body">
 <div class="form-group">
  </div> 
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                        	<th class="text-center">用到裁片或上道</th>
                                        	<th class="text-center">压价</th>
                                        	<th class="text-center">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableworking2">
                                    </tbody>
                                </table>
                                 <div id="pagerr" class="pull-right">
                            </div>
</div>
<!--隐藏框 已完成的批次结束  -->
</div> 
  
  
  
 

  
  
  
    </section>
    
   
   
   <script src="${ctx }/static/js/vendor/jquery-3.3.1.min.js"></script>
    <script src="${ctx }/static/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${ctx }/static/plugins/navgoco/jquery.navgoco.min.js"></script>
    <script src="${ctx }/static/plugins/switchery/switchery.min.js"></script>
    <script src="${ctx }/static/plugins/pace/pace.min.js"></script>
    <script src="${ctx }/static/plugins/fullscreen/jquery.fullscreen-min.js"></script>
    <script src="${ctx }/static/js/src/app.js"></script>
     <script src="${ctx }/static/js/laypage/laypage.js"></script> 
    <script src="${ctx }/static/plugins/dataTables/js/jquery.dataTables.js"></script>
    <script src="${ctx }/static/plugins/dataTables/js/dataTables.bootstrap.js"></script>
    <script src="${ctx }/static/js/laydate-icon/laydate.js"></script>
    <script src="${ctx }/static/js/vendor/mSlider.min.js"></script>
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
		 var data={
					page:1,
			  		size:100,	
			  		productId:"",
			} 
			this.init = function(){
				
				//注册绑定事件
				self.events();
				self.loadPagination(data);
				self.loadPagination2(data);
			}
			//加载分页
			  this.loadPagination = function(data){
				  var index;
				    var html = '';
				    $.ajax({
					      url:"${ctx}/product/getMachinist",
					      data:data,
					      type:"GET",
					      beforeSend:function(){
						 	  index = layer.load(1, {
							  shade: [0.1,'#fff'] //0.1透明度的白色背景
							  });
						  }, 
			      		  success: function (result) {
			      			 $(result.data.rows).each(function(i,o){
			      				if(o.costPrice==o.reckoningSewingPrice || o.costPrice==o.trialSewingPrice){
			      					 
			      				 }else{
			      					o.costPrice=""
			      				 }
			      				html+='<tr><td class="text-center reste"><label> <input type="checkbox" class="ace checkboxId" data-productid='+o.productId+' value="'+o.id+'"/><span class="lbl"></span></label></td>'
			      				 +'<td  class="text-center edit name"  style="padding: 2px 0px 2px 4px;"><input type="text" value="'+o.machinistName+'" style="border: none;width:120px; height:30px; background-color: #BFBFBF;" data-provide="typeahead" autocomplete="off" class="text-center  machinistName" /></td>'
			   					 +'<td class="text-center edit selectid hidden">'+o.id+'</td>'
			   					 +'<td class="text-center edit name" style="padding: 2px 0px 2px 0px;"><input type="text" style="border: none;width:120px; height:30px; background-color: #BFBFBF;"  class="text-center materiel" /></td>'
			   					 +'<td class="text-center edit selectCompany" style="padding: 2px 0px 2px 0px;"></td>'
			   					 +'<td class="text-center edit selectbody"><a>查看</a></td>'
			   					 +'<td class="text-center edit selectbody2 hidden">'+o.cutparts+','+'</td>'
			   					 +'<td class="text-center edit selectprice2 hidden">'+o.cutpartsPrice+','+'</td>'
			   					 +'<td class="text-center edit name">'+o.reckoningSewingPrice+'</td>'
			   					 +'<td class="text-center edit" >'+o.trialSewingPrice+' </td>'
			   					 +'<td class="text-center edit"><select class="form-control costPrice"><option value="'+(o.costPrice!=null?o.costPrice:"")+'">'+(o.costPrice!=null?o.costPrice:"")+'</option><option value="'+(o.reckoningSewingPrice!=null?o.reckoningSewingPrice:"")+'">'+(o.reckoningSewingPrice!=null?o.reckoningSewingPrice:"")+'</option><option value="'+(o.trialSewingPrice!=null?o.trialSewingPrice:"")+'">'+(o.trialSewingPrice!=null?o.trialSewingPrice:"")+'</option></select></td>'
			   					 +'<td class="text-center edit allCostPrice" >'+parseFloat((o.allCostPrice).toFixed(5))+' </td>'
			   					 +'<td class="text-center edit scaleMaterial" >'+parseFloat((o.scaleMaterial).toFixed(5))+' </td>'
			   					 +'<td class="text-center edit priceDown" >'+parseFloat((o.priceDown).toFixed(5))+' </td>'
			   					 +'<td class="text-center edit priceDownRemark" >'+parseFloat((o.priceDownRemark).toFixed(5))+' </td>'
			   					 +'<td class="text-center edit needleworkPriceDown" >'+parseFloat((o.needleworkPriceDown).toFixed(5))+' </td>'
			   					 +'<td class="text-center edit machinistPriceDown" >'+parseFloat((o.machinistPriceDown).toFixed(5))+' </td></tr>'
			      			}); 
			      			self.setCount(result.data.pageNum)
					        //显示分页
						   	layer.close(index);
						   	 $("#tablecontent").html(html);
						   	self.loadEvents()
						   	 self.mater()
						   	 self.checkedd()
					      },error:function(){
								layer.msg("加载失败！", {icon: 2});
								layer.close(index);
						  }
					  });
			}
			  
			  this.loadPagination2 = function(data){
				  //机缝时间
				  $(".profile1").on('click',function(){
					  var index;
					    var html = '';
					    $.ajax({
						      url:"${ctx}/product/getMachinist",
						      data:data,
						      type:"GET",
						      beforeSend:function(){
							 	  index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								  });
							  }, 
				      		  success: function (result) {
				      			 $(result.data.rows).each(function(i,o){
				      			}); 
							   	layer.close(index);
							   	 $("#tablecontent2").html(html); 
						      },error:function(){
									layer.msg("加载失败！", {icon: 2});
									layer.close(index);
							  }
						  });
				  })
			  }
			  this.loadEvents=function(){
				  $(".costPrice").change(function(){
				    	var that=$(this);
		      			var id=$(this).parent().parent().find(".checkboxId").val();
		      			var productId=$(this).parent().parent().find(".checkboxId").data('productid');
		      			var	datae={
				    			id:id,
				    			costPrice:$(this).val(),
				    			productId:productId
				    	}
		      			var index;
				    	$.ajax({
						      url:"${ctx}/product/addMachinist",
						      data:datae,
						      type:"POST",
						      beforeSend:function(){
									index = layer.load(1, {
										  shade: [0.1,'#fff'] //0.1透明度的白色背景
										});
								},
				      		  success: function (result) {
				      			if(0==result.code){
									$(result.data).each(function(i,o){
										that.parent().parent().find(".allCostPrice").text(parseFloat((o.allCostPrice).toFixed(5)));
						      			 that.parent().parent().find(".scaleMaterial").text(parseFloat((o.scaleMaterial).toFixed(5)));
						      			 that.parent().parent().find(".priceDown").text(parseFloat((o.priceDown).toFixed(5)));  
						      			that.parent().parent().find(".needleworkPriceDown").text(parseFloat((o.needleworkPriceDown).toFixed(5)));  
						      			that.parent().parent().find(".priceDownRemark").text(parseFloat((o.priceDownRemark).toFixed(5)));
						      			that.parent().parent().find(".machinistPriceDown").text(parseFloat((o.machinistPriceDown).toFixed(5)));
						      			 });
								layer.close(index);
								}else{
									layer.msg("添加失败！", {icon: 2});
									layer.close(index);
								}
				      			
						      },error:function(){
									layer.msg("加载失败！", {icon: 2});
									layer.close(index);
							  }
						  });
				    })
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
			  this.mater=function(){
					
				  var data = {
							productId:"6956",
						}
						var index;
					    var html = '';
					    var htmlto= '';
					    $.ajax({
						      url:"${ctx}/product/getEmbroideryName",
						      data:data,
						      type:"GET",
				      		  success: function (result) {
				      			 $(result.data).each(function(i,o){
				      				html +='<option value="'+o.id+'">'+o.name+'</option>'
				      			}); 
						       htmlto='<select class="text-center form-control selecttailorType2" ><option value="">请选择</option>'+html+'</select>'
				      		  $(".needlesize").html(htmlto)
				      		  //改变事件
				      		  $(".selecttailorType2").each(function(i,o){
				      				var id=	$(o).parent().data("needlesize");
									$(o).val(id)
								})
								$(".selecttailorType2").change(function(i,o){
				      				var that=$(this);
				      				var id=$(this).parent().parent().find(".needlesize").data('id');
				      				var productId=$(this).parent().parent().find(".needlesize").data('productid');
				      				var dataeee={
				      						id:id,
				      						productId:productId,
				      						needlesize:$(this).parent().parent().find(".selecttailorType2").val(),
				      						wiresize:$(this).parent().parent().find(".selecttailorType3").val(),
				      						needlespur:$(this).parent().parent().find(".selecttailorType4").val(),
				      				}
				      				var index;
				      				$.ajax({
									      url:"${ctx}/product/addMachinist",
									      data:dataeee,
									      type:"POST",
									      beforeSend:function(){
												index = layer.load(1, {
													  shade: [0.1,'#fff'] //0.1透明度的白色背景
													});
											},
											success:function(result){
												if(0==result.code){
												layer.close(index);
												}else{
													layer.msg("添加失败！", {icon: 2});
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
				
					
					
				}
			
			this.events = function(){
				
				$(".home1").on('click',function(){
					var data={
							page:1,
					  		size:100,	
					  		productId:"",
					}
					self.loadPagination(data);
				})
				
				
			//新增
				var html="";
				$('#addCutting').on('click',function(){
					 html='<tr><td  class="text-center"></td><td  class="text-center edit embroideryName"></td>'
					 +'<td class="text-center edit " ></td>'
					 +'<td class="text-center edit " ></td>'
					 +'<td class="text-center edit " ></td>'
					 +'<td class="text-center edit " ></td>'
					 +'<td class="text-center edit " ></td>'
					 +'<td class="text-center edit " ></td>'
					 +'<td class="text-center edit " ></td>'
					 +'<td class="text-center edit " ></td>'
					 +'<td class="text-center edit "></td></tr>';
					  /* $(html).insertBefore("#tablecontent"); */
					/* $("#tablecontent").append(html); */
					$("#tablecontent").prepend(html);
					self.mater();
				})
			}
   	}
   			var login = new Login();
				login.init();
			})
    
    </script>
  
       
</body>

</html>