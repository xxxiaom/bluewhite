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
                                        <li class="active col-md-2" style="width: 50%"><a href="#home1" class="home1" data-toggle="tab">绣花页面</a>
                                        </li>
                                        <li class="col-md-2"style="width: 50%;"><a href="#profile1" class="profile1"  data-toggle="tab">绣花时间设定</a>
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
                                        	<th class="text-center">绣花步骤</th>
                                        	<th class="text-center">针数</th>
                                            <th class="text-center">针号</th>
                                            <th class="text-center">线粗细号</th>
                                            <th class="text-center">贴布数</th>
                                            <th class="text-center">绣花要用裁片1</th>
                                            <th class="text-center">绣花要用裁片2	</th>
                                            <th class="text-center">裁片1面积</th>
                                            <th class="text-center">确认绣片面积</th>
                                            <th class="text-center">裁片2面积</th>
                                            <th class="text-center">确认绣片面积</th>
                                            <th class="text-center">蒙薄膜层数</th>
                                            <th class="text-center">垫纸性质</th>
                                             <th class="text-center">绣花模式</th>
                                            <th class="text-center">手填可绣多少片</th>
                                            <th class="text-center">几头操作</th>
                                            <th class="text-center">绣花针号</th>
                                            <th class="text-center">绣花线号</th>
                                            <th class="text-center">请选绣花线色</th>
                                            <th class="text-center">绣花线色</th>
                                            <th class="text-center">请选贴布面积</th>
                                            <th class="text-center">贴布面积</th>
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
  <form id="form1">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                        	<th class="text-center">绣花线色</th>
                                        	<th class="text-center">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableworking2">
                                    </tbody>
                                </table>
   </form>                             
</div>
<!--隐藏框 已完成的批次结束  -->
</div> 
  

<div id="addworking2" style="display: none;">
			<div class="panel-body">
 <div class="form-group">
  </div> 
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                        	<th class="text-center">贴布面积</th>
                                        	<th class="text-center">贴布时间</th>
                                        	<th class="text-center">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableworking3">
                                    </tbody>
                                </table>
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
					      url:"${ctx}/product/getEmbroidery",
					      data:data,
					      type:"GET",
					      beforeSend:function(){
						 	  index = layer.load(1, {
							  shade: [0.1,'#fff'] //0.1透明度的白色背景
							  });
						  }, 
			      		  success: function (result) {
			      			 $(result.data.rows).each(function(i,o){
			      				if(o.costPrice==o.reckoningEmbroideryPrice || o.costPrice==o.reckoningSewingPrice){
			      					 
			      				 }else{
			      					o.costPrice=""
			      				 }
			      				html+='<tr><td class="text-center reste"><label> <input type="checkbox" class="ace checkboxId" data-productid='+o.productId+' value="'+o.id+'"/><span class="lbl"></span></label></td>'
			      				 +'<td  class="text-center edit name tailorName"  >'+o.embroideryName+'</td>'
			   					 +'<td class="text-center edit selectid hidden">'+o.id+'</td>'
			   					 +'<td class="text-center edit name">'+(o.reckoningEmbroideryPrice!=null?o.reckoningEmbroideryPrice:"")+'</td>'
			   					 +'<td class="text-center edit name">'+(o.reckoningSewingPrice!=null?o.reckoningSewingPrice:"")+'</td>'
			   					 +'<td class="text-center edit selectCompany"><select class="form-control costPrice"><option value="'+(o.costPrice!=null?o.costPrice:"")+'">'+(o.costPrice!=null?o.costPrice:"")+'</option><option value="'+(o.reckoningEmbroideryPrice!=null?o.reckoningEmbroideryPrice:"")+'">'+(o.reckoningEmbroideryPrice!=null?o.reckoningEmbroideryPrice:"")+'</option><option value="'+(o.reckoningSewingPrice!=null?o.reckoningSewingPrice:"")+'">'+(o.reckoningSewingPrice!=null?o.reckoningSewingPrice:"")+'</option></select></td>'
			   					 +'<td class="text-center edit allCostPrice">'+(o.allCostPrice!=null?o.allCostPrice:"")+'</td>'
			   					 +'<td class="text-center edit scaleMaterial">'+(o.scaleMaterial!=null?o.scaleMaterial:"")+'</td>'
			   					 +'<td class="text-center edit priceDown">'+(o.priceDown!=null?o.priceDown:"")+'</td>'
			   					 +'<td class="text-center edit priceDownRemark">'+(o.priceDownRemark!=null?o.priceDownRemark:"")+'</td></tr>'
			      			}); 
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
						      url:"${ctx}/product/getEmbroidery",
						      data:data,
						      type:"GET",
						      beforeSend:function(){
							 	  index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								  });
							  }, 
				      		  success: function (result) {
				      			 $(result.data.rows).each(function(i,o){
				      				html+='<tr>'
				      				 +'<td  class="text-center edit name tailorName2" data-productid='+o.productId+'>'+o.embroideryName+'</td>'
				   					 +'<td class="text-center edit selectid2 hidden"  >'+o.id+'</td>'
				   					+'<td class="text-center edit selectid3 hidden"  >'+o.productId+'</td>'
				   					 +'<td class="text-center edit"><input class="form-control needleNumber" data-id="'+o.id+'" style="width: 45px;" value='+(o.needleNumber!=0?o.needleNumber:"")+'></td>'
				   					 +'<td class="text-center edit"><input class="form-control needlesize" data-id="'+o.id+'" style="width: 45px;" value='+(o.needlesize!=null?o.needlesize:"")+'></td>'
				   					 +'<td class="text-center edit"><input class="form-control wiresize" data-id="'+o.id+'" style="width: 45px;" value='+(o.wiresize!=null?o.wiresize:"")+'></td>'
				   					 +'<td class="text-center edit"><input class="form-control applique" data-id="'+o.id+'" style="width: 45px;" value='+(o.applique!=0?o.applique:"")+'></td>'
				   					 +'<td class="text-center edit sizeName" data-sizename='+o.sizeName+'></td>'
				   					 +'<td class="text-center edit sizeTwoName" data-sizetwoname='+o.sizeTwoName+'></td>'
				   					 +'<td class="text-center edit size">'+o.size+'</td>'
				   					 +'<td class="text-center edit "><input class="form-control affirmSize" data-id="'+o.id+'" style="width: 55px;" value='+(o.affirmSize!=0?o.affirmSize:"")+'></td>'
				   					 +'<td class="text-center edit sizeTwo">'+o.sizeTwo+'</td>'
				   					 +'<td class="text-center edit"><input class="form-control affirmSizeTwo" data-id="'+o.id+'" style="width: 55px;" value='+(o.affirmSizeTwo!=0?o.affirmSizeTwo:"")+'></td>'
				   					 +'<td class="text-center edit"><input class="form-control membrane" data-id="'+o.id+'" style="width: 35px;" value='+(o.membrane!=0?o.membrane:"")+'></td>'
				   					 +'<td class="text-center edit packingPaper" data-packingpaper='+o.packingPaper+'></td>'
				   					 +'<td class="text-center edit"><select class="form-control embroideryMode"><option value="'+o.embroideryMode+'">'+(o.embroideryMode!=null?o.embroideryMode:"请选择")+'</option><option value="裁片绣">裁片绣</option><option value="整布绣">整布绣</option></select></td>'
				   					 +'<td class="text-center edit"><input class="form-control embroiderySlice" data-id="'+o.id+'" style="width: 55px;" value='+(o.embroiderySlice!=0?o.embroiderySlice:"")+'></td>'
				   					 +'<td class="text-center edit few" data-few='+o.few+'></td>'
				   					 +'<td class="text-center edit embroideryNeedlesize" data-embroideryneedlesize='+o.embroideryNeedlesize+'></td>'
				   					 +'<td class="text-center edit embroideryWiresize" data-embroiderywiresize='+o.embroideryWiresize+'></td>'
				   					 +'<td class="text-center edit embroideryColor"></td>'
				   					 +'<td class="text-center edit selectbodyy"><a>查看</a></td>'
				   					 +'<td class="text-center edit selectbody2 hidden"></td>'
				   					+'<td class="text-center edit appliqueSize"></td>'
				   					+'<td class="text-center edit selectbodyy2"><a>查看</a></td>'
				   					+'<td class="text-center edit selectbody4 hidden"></td>'
				   					+'<td class="text-center edit selectbodyprice4 hidden"></td>'
				   					 +'<td class="text-center edit "></td></tr>'
				      			 }); 
							   	layer.close(index);
							   	 $("#tablecontent2").html(html); 
							   	 self.loadEvents2();
						      },error:function(){
									layer.msg("加载失败！", {icon: 2});
									layer.close(index);
							  }
						  });
				  })
			  }
			  this.loadEvents2=function(){
				  $('.embroideryMode').change(function(){
					  var that=$(this);
					  var id=that.parent().parent().find('.selectid2').text();
  					  var productId=that.parent().parent().find('.selectid3').text();
  					var index;
  					var dataeee={
    						id:id,
    						productId:productId,
    						embroideryMode:$(this).parent().parent().find(".embroideryMode").val(),
    				}
  					$.ajax({
					      url:"${ctx}/product/addEmbroidery",
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
				  
				  
				  $(".needleNumber").blur(function(){
				    	var that=$(this);
    					var id=that.parent().parent().find('.selectid2').text();
    					var productId=that.parent().parent().find('.selectid3').text();
    					var dataeee={
    						id:id,
    						productId:productId,
    						needleNumber:$(this).parent().parent().find(".needleNumber").val(),
    						needlesize:$(this).parent().parent().find(".needlesize").val(),
    						wiresize:$(this).parent().parent().find(".wiresize").val(),
    						applique:$(this).parent().parent().find(".applique").val(),
    						affirmSize:$(this).parent().parent().find(".affirmSize").val(),
    						affirmSizeTwo:$(this).parent().parent().find(".affirmSizeTwo").val(),
    						membrane:$(this).parent().parent().find(".membrane").val(),
    						embroiderySlice:$(this).parent().parent().find(".embroiderySlice").val(),
    				}
    				var index;
    				$.ajax({
					      url:"${ctx}/product/addEmbroidery",
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
				  
				    $(".needlesize").blur(function(){
				    	var that=$(this);
    					var id=that.parent().parent().find('.selectid2').text();
    					var productId=that.parent().parent().find('.selectid3').text();
    					var dataeee={
    						id:id,
    						productId:productId,
    						needleNumber:$(this).parent().parent().find(".needleNumber").val(),
    						needlesize:$(this).parent().parent().find(".needlesize").val(),
    						wiresize:$(this).parent().parent().find(".wiresize").val(),
    						applique:$(this).parent().parent().find(".applique").val(),
    						affirmSize:$(this).parent().parent().find(".affirmSize").val(),
    						affirmSizeTwo:$(this).parent().parent().find(".affirmSizeTwo").val(),
    						membrane:$(this).parent().parent().find(".membrane").val(),
    						embroiderySlice:$(this).parent().parent().find(".embroiderySlice").val(),
    				}
    				var index;
    				$.ajax({
					      url:"${ctx}/product/addEmbroidery",
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
				  
				  $(".wiresize").blur(function(){
				    	var that=$(this);
    					var id=that.parent().parent().find('.selectid2').text();
    					var productId=that.parent().parent().find('.selectid3').text();
    					var dataeee={
    						id:id,
    						productId:productId,
    						needleNumber:$(this).parent().parent().find(".needleNumber").val(),
    						needlesize:$(this).parent().parent().find(".needlesize").val(),
    						wiresize:$(this).parent().parent().find(".wiresize").val(),
    						applique:$(this).parent().parent().find(".applique").val(),
    						affirmSize:$(this).parent().parent().find(".affirmSize").val(),
    						affirmSizeTwo:$(this).parent().parent().find(".affirmSizeTwo").val(),
    						membrane:$(this).parent().parent().find(".membrane").val(),
    						embroiderySlice:$(this).parent().parent().find(".embroiderySlice").val(),
    				}
    				var index;
    				$.ajax({
					      url:"${ctx}/product/addEmbroidery",
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
				  
				    $(".applique").blur(function(){
				    	var that=$(this);
    					var id=that.parent().parent().find('.selectid2').text();
    					var productId=that.parent().parent().find('.selectid3').text();
    					var dataeee={
    						id:id,
    						productId:productId,
    						needleNumber:$(this).parent().parent().find(".needleNumber").val(),
    						needlesize:$(this).parent().parent().find(".needlesize").val(),
    						wiresize:$(this).parent().parent().find(".wiresize").val(),
    						applique:$(this).parent().parent().find(".applique").val(),
    						affirmSize:$(this).parent().parent().find(".affirmSize").val(),
    						affirmSizeTwo:$(this).parent().parent().find(".affirmSizeTwo").val(),
    						membrane:$(this).parent().parent().find(".membrane").val(),
    						embroiderySlice:$(this).parent().parent().find(".embroiderySlice").val(),
    				}
    				var index;
    				$.ajax({
					      url:"${ctx}/product/addEmbroidery",
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
				    
				    $(".affirmSize").blur(function(){
				    	var that=$(this);
    					var id=that.parent().parent().find('.selectid2').text();
    					var productId=that.parent().parent().find('.selectid3').text();
    					var dataeee={
    						id:id,
    						productId:productId,
    						needleNumber:$(this).parent().parent().find(".needleNumber").val(),
    						needlesize:$(this).parent().parent().find(".needlesize").val(),
    						wiresize:$(this).parent().parent().find(".wiresize").val(),
    						applique:$(this).parent().parent().find(".applique").val(),
    						affirmSize:$(this).parent().parent().find(".affirmSize").val(),
    						affirmSizeTwo:$(this).parent().parent().find(".affirmSizeTwo").val(),
    						membrane:$(this).parent().parent().find(".membrane").val(),
    						embroiderySlice:$(this).parent().parent().find(".embroiderySlice").val(),
    				}
    				var index;
    				$.ajax({
					      url:"${ctx}/product/addEmbroidery",
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
				    
				    $(".affirmSizeTwo").blur(function(){
				    	var that=$(this);
    					var id=that.parent().parent().find('.selectid2').text();
    					var productId=that.parent().parent().find('.selectid3').text();
    					var dataeee={
    						id:id,
    						productId:productId,
    						needleNumber:$(this).parent().parent().find(".needleNumber").val(),
    						needlesize:$(this).parent().parent().find(".needlesize").val(),
    						wiresize:$(this).parent().parent().find(".wiresize").val(),
    						applique:$(this).parent().parent().find(".applique").val(),
    						affirmSize:$(this).parent().parent().find(".affirmSize").val(),
    						affirmSizeTwo:$(this).parent().parent().find(".affirmSizeTwo").val(),
    						membrane:$(this).parent().parent().find(".membrane").val(),
    						embroiderySlice:$(this).parent().parent().find(".embroiderySlice").val(),
    				}
    				var index;
    				$.ajax({
					      url:"${ctx}/product/addEmbroidery",
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
				    
				    $(".membrane").blur(function(){
				    	var that=$(this);
    					var id=that.parent().parent().find('.selectid2').text();
    					var productId=that.parent().parent().find('.selectid3').text();
    					var dataeee={
    						id:id,
    						productId:productId,
    						needleNumber:$(this).parent().parent().find(".needleNumber").val(),
    						needlesize:$(this).parent().parent().find(".needlesize").val(),
    						wiresize:$(this).parent().parent().find(".wiresize").val(),
    						applique:$(this).parent().parent().find(".applique").val(),
    						affirmSize:$(this).parent().parent().find(".affirmSize").val(),
    						affirmSizeTwo:$(this).parent().parent().find(".affirmSizeTwo").val(),
    						membrane:$(this).parent().parent().find(".membrane").val(),
    						embroiderySlice:$(this).parent().parent().find(".embroiderySlice").val(),
    				}
    				var index;
    				$.ajax({
					      url:"${ctx}/product/addEmbroidery",
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
				    
				    $(".embroiderySlice").blur(function(){
				    	var that=$(this);
    					var id=that.parent().parent().find('.selectid2').text();
    					var productId=that.parent().parent().find('.selectid3').text();
    					var dataeee={
    						id:id,
    						productId:productId,
    						needleNumber:$(this).parent().parent().find(".needleNumber").val(),
    						needlesize:$(this).parent().parent().find(".needlesize").val(),
    						wiresize:$(this).parent().parent().find(".wiresize").val(),
    						applique:$(this).parent().parent().find(".applique").val(),
    						affirmSize:$(this).parent().parent().find(".affirmSize").val(),
    						affirmSizeTwo:$(this).parent().parent().find(".affirmSizeTwo").val(),
    						membrane:$(this).parent().parent().find(".membrane").val(),
    						embroiderySlice:$(this).parent().parent().find(".embroiderySlice").val(),
    				}
    				var index;
    				$.ajax({
					      url:"${ctx}/product/addEmbroidery",
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
				  var data = {
							productId:"6956",//传产品id
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
				      				html +='<option value="'+o.id+'" data-tailorsize='+o.tailorSize+'>'+o.tailorName+'</option>'
				      			}); 
						       htmlto='<select class="text-center form-control selecttailorType3" ><option value="">请选择</option>'+html+'</select>'
				      		  $(".sizeName").html(htmlto)
				      		 
				      		  //改变事件
				      		  $(".selecttailorType3").each(function(i,o){
				      				var id=	$(o).parent().data("sizename");
									$(o).val(id)
								})
								$(".selecttailorType3").change(function(i,o){
				      				var that=$(this);
									 $(that.parent().parent().find('.size')).text($(this).parent().parent().find(".selecttailorType3 option:selected").data('tailorsize'))
				      				var tailorId=$(this).parent().parent().find(".selecttailorType3").val();
				      				var dataeee={
				      						id:that.parent().parent().find('.selectid2').text(),
				      						sizeName:tailorId,
				      						productId:that.parent().parent().find('.selectid3').text(),
				      						size:that.parent().parent().find(".selecttailorType3 option:selected").data('tailorsize')
				      				}
				      				var index;
				      				 $.ajax({
									      url:"${ctx}/product/addEmbroidery",
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
													layer.msg(result.message, {icon: 2});
													layer.close(index);
												}
											},error:function(){
												layer.msg("加载失败！", {icon: 2});
												layer.close(index);
										  }
									  }); 
								})
				      		  },error:function(){
									layer.msg("加载失败！", {icon: 2});
									layer.close(index);
							  }
						  });
				  
					    var data2 = {
								productId:"6956",//传产品id
							}
							var index;
						    var html2 = '';
						    var htmlto2= '';
						    $.ajax({
							      url:"${ctx}/product/getEmbroideryName",
							      data:data2,
							      type:"GET",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				html2 +='<option value="'+o.id+'" data-tailorsize='+o.tailorSize+'>'+o.tailorName+'</option>'
					      			}); 
							       htmlto2='<select class="text-center form-control selecttailorType4" ><option value="">请选择</option>'+html2+'</select>'
					      		  $(".sizeTwoName").html(htmlto2)
					      		 
					      		  //改变事件
					      		  $(".selecttailorType4").each(function(i,o){
					      				var id=	$(o).parent().data("sizetwoname");
										$(o).val(id)
									})
									$(".selecttailorType4").change(function(i,o){
					      				var that=$(this);
										 $(that.parent().parent().find('.sizeTwo')).text($(this).parent().parent().find(".selecttailorType4 option:selected").data('tailorsize'))
					      				var tailorId=$(this).parent().parent().find(".selecttailorType4").val();
					      				var embroideryName=$(this).parent().parent().find(".selecttailorType4 option:selected").text();
					      				var dataeee={
					      						id:that.parent().parent().find('.selectid2').text(),
					      						sizeTwoName:tailorId,
					      						productId:that.parent().parent().find('.selectid3').text(),
					      						sizeTwo:that.parent().parent().find(".selecttailorType4 option:selected").data('tailorsize')
					      				}
					      				var index;
					      				 $.ajax({
										      url:"${ctx}/product/addEmbroidery",
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
						    
						    var data3 = {
									type:"packingPaper",
								}
								var index;
							    var html3 = '';
							    var htmlto3= '';
							    $.ajax({
								      url:"${ctx}/product/getBaseOne",
								      data:data3,
								      type:"GET",
						      		  success: function (result) {
						      			 $(result.data).each(function(i,o){
						      				html3 +='<option value="'+o.id+'" data-textualtime='+o.textualTime+'>'+o.name+'</option>'
						      			}); 
								       htmlto3='<select class="text-center form-control selecttailorType5" ><option value="">请选择</option>'+html3+'</select>'
						      		  $(".packingPaper").html(htmlto3)
						      		 
						      		  //改变事件
						      		  $(".selecttailorType5").each(function(i,o){
						      				var id=	$(o).parent().data("packingpaper");
											$(o).val(id)
										})
										$(".selecttailorType5").change(function(i,o){
						      				var that=$(this);
						      				var tailorId=$(this).parent().parent().find(".selecttailorType5").val();
						      				var paperPrice=$(this).parent().parent().find(".selecttailorType5 option:selected").data('textualtime');
						      				var dataeee={
						      						id:that.parent().parent().find('.selectid2').text(),
						      						packingPaper:tailorId,
						      						productId:that.parent().parent().find('.selectid3').text(),
						      						paperPrice:paperPrice,
						      				}
						      				var index;
						      				 $.ajax({
											      url:"${ctx}/product/addEmbroidery",
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
							    
							    
							    
							    var data4 = {
										type:"few",
									}
									var index;
								    var html4 = '';
								    var htmlto4= '';
								    $.ajax({
									      url:"${ctx}/product/getBaseOne",
									      data:data4,
									      type:"GET",
							      		  success: function (result) {
							      			 $(result.data).each(function(i,o){
							      				html4 +='<option value="'+o.name+'">'+o.name+'</option>'
							      			}); 
									       htmlto4='<select class="text-center form-control selecttailorType6" ><option value="">请选择</option>'+html4+'</select>'
							      		  $(".few").html(htmlto4)
							      		 
							      		  //改变事件
							      		  $(".selecttailorType6").each(function(i,o){
							      				var id=	$(o).parent().data("few");
												$(o).val(id)
											})
											$(".selecttailorType6").change(function(i,o){
							      				var that=$(this);
							      				var tailorId=$(this).parent().parent().find(".selecttailorType6").val();
							      				var embroideryName=$(this).parent().parent().find(".selecttailorType6 option:selected").text();
							      				var dataeee={
							      						id:that.parent().parent().find('.selectid2').text(),
							      						few:embroideryName,
							      						productId:that.parent().parent().find('.selectid3').text(),
							      				}
							      				var index;
							      				 $.ajax({
												      url:"${ctx}/product/addEmbroidery",
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
								    
								    var data5 = {
											type:"embroideryNeedlesize",
										}
										var index;
									    var html5 = '';
									    var htmlto5= '';
									    $.ajax({
										      url:"${ctx}/product/getBaseOne",
										      data:data5,
										      type:"GET",
								      		  success: function (result) {
								      			 $(result.data).each(function(i,o){
								      				html5 +='<option value="'+o.name+'">'+o.name+'</option>'
								      			}); 
										       htmlto5='<select class="text-center form-control selecttailorType7" ><option value="">请选择</option>'+html5+'</select>'
								      		  $(".embroideryNeedlesize").html(htmlto5)
								      		 
								      		  //改变事件
								      		  $(".selecttailorType7").each(function(i,o){
								      				var id=	$(o).parent().data("embroideryneedlesize");
													$(o).val(id)
												})
												$(".selecttailorType7").change(function(i,o){
								      				var that=$(this);
								      				var tailorId=$(this).parent().parent().find(".selecttailorType7").val();
								      				var embroideryName=$(this).parent().parent().find(".selecttailorType7 option:selected").text();
								      				var dataeee={
								      						id:that.parent().parent().find('.selectid2').text(),
								      						embroideryNeedlesize:embroideryName,
								      						productId:that.parent().parent().find('.selectid3').text(),
								      				}
								      				var index;
								      				 $.ajax({
													      url:"${ctx}/product/addEmbroidery",
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
							
									    var data6 = {
												type:"embroideryWiresize",
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
									      				html6 +='<option value="'+o.name+'">'+o.name+'</option>'
									      			}); 
											       htmlto6='<select class="text-center form-control selecttailorType8" ><option value="">请选择</option>'+html6+'</select>'
									      		  $(".embroideryWiresize").html(htmlto6)
									      		 
									      		  //改变事件
									      		  $(".selecttailorType8").each(function(i,o){
									      				var id=	$(o).parent().data("embroiderywiresize");
														$(o).val(id)
													})
													$(".selecttailorType8").change(function(i,o){
									      				var that=$(this);
									      				var tailorId=$(this).parent().parent().find(".selecttailorType8").val();
									      				var embroideryName=$(this).parent().parent().find(".selecttailorType8 option:selected").text();
									      				var dataeee={
									      						id:that.parent().parent().find('.selectid2').text(),
									      						embroideryWiresize:embroideryName,
									      						productId:that.parent().parent().find('.selectid3').text(),
									      				}
									      				var index;
									      				 $.ajax({
														      url:"${ctx}/product/addEmbroidery",
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
										    
										    var data7 = {
													type:"color",
												}
												var index;
											    var html7 = '';
											    var htmlto7= '';
											    $.ajax({
												      url:"${ctx}/product/getBaseOne",
												      data:data7,
												      type:"GET",
										      		  success: function (result) {
										      			 $(result.data).each(function(i,o){
										      				html7 +='<option value="'+o.id+'">'+o.name+'</option>'
										      			}); 
												       htmlto7='<select class="text-center form-control selecttailorType9" ><option value="">请选择</option>'+html7+'</select>'
										      		  $(".embroideryColor").html(htmlto7)
														$(".selecttailorType9").change(function(i,o){
										      				var that=$(this);
										      				that.parent().parent().find('.selectbodyy').html(that.find("option:selected").text())
												    	   	that.parent().parent().find('.selectbody2').append(that.find("option:selected").text()+',')
										      				var name=""
										    					name=that.parent().parent().find('.selectbody2').text()
										    					name = name.substr(0,name.length-1);
										      			    var	dataeee={
										      			    		productId:that.parent().parent().find('.selectid3').text(),
										      			    		id:that.parent().parent().find('.selectid2').text(),
										      			    		embroideryColor:name
										      			    }
										      				var index;
										      				 $.ajax({
															      url:"${ctx}/product/addEmbroidery",
															      data:dataeee,
															      traditional: true,
															      type:"POST",
															      beforeSend:function(){
																		index = layer.load(1, {
																			  shade: [0.1,'#fff'] //0.1透明度的白色背景
																			});
																	},
																	success:function(result){
																		if(0==result.code){
																		layer.close(index);
																		var id=result.data.id
																		that.parent().parent().find('.selectid').text(id);
																		var data={
																				page:1,
																		  		size:100,	
																		  		productId:"",
																		}
																		self.loadPagination(data);
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
											    
											    $(".selectbodyy").on('click',function(){
													var id=$(this).parent().find('.selectid2').text();
													var productId=$(this).parent().find('.selectid3').text();
													var postData={
															id:id,
													}
													$.ajax({
														url:"${ctx}/product/getEmbroidery",
														data:postData,
														traditional: true,
														type:"GET",
														beforeSend:function(){
															index = layer.load(1, {
																  shade: [0.1,'#fff'] //0.1透明度的白色背景
																});
														},
														success:function(result){
														var name=result.data.rows[0].embroideryColor
														if(name==null){
															return ""
														}
														var name = name.split(",");
														var html=""
														for (var i = 0; i < name.length; i++) {
															var array_element = name[i];
															html+='<tr><td class="text-center edit name1">'+array_element+'</td>'
																+'<td class="text-center"><button class="btn btn-sm btn-danger btn-trans delete" data-id='+i+'>删除</button></td></tr>'
														}
														$("#tableworking2").html(html)
															layer.close(index);
														 $(".delete").on('click',function(){
															$(this).parent().parent().find(".name1").text("");
															$(this).parent().parent().find(".price1").text("");
															 var cutparts=new Array();
															  $('.name1').each(function(i,o){
																	 var a=$(this).text()
																	if(a!=""){
																		cutparts.push(a)
																	}
																 })
																 var postData={
													    			id:id,
													    			productId:productId,
													    			embroideryColor:cutparts,
													    		}
													    	   $.ajax({
																	url:"${ctx}/product/addEmbroidery",
																	data:postData,
																	traditional: true,
																	type:"POST",
																	beforeSend:function(){
																		index = layer.load(1, {
																			  shade: [0.1,'#fff'] //0.1透明度的白色背景
																			});
																	},
																	success:function(result){
																		if(0==result.code){
																			layer.msg("删除成功！", {icon: 1});
																		layer.close(index);
																		}else{
																			layer.msg("添加失败！", {icon: 2});
																			layer.close(index);
																		}
																	},error:function(){
																		layer.msg("操作失败！", {icon: 2});
																		layer.close(index);
																	}
																});
															
														}) 
														
														},error:function(){
															layer.msg("操作失败！", {icon: 2});
															layer.close(index);
														}
													});
													
													var dicDiv=$('#addworking');
													_index = layer.open({
														  type: 1,
														  skin: 'layui-layer-rim', //加上边框
														  area: ['30%', '70%'], 
														  btnAlign: 'c',//宽高
														  maxmin: true,
														  title:name,
														  content: dicDiv,
														  btn: ['确定', '取消'],
														  yes:function(index, layero){
															 
																 
															},
														  end:function(){
															  $('#addworking').hide();
															  $('.name1').text("")
															  layer.close(index);
														  }
													});
														
												})	
												
												var data8 = {
													
												}
												var index;
											    var html8 = '';
											    var htmlto8= '';
											    $.ajax({
												      url:"${ctx}/product/getBaseThree",
												      data:data8,
												      type:"GET",
										      		  success: function (result) {
										      			 $(result.data).each(function(i,o){
										      				html8 +='<option value="'+o.time+'">'+o.ordinaryLaser+'</option>'
										      			}); 
												       htmlto8='<select class="text-center form-control selecttailorType10" ><option value="">请选择</option>'+html8+'</select>'
										      		  $(".appliqueSize").html(htmlto8)
														$(".selecttailorType10").change(function(i,o){
										      				var that=$(this);
										      				that.parent().parent().find('.selectbodyy2').html(that.find("option:selected").text())
												    	   	that.parent().parent().find('.selectbody4').append(that.find("option:selected").text()+',')
												    	   	that.parent().parent().find('.selectbodyprice4').append(that.val()+',')
										      				var name=""
										      				var values=""
										    					name=that.parent().parent().find('.selectbody4').text()
										    					name = name.substr(0,name.length-1);
										      				values=that.parent().parent().find('.selectbodyprice4').text()
												    		values = values.substr(0,values.length-1);
										      			    var	dataeee={
										      			    		productId:that.parent().parent().find('.selectid3').text(),
										      			    		id:that.parent().parent().find('.selectid2').text(),
										      			    		appliqueSize:name,
										      			    		appliqueTime:values,
										      			    }
										      				var index;
										      				 $.ajax({
															      url:"${ctx}/product/addEmbroidery",
															      data:dataeee,
															      traditional: true,
															      type:"POST",
															      beforeSend:function(){
																		index = layer.load(1, {
																			  shade: [0.1,'#fff'] //0.1透明度的白色背景
																			});
																	},
																	success:function(result){
																		if(0==result.code){
																		layer.close(index);
																		var id=result.data.id
																		that.parent().parent().find('.selectid').text(id);
																		var data={
																				page:1,
																		  		size:100,	
																		  		productId:"",
																		}
																		self.loadPagination(data);
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
											    
											    
											    
											    $(".selectbodyy2").on('click',function(){
													var id=$(this).parent().find('.selectid2').text();
													var productId=$(this).parent().find('.selectid3').text();
													var postData={
															id:id,
													}
													$.ajax({
														url:"${ctx}/product/getEmbroidery",
														data:postData,
														traditional: true,
														type:"GET",
														beforeSend:function(){
															index = layer.load(1, {
																  shade: [0.1,'#fff'] //0.1透明度的白色背景
																});
														},
														success:function(result){
														var name=result.data.rows[0].appliqueSize
														var values=result.data.rows[0].appliqueTime
														if(name==null){
															return ""
														}
														var name = name.split(",");
														var values= values.split(",");
														var html=""
														for (var i = 0; i < name.length; i++) {
															var array_element = name[i];
															var array_element2 = values[i];
															html+='<tr><td class="text-center edit name1">'+array_element+'</td>'
															   +'<td class="text-center edit price1">'+array_element2+'</td>'
																+'<td class="text-center"><button class="btn btn-sm btn-danger btn-trans delete" data-id='+i+'>删除</button></td></tr>'
														}
														$("#tableworking3").html(html)
															layer.close(index);
														 $(".delete").on('click',function(){
															$(this).parent().parent().find(".name1").text("");
															$(this).parent().parent().find(".price1").text("");
															 var cutparts=new Array();
															 var valu=new Array();
															  $('.name1').each(function(i,o){
																	 var a=$(this).text()
																	if(a!=""){
																		cutparts.push(a)
																	}
																 })
																$('.price1').each(function(i,o){
																	 var b=$(this).text()
																	if(b!=""){
																		valu.push(b)
																	}
																 }) 
																 var postData={
													    			id:id,
													    			productId:productId,
													    			appliqueSize:cutparts,
													    			appliqueTime:valu,
													    		}
													    	   $.ajax({
																	url:"${ctx}/product/addEmbroidery",
																	data:postData,
																	traditional: true,
																	type:"POST",
																	beforeSend:function(){
																		index = layer.load(1, {
																			  shade: [0.1,'#fff'] //0.1透明度的白色背景
																			});
																	},
																	success:function(result){
																		if(0==result.code){
																			layer.msg("删除成功！", {icon: 1});
																		layer.close(index);
																		}else{
																			layer.msg("添加失败！", {icon: 2});
																			layer.close(index);
																		}
																	},error:function(){
																		layer.msg("操作失败！", {icon: 2});
																		layer.close(index);
																	}
																});
															
														}) 
														
														},error:function(){
															layer.msg("操作失败！", {icon: 2});
															layer.close(index);
														}
													});
													var dicDiv=$('#addworking2');
													_index = layer.open({
														  type: 1,
														  skin: 'layui-layer-rim', //加上边框
														  area: ['30%', '70%'], 
														  btnAlign: 'c',//宽高
														  maxmin: true,
														  title:name,
														  content: dicDiv,
														  btn: ['确定', '取消'],
														  yes:function(index, layero){
															 
																 
															},
														  end:function(){
															  $('#addworking2').hide();
															  $('.name1').text("")
															  $('.price1').text("")
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
				    			productId:productId,
				    	}
		      			var index;
				    	$.ajax({
						      url:"${ctx}/product/addEmbroidery",
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
						      			that.parent().parent().find(".priceDownRemark").text(parseFloat((o.priceDownRemark).toFixed(5)));
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
							productId:"6956",//传产品id
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
				      				html +='<option value="'+o.id+'" data-number='+o.number+'>'+o.tailorName+'</option>'
				      			}); 
						       htmlto='<select class="text-center form-control selecttailorType2" ><option value="">请选择</option>'+html+'</select>'
				      		  $(".embroideryName").html(htmlto)
				      		  //改变事件
				      		  $(".selecttailorType2").each(function(i,o){
				      				var id=	$(o).parent().data("needlesize");
									$(o).val(id)
								})
								$(".selecttailorType2").change(function(i,o){
				      				var that=$(this);
				      				var tailorId=$(this).parent().parent().find(".selecttailorType2").val();
				      				var embroideryName=$(this).parent().parent().find(".selecttailorType2 option:selected").text();
				      				var dataeee={
				      						id:that.parent().parent().find('.selectid').text(),
				      						embroideryName:embroideryName,
				      						tailorId:tailorId,
				      						productId: self.getCache(),
				      						number:$(this).parent().parent().find(".selecttailorType2 option:selected").data('number'),
				      				}
				      				var index;
				      				$.ajax({
									      url:"${ctx}/product/addEmbroidery",
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
												var id=result.data.id
												that.parent().parent().find('.selectid').text(id);
												var data={
														page:1,
												  		size:100,	
												  		productId:"",
												}
												self.loadPagination(data);
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
				
				$('.start').on('click',function(){
					  var  that=$(this);
					  var arr=new Array()//员工id
						$(this).parent().parent().parent().parent().parent().parent().parent().parent().find(".checkboxId:checked").each(function() { 
							arr.push($(this).val());   
						});
					   if(arr.length<=0){
							return layer.msg("至少选择一个！", {icon: 2});
						} 
						var data={
								ids:arr,
						}
						
						var index;
						 index = layer.confirm('确定一键删除吗', {btn: ['确定', '取消']},function(){
						$.ajax({
							url:"${ctx}/product/deleteEmbroidery",
							data:data,
				            traditional: true,
							type:"GET",
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
									  		productId:"",
									}
									self.loadPagination(data);
								}else{
									layer.msg(result.message, {icon: 2});
								}
								layer.close(index);
							},error:function(){
								layer.msg("操作失败！", {icon: 2});
								layer.close(index);
							}
						});
						 });
				  })
				
			//新增
				var html="";
				$('#addCutting').on('click',function(){
					 html='<tr><td  class="text-center"></td><td  class="text-center edit embroideryName"></td>'
					 +'<td class="text-center edit selectid hidden"></td>'
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
			}
   	}
   			var login = new Login();
				login.init();
			})
    
    </script>
  
       
</body>

</html>