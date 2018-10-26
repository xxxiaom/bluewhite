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
    <title>裁剪</title>
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
                                <h3 class="panel-title">工资详情</h3>
                                <div class="actions pull-right">
                                    <i class="fa fa-expand"></i>
                                    <i class="fa fa-chevron-down"></i>
                                </div>
                            </div>
                             <div class="panel-body">
                                <div class="tab-wrapper tab-primary">
                                    <ul class="nav nav-tabs col-md-12">
                                        <li class="active col-md-2" style="width: 14.285%"><a href="#home1" class="home1" data-toggle="tab">裁剪页面</a>
                                        </li>
                                        <li class="col-md-2"style="width: 14.285%;"><a href="#profile1" class="profile1"  data-toggle="tab">裁剪普通激光</a>
                                        </li>
                                        <li class="col-md-2"style="width: 14.285%"><a href="#profile2" class="profile2" data-toggle="tab">绣花定位激光</a>
                                        </li>
                                        <li class="col-md-2"style="width: 14.285%"><a href="#profile3" class="profile3" data-toggle="tab">冲床</a>
                                        </li>
                                        <li class="col-md-2"style="width: 14.285%"><a href="#profile4" class="profile4" data-toggle="tab">电烫</a>
                                        </li>
                                        <li class="col-md-2"style="width: 14.285%"><a href="#profile5" class="profile5" data-toggle="tab">电推</a>
                                        </li>
                                        <li class="col-md-2"style="width: 14.285%"><a href="#profile6" class="profile6" data-toggle="tab">手工剪刀</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="home1">
                                        <!--查询开始  -->
          		 <div class="row" style="height: 30px; margin:15px 0 10px">
					<div class="col-xs-8 col-sm-8  col-md-8">
						<form class="form-search" >
							<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12">
							<div class="input-group"> 
								<table><tr>
								<td>员工姓名:</td><td><input type="text" name="name" id="usernameth" placeholder="请输入姓名" class="form-control search-query name" /></td>
								<td>&nbsp&nbsp&nbsp&nbsp</td>
								<td>开始时间:</td>
								<td>
								<input id="startTimeth" placeholder="请输入考勤开始时间" class="form-control laydate-icon"
             					onClick="laydate({elem: '#startTimeth', istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"> 
								</td>
								<td>&nbsp&nbsp&nbsp&nbsp</td>
								<td>结束时间:</td>
								<td>
								<input id="endTimeth" placeholder="请输入考勤结束时间" class="form-control laydate-icon"
             					onClick="laydate({elem: '#endTimeth', istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
								</td>
								</tr></table> 
								<span class="input-group-btn">
									<button type="button" class="btn btn-info btn-square btn-sm btn-3d searchtaskth">
										查&nbsp找
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
                                        	<th class="text-center">裁剪部位</th>
                                        	<th class="text-center">裁剪片数</th>
                                            <th class="text-center">当批片数</th>
                                            <th class="text-center">裁片的平方M</th>
                                            <th class="text-center">裁剪方式</th>
                                            <th class="text-center">得到理论(市场反馈）含管理价值</th>
                                            <th class="text-center">得到实验推算价格</th>
                                            <th class="text-center">市场价与实推价比</th>
                                            <th class="text-center">选择入成本价格↓</th>
                                            <th class="text-center">入成本价格</th>
                                            <th class="text-center">各单道比全套工价</th>
                                            <th class="text-center">物料压价</th>
                                            <th class="text-center">不含绣花环节的为机工压价</th>
                                            <th class="text-center">含绣花环节的为机工压价</th>
                                            <th class="text-center">为机工准备的压价</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablecontent">
                                        
                                    </tbody>
                                    <thead>
                                        <tr>
                                       	    <td class="text-center">合计</td>
                                            <td class="text-center"></td>
                                            <td class="text-center" ></td>
                                            <td class="text-center" id="totale"></td>
                                            <td class="text-center" ></td>
                                            <td class="text-center" id="totaltw"></td>
                                            <td class="text-center" ></td>
                                            <td class="text-center"></td>
                                            
                                        </tr>
                                    </thead>
                                </table>
                                        </div>
                     <!-- B工资流水开始 -->
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
                                        	<th class="text-center">裁剪部位</th>
                                        	<th class="text-center">手选裁剪方式</th>
                                            <th class="text-center">裁片周长/CM(≈)</th>
                                            <th class="text-center">激光停顿点</th>
                                            <th class="text-center">单双激光头</th>
                                            <th class="text-center">捡片时间</th>
                                            <th class="text-center">其他未考虑时间1</th>
                                            <th class="text-center">其他未考虑时间2</th>
                                            <th class="text-center">拉布时间</th>
                                            <th class="text-center">单片激光需要用净时</th>
                                            <th class="text-center">单片激光放快手时间</th>
                                            <th class="text-center">工价（含快手)</th>
                                            <th class="text-center">设备折旧和房水电费</th>
                                            <th class="text-center">管理人员费用</th>
                                            <th class="text-center">普通激光切割该裁片费用</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablecontent2">
                                        
                                    </tbody>
                                </table>
                                 </div>
                                 <!-- B工资流水结束 -->
                 <div class="tab-pane" id="profile2">
                                     <!--查询开始  -->
          		 <div class="row" style="height: 30px; margin:15px 0 10px">
					<div class="col-xs-8 col-sm-8  col-md-8">
						<form class="form-search" >
							<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12">
							<div class="input-group"> 
								<table><tr><td>工序:</td><td><input type="text" name="number" id="numbertw" placeholder="请输入工序名" class="form-control search-query number" /></td>
								</tr></table> 
								<span class="input-group-btn">
									<button type="button" class="btn btn-info btn-square btn-sm btn-3d searchtasktw">
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
                                        	<th class="text-center">裁剪部位</th>
                                        	<th class="text-center">手选裁剪方式</th>
                                            <th class="text-center">裁片周长/CM(≈)</th>
                                            <th class="text-center">激光停顿点</th>
                                            <th class="text-center">单双激光头</th>
                                            <th class="text-center">捡片时间</th>
                                            <th class="text-center">其他未考虑时间1</th>
                                            <th class="text-center">其他未考虑时间2</th>
                                            <th class="text-center">拉布时间</th>
                                            <th class="text-center">单片激光需要用净时</th>
                                            <th class="text-center">单片激光放快手时间</th>
                                            <th class="text-center">工价（含快手)</th>
                                            <th class="text-center">设备折旧和房水电费</th>
                                            <th class="text-center">管理人员费用</th>
                                            <th class="text-center">普通激光切割该裁片费用</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablecontent3">
                                        
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


<div class="wrap">
<div class="layer-right" style="display: none;">
           <div class=" col-xs-12  col-sm-12  col-md-12">
				<div class="space-10"></div>
				<div style="height: 30px"></div>
				<form class="form-horizontal addDictDivTypeFormtw">
					<div class="row col-xs-12  col-sm-12  col-md-12" >
									<table>
                                        <tr>
                                       		<th class="text-center">当下周边地区激光每米/元:</th><td><input type="text" id="peripheralLaser"  class="form-control"></td>
                                       		<td><input type="text" id="ordid" class="hidden"></td>
                                       		<th><button type="button" class="btn btn-info  btn-sm  btn-trans updateord">修改</button></th>
                                       </tr>
                                       <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">激光机秒走CM?:</th><td><input type="text" id="extent"  class="form-control actualtimetw"></td>
                                            <th class="text-center">每CM 用时/秒:</th><td><input type="text" disabled="disabled" id="time"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">激光片每个停顿点用秒？:</th><td><input type="text"  id="pauseTime" class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">1.5M*1M拉布平铺时间:</th><td><input type="text" id="rabbTime"  class="form-control actualtimetw"></td>
                                            <th class="text-center">被/数:</th><td><input type="text" id="quilt"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">激光机放快手比:</th><td><input type="text"  id="quickWorker" class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">激光机设备价值:</th><td><input type="text"  id="worth" class="form-control actualtimetw"></td>
                                            <th class="text-center">每秒设备折旧费用:</th><td><input type="text" disabled="disabled" id="depreciation"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">设置分摊天数:</th><td><input type="text" id="shareDay"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">每天机器工作时间设置/小时:</th><td><input type="text" id="workTime"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">激光管费用:</th><td><input type="text" id="laserTubePrice"  class="form-control actualtimetw"></td>
                                            <th class="text-center">每秒激光管费用:</th><td><input type="text" disabled="disabled" id="laserTubePriceSecond"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">分摊小时:</th><td><input type="text" id="shareTime"  class="form-control actualtimetw"></td>
                                            <th class="text-center">每秒维护费用:</th><td><input type="text" disabled="disabled" id="maintenanceChargeSecond"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">维护费用:</th><td><input type="text" id="maintenanceCharge"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">分摊小时:</th><td><input type="text" id="shareTimeTwo"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">每小时耗电/元:</th><td><input type="text" id="omnHorElectric"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">每小时耗水/元:</th><td><input type="text" id="omnHorWater"  class="form-control actualtimetw"></td>
                                            <th class="text-center">每秒耗3费:</th><td><input type="text" disabled="disabled" id="perSecondPrice"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">每小时耗房租/元:</th><td><input type="text" id="omnHorHouse"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">每小时站机工价:</th><td><input type="text" id="omnHorMachinist"  class="form-control actualtimetw"></td>
                                            <th class="text-center">每秒工价:</th><td><input type="text" disabled="disabled" id="perSecondMachinist"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">制版分配任务管理人员工资:</th><td><input type="text" id="managePrice"   class="form-control actualtimetw"></td>
                                            <th class="text-center">每秒管理费用:</th><td><input type="text" disabled="disabled" id="perSecondManage"  class="form-control actualtimetw"></td>
                                        </tr>
                                        <tr><td><div style="height: 10px"></div></td></tr>
                                       <tr>
                                        	<th class="text-center">管理设备数量:</th><td><input type="text" id="manageEquipmentNumber"  class="form-control actualtimetw"></td>
                                            <th class="text-center">设置激光设备利润比:</th><td><input type="text" id="equipmentProfit"  class="form-control actualtimetw"></td>
                                        </tr>
                                    </table>
                    	</div>
                 		
				</form>
                 </div>
				</div>
  </div>
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
			  
			 var myDate = new Date(new Date().getTime() - 86400000);
				//获取当前年
				var year=myDate.getFullYear();
				//获取当前月
				var month=myDate.getMonth()+1;
				//获取当前日
				var date=myDate.getDate(); 
				var h=myDate.getHours();       //获取当前小时数(0-23)
				var m=myDate.getMinutes();     //获取当前分钟数(0-59)
				var s=myDate.getSeconds(); 
				var day = new Date(year,month,0);  
				var firstdate = year + '-' + '0'+month + '-01'+' '+'00:00:00';
				var lastdate = year + '-' + '0'+month + '-' + day.getDate() +' '+'23:59:59';
				$('#startTime').val(firstdate);
				$('#endTime').val(lastdate);
				$('#startTimetw').val(firstdate);
				$('#endTimetw').val(lastdate);
				$('#startTimeth').val(firstdate);
				$('#endTimeth').val(lastdate);
				var data={
						page:1,
				  		size:100,	
				  		productId:"",
				}
				var data2={
						page:1,
				  		size:100,	
				  		productId:"",
				  		tailorTypeId:71,
				}
				var data3={
						page:1,
				  		size:100,	
				  		productId:"",
				  		tailorTypeId:72,
				}
			this.init = function(){
				
				//注册绑定事件
				self.events();
				self.loadPagination(data);
				self.loadPagination2(data2);
				self.loadPagination3(data3);
			}
			//加载分页
			  this.loadPagination = function(data){
			    var index;
			    var html = '';
			    $.ajax({
				      url:"${ctx}/product/getTailor",
				      data:data,
				      type:"GET",
				      beforeSend:function(){
					 	  index = layer.load(1, {
						  shade: [0.1,'#fff'] //0.1透明度的白色背景
						  });
					  }, 
		      		  success: function (result) {
		      			 $(result.data.rows).each(function(i,o){
		      				 if(o.costPrice==o.managePrice || o.costPrice==o.experimentPrice){
		      					 
		      				 }else{
		      					o.costPrice=""
		      				 }
		      				 html +='<tr><td class="text-center reste"><label> <input type="checkbox" class="ace checkboxId" value="'+o.id+'"/><span class="lbl"></span></label></td>'
		      				+'<td class="text-center edit ">'+o.tailorName+'</td>'
		      				+'<td class="text-center edit ">'+o.tailorNumber+'</td>'
		      				+'<td class="text-center edit ">'+o.bacthTailorNumber+'</td>'
		      				+'<td class="text-center edit "><input class="form-control tailorSize"  value='+(o.tailorSize!=null?o.tailorSize:"")+'></td>'
		      				+'<td class="text-center edit tailorType" data-tailortypeid='+o.tailorTypeId+'></td>'
		      				+'<td class="text-center managePrice">'+(o.managePrice!=null?o.managePrice:"")+'</td>'
		      				+'<td class="text-center experimentPrice">'+parseFloat((o.experimentPrice*1).toFixed(5))+'</td>'
		      				+'<td class="text-center edit ratePrice">'+parseFloat((o.ratePrice*1).toFixed(4))+'</td>'
		      				+'<td class="text-center edit selectcostprice"><select class="form-control costPrice"><option value="'+(o.costPrice!=null?o.costPrice:"")+'">'+(o.costPrice!=null?o.costPrice:"")+'</option><option value="'+(o.managePrice!=null?o.managePrice:"")+'">'+(o.managePrice!=null?o.managePrice:"")+'</option><option value="'+(o.experimentPrice!=null?o.experimentPrice:"")+'">'+(o.experimentPrice!=null?o.experimentPrice:"")+'</option></select></td>'
		      				+'<td class="text-center edit allCostPrice">'+parseFloat((o.allCostPrice*1).toFixed(3))+'</td>'
		      				+'<td class="text-center edit scaleMaterial">'+parseFloat((o.scaleMaterial*1).toFixed(5))+'</td>'
		      				+'<td class="text-center edit ">'+parseFloat((o.priceDown*1).toFixed(4))+'</td>'
		      				+'<td class="text-center edit noeMbroiderPriceDown">'+parseFloat((o.noeMbroiderPriceDown*1).toFixed(4))+'</td>'
		      				+'<td class="text-center edit ">'+parseFloat((o.embroiderPriceDown*1).toFixed(4))+'</td>'
		      				+'<td class="text-center edit ">'+parseFloat((o.machinistPriceDown*1).toFixed(4))+'</td></tr>'
		      			}); 
					   	layer.close(index);
					   	 $("#tablecontent").html(html); 
					   self.loadEvents()
				      },error:function(){
							layer.msg("加载失败！", {icon: 2});
							layer.close(index);
					  }
				  });
			}
			  this.loadPagination2 = function(data2){
				  //裁剪普通激光
				  $(".profile1").on('click',function(){
					  var index;
					    var html = '';
					    $.ajax({
						      url:"${ctx}/product/getOrdinaryLaser",
						      data:data2,
						      type:"GET",
						      beforeSend:function(){
							 	  index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								  });
							  }, 
				      		  success: function (result) {
				      			 $(result.data.rows).each(function(i,o){
				      				 html +='<tr>'
				      				+'<td class="text-center edit ">'+o.tailorName+'</td>'
				      				+'<td class="text-center tailorType2" data-tailortypeid2='+o.tailorTypeId+'></td>'
				      				+'<td class="text-center"><input class="form-control perimeter2" data-id="'+o.id+'" style="width: 80px;" value='+(o.perimeter!=0?o.perimeter:"")+'></td>'
				      				+'<td class="text-center edit"><input class="form-control stallPoint2" data-id="'+o.id+'" style="width: 50px;" value='+(o.stallPoint!=0?o.stallPoint:"")+'></td>'
				      				+'<td class="text-center edit"><select class="form-control singleDouble2" data-id="'+o.id+'" data-singledouble="'+o.singleDouble+'" style="width: 100px;"><option value="3">请选择</option><option value="1">单</option><option value="2">双</option></select></td>'
				      				+'<td class="text-center"><input class="form-control time2" data-id="'+o.id+'" style="width: 50px;"  value='+(o.time!=null?o.time:"")+'></td>'
				      				+'<td class="text-center"><input class="form-control otherTimeOne2" data-id="'+o.id+'" style="width: 80px;" value='+(o.otherTimeOne!=null?o.otherTimeOne:"")+'></td>'
				      				+'<td class="text-center"><input class="form-control otherTimeTwo2" data-id="'+o.id+'" style="width: 80px;" value='+(o.otherTimeTwo!=null?o.otherTimeTwo:"")+'></td>'
				      				+'<td class="text-center edit rabbTime2">'+parseFloat((o.rabbTime).toFixed(5))+'</td>'
				      				+'<td class="text-center edit singleLaserTime2">'+parseFloat((o.singleLaserTime).toFixed(5))+'</td>'
				      				+'<td class="text-center edit singleLaserHandTime2">'+parseFloat((o.singleLaserHandTime).toFixed(5))+'</td>'
				      				+'<td class="text-center edit labourCost2">'+parseFloat((o.labourCost).toFixed(8))+'</td>'
				      				+'<td class="text-center edit equipmentPrice2">'+parseFloat((o.equipmentPrice).toFixed(5))+'</td>'
				      				+'<td class="text-center edit administrativeAtaff2">'+parseFloat((o.administrativeAtaff).toFixed(5))+'</td>'
				      				+'<td class="text-center edit stallPrice2">'+parseFloat((o.stallPrice).toFixed(5))+'</td></tr>'
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
			  
			  this.loadPagination3 = function(data3){
				  //绣花定位激光
				  $(".profile2").on('click',function(){
					  var index;
					    var html = '';
					    $.ajax({
						      url:"${ctx}/product/getOrdinaryLaser",
						      data:data3,
						      type:"GET",
						      beforeSend:function(){
							 	  index = layer.load(1, {
								  shade: [0.1,'#fff'] //0.1透明度的白色背景
								  });
							  }, 
				      		  success: function (result) {
				      			 $(result.data.rows).each(function(i,o){
				      				 html +='<tr>'
				      				+'<td class="text-center edit ">'+o.tailorName+'</td>'
				      				+'<td class="text-center tailorType3" data-tailortypeid2='+o.tailorTypeId+'></td>'
				      				+'<td class="text-center"><input class="form-control perimeter3" data-id="'+o.id+'" style="width: 80px;" value='+(o.perimeter!=0?o.perimeter:"")+'></td>'
				      				+'<td class="text-center edit"><input class="form-control stallPoint3" data-id="'+o.id+'" style="width: 50px;" value='+(o.stallPoint!=0?o.stallPoint:"")+'></td>'
				      				+'<td class="text-center edit"><select class="form-control singleDouble3" data-id="'+o.id+'" data-singledouble="'+o.singleDouble+'" style="width: 100px;"><option value="3">请选择</option><option value="1">单</option><option value="2">双</option></select></td>'
				      				+'<td class="text-center"><input class="form-control time3" data-id="'+o.id+'" style="width: 50px;"  value='+(o.time!=null?o.time:"")+'></td>'
				      				+'<td class="text-center"><input class="form-control otherTimeOne3" data-id="'+o.id+'" style="width: 80px;" value='+(o.otherTimeOne!=null?o.otherTimeOne:"")+'></td>'
				      				+'<td class="text-center"><input class="form-control otherTimeTwo3" data-id="'+o.id+'" style="width: 80px;" value='+(o.otherTimeTwo!=null?o.otherTimeTwo:"")+'></td>'
				      				+'<td class="text-center edit rabbTime3">'+parseFloat((o.rabbTime).toFixed(5))+'</td>'
				      				+'<td class="text-center edit singleLaserTime3">'+parseFloat((o.singleLaserTime).toFixed(5))+'</td>'
				      				+'<td class="text-center edit singleLaserHandTime3">'+parseFloat((o.singleLaserHandTime).toFixed(5))+'</td>'
				      				+'<td class="text-center edit labourCost3">'+parseFloat((o.labourCost).toFixed(8))+'</td>'
				      				+'<td class="text-center edit equipmentPrice3">'+parseFloat((o.equipmentPrice).toFixed(5))+'</td>'
				      				+'<td class="text-center edit administrativeAtaff3">'+parseFloat((o.administrativeAtaff).toFixed(5))+'</td>'
				      				+'<td class="text-center edit stallPrice3">'+parseFloat((o.stallPrice).toFixed(5))+'</td></tr>'
				      			}); 
							   	layer.close(index);
							   	 $("#tablecontent3").html(html); 
							   	 self.loadEvents3();
						      },error:function(){
									layer.msg("加载失败！", {icon: 2});
									layer.close(index);
							  }
						  });
				  })
			  }
			  
			  this.loadEvents3 = function(){
				  //调用基础数据
				  var data2 = {
							type:"embroideryLaser",
						}
				  var index;
				  $.ajax({
				      url:"${ctx}/product/getPrimeCoefficient",
				      data:data2,
				      type:"GET",
		      		  success: function (result) {
		      			 $(result.data).each(function(i,o){
		      			$("#ordid").val(o.id)
		      			$("#peripheralLaser").val(o.peripheralLaser)
		      			$("#extent").val(o.extent)
		      			$("#time").val(o.time)
		      			$("#pauseTime").val(o.pauseTime)
		      			$("#rabbTime").val(o.rabbTime)
		      			$("#quilt").val(o.quilt)
		      			$("#quickWorker").val(o.quickWorker)
		      			$("#worth").val(o.worth)
		      			$("#depreciation").val(o.depreciation)
		      			$("#shareDay").val(o.shareDay)
		      			$("#workTime").val(o.workTime)
		      			$("#laserTubePrice").val(o.laserTubePrice)
		      			$("#laserTubePriceSecond").val(o.laserTubePriceSecond)
		      			$("#shareTime").val(o.shareTime)
		      			$("#maintenanceChargeSecond").val(o.maintenanceChargeSecond)
		      			$("#maintenanceCharge").val(o.maintenanceCharge)
		      			$("#shareTimeTwo").val(o.shareTimeTwo)
		      			$("#omnHorElectric").val(o.omnHorElectric)
		      			$("#omnHorWater").val(o.omnHorWater)
		      			$("#perSecondPrice").val(o.perSecondPrice)
		      			$("#omnHorHouse").val(o.omnHorHouse)
		      			$("#omnHorMachinist").val(o.omnHorMachinist)
		      			$("#perSecondMachinist").val(o.perSecondMachinist)
		      			$("#managePrice").val(o.managePrice)
		      			$("#perSecondManage").val(o.perSecondManage)
		      			$("#manageEquipmentNumber").val(o.manageEquipmentNumber)
		      			$("#equipmentProfit").val(o.equipmentProfit)
		      			 }); 
		      		  },error:function(){
							layer.msg("加载失败！", {icon: 2});
							layer.close(index);
					  }
				  });
				  $(".updateord").on('click',function(){
					  var data={
					  	id:$("#ordid").val(),
					  	peripheralLaser:$("#peripheralLaser").val(),
					  	extent:$("#extent").val(),
					  	pauseTime:$("#pauseTime").val(),
					  	rabbTime:$("#rabbTime").val(),
					  	quilt:$("#quilt").val(),
					  	quickWorker:$("#quickWorker").val(),
					  	worth:$("#worth").val(),
					  	shareDay:$("#shareDay").val(),
					  	workTime:$("#workTime").val(),
					  	laserTubePrice:$("#laserTubePrice").val(),
					  	shareTime:$("#shareTime").val(),
					  	maintenanceCharge:$("#maintenanceCharge").val(),
					  	shareTimeTwo:$("#shareTimeTwo").val(),
					  	omnHorElectric:$("#omnHorElectric").val(),
					  	omnHorWater:$("#omnHorWater").val(),
					  	omnHorHouse:$("#omnHorHouse").val(),
					  	omnHorMachinist:$("#omnHorMachinist").val(),
					  	managePrice:$("#managePrice").val(),
					  	manageEquipmentNumber:$("#manageEquipmentNumber").val(),
					  	equipmentProfit:$("#equipmentProfit").val(),
					  }
					  $.ajax({
					      url:"${ctx}/product/updatePrimeCoefficient",
					      data:data,
					      type:"POST",
			      		  success: function (result) {
			      			 $(result.data).each(function(i,o){
			      				$("#time").val(o.time)
			      				$("#depreciation").val(o.depreciation)
			      				$("#laserTubePriceSecond").val(o.laserTubePriceSecond)
			      				$("#maintenanceChargeSecond").val(o.maintenanceChargeSecond)
			      				$("#perSecondPrice").val(o.perSecondPrice)
			      				$("#perSecondMachinist").val(o.perSecondMachinist)
			      				$("#perSecondManage").val(o.perSecondManage)
			      				if(0==result.code){
									layer.msg(result.message, {icon: 1});
									layer.close(index);
									}else{
										layer.msg(result.message, {icon: 2});
										layer.close(index);
									}
			      			}); 
			      		  },error:function(){
								layer.msg("加载失败！", {icon: 2});
								layer.close(index);sa
						  }
					  });
				  })
				  //遍历裁剪方式
				  var data = {
							type:"tailor",
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
						       htmlto='<select class="text-center form-control selecttailorType2" disabled="disabled"><option value="">请选择</option>'+html+'</select>'
				      		  $(".tailorType3").html(htmlto)
				      		  //改变事件
				      		  $(".selecttailorType2").each(function(i,o){
				      				var id=	$(o).parent().data("tailortypeid2");
									$(o).val(id)
								}) 
				      		  },error:function(){
									layer.msg("加载失败！", {icon: 2});
									layer.close(index);sa
							  }
						  });
					    $(".singleDouble2").each(function(j,k){
					      	var id=$(k).data("singledouble")
							$(k).val(id)
					}) 
					    $('.perimeter2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
					    
					    $('.stallPoint2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).parent().parent().find(".perimeter2").val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
					    
					    $('.singleDouble2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).parent().parent().find(".perimeter2").val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
					    
					    $('.time2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).parent().parent().find(".perimeter2").val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
					    
					    $('.otherTimeOne2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).parent().parent().find(".perimeter2").val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
					    
					    $('.otherTimeTwo2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).parent().parent().find(".perimeter2").val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
			  }
			  
			  
			  this.loadEvents2 = function(){
				  //调用基础数据
				  var data2 = {
							type:"ordinarylaser",
						}
				  var index;
				  $.ajax({
				      url:"${ctx}/product/getPrimeCoefficient",
				      data:data2,
				      type:"GET",
		      		  success: function (result) {
		      			 $(result.data).each(function(i,o){
		      			$("#ordid").val(o.id)
		      			$("#peripheralLaser").val(o.peripheralLaser)
		      			$("#extent").val(o.extent)
		      			$("#time").val(o.time)
		      			$("#pauseTime").val(o.pauseTime)
		      			$("#rabbTime").val(o.rabbTime)
		      			$("#quilt").val(o.quilt)
		      			$("#quickWorker").val(o.quickWorker)
		      			$("#worth").val(o.worth)
		      			$("#depreciation").val(o.depreciation)
		      			$("#shareDay").val(o.shareDay)
		      			$("#workTime").val(o.workTime)
		      			$("#laserTubePrice").val(o.laserTubePrice)
		      			$("#laserTubePriceSecond").val(o.laserTubePriceSecond)
		      			$("#shareTime").val(o.shareTime)
		      			$("#maintenanceChargeSecond").val(o.maintenanceChargeSecond)
		      			$("#maintenanceCharge").val(o.maintenanceCharge)
		      			$("#shareTimeTwo").val(o.shareTimeTwo)
		      			$("#omnHorElectric").val(o.omnHorElectric)
		      			$("#omnHorWater").val(o.omnHorWater)
		      			$("#perSecondPrice").val(o.perSecondPrice)
		      			$("#omnHorHouse").val(o.omnHorHouse)
		      			$("#omnHorMachinist").val(o.omnHorMachinist)
		      			$("#perSecondMachinist").val(o.perSecondMachinist)
		      			$("#managePrice").val(o.managePrice)
		      			$("#perSecondManage").val(o.perSecondManage)
		      			$("#manageEquipmentNumber").val(o.manageEquipmentNumber)
		      			$("#equipmentProfit").val(o.equipmentProfit)
		      			 }); 
		      		  },error:function(){
							layer.msg("加载失败！", {icon: 2});
							layer.close(index);
					  }
				  });
				  $(".updateord").on('click',function(){
					  var data={
					  	id:$("#ordid").val(),
					  	peripheralLaser:$("#peripheralLaser").val(),
					  	extent:$("#extent").val(),
					  	pauseTime:$("#pauseTime").val(),
					  	rabbTime:$("#rabbTime").val(),
					  	quilt:$("#quilt").val(),
					  	quickWorker:$("#quickWorker").val(),
					  	worth:$("#worth").val(),
					  	shareDay:$("#shareDay").val(),
					  	workTime:$("#workTime").val(),
					  	laserTubePrice:$("#laserTubePrice").val(),
					  	shareTime:$("#shareTime").val(),
					  	maintenanceCharge:$("#maintenanceCharge").val(),
					  	shareTimeTwo:$("#shareTimeTwo").val(),
					  	omnHorElectric:$("#omnHorElectric").val(),
					  	omnHorWater:$("#omnHorWater").val(),
					  	omnHorHouse:$("#omnHorHouse").val(),
					  	omnHorMachinist:$("#omnHorMachinist").val(),
					  	managePrice:$("#managePrice").val(),
					  	manageEquipmentNumber:$("#manageEquipmentNumber").val(),
					  	equipmentProfit:$("#equipmentProfit").val(),
					  }
					  $.ajax({
					      url:"${ctx}/product/updatePrimeCoefficient",
					      data:data,
					      type:"POST",
			      		  success: function (result) {
			      			 $(result.data).each(function(i,o){
			      				$("#time").val(o.time)
			      				$("#depreciation").val(o.depreciation)
			      				$("#laserTubePriceSecond").val(o.laserTubePriceSecond)
			      				$("#maintenanceChargeSecond").val(o.maintenanceChargeSecond)
			      				$("#perSecondPrice").val(o.perSecondPrice)
			      				$("#perSecondMachinist").val(o.perSecondMachinist)
			      				$("#perSecondManage").val(o.perSecondManage)
			      				if(0==result.code){
									layer.msg(result.message, {icon: 1});
									layer.close(index);
									}else{
										layer.msg(result.message, {icon: 2});
										layer.close(index);
									}
			      			}); 
			      		  },error:function(){
								layer.msg("加载失败！", {icon: 2});
								layer.close(index);sa
						  }
					  });
				  })
				  //遍历裁剪方式
				  var data = {
							type:"tailor",
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
						       htmlto='<select class="text-center form-control selecttailorType2" disabled="disabled"><option value="">请选择</option>'+html+'</select>'
				      		  $(".tailorType2").html(htmlto)
				      		  //改变事件
				      		  $(".selecttailorType2").each(function(i,o){
				      				var id=	$(o).parent().data("tailortypeid2");
									$(o).val(id)
								}) 
				      		  },error:function(){
									layer.msg("加载失败！", {icon: 2});
									layer.close(index);sa
							  }
						  });
					    $(".singleDouble2").each(function(j,k){
					      	var id=$(k).data("singledouble")
							$(k).val(id)
					}) 
					    $('.perimeter2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
					    
					    $('.stallPoint2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).parent().parent().find(".perimeter2").val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
					    
					    $('.singleDouble2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).parent().parent().find(".perimeter2").val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
					    
					    $('.time2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).parent().parent().find(".perimeter2").val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
					    
					    $('.otherTimeOne2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).parent().parent().find(".perimeter2").val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
					    
					    $('.otherTimeTwo2').blur(function(){
					    	var id=$(this).data("id");
					    	var that=$(this);
					    	var data={
					    		id:id,
					    		perimeter:$(this).parent().parent().find(".perimeter2").val(),
					    		stallPoint:$(this).parent().parent().find(".stallPoint2").val(),
					    		singleDouble:$(this).parent().parent().find(".singleDouble2").val(),
					    		time:$(this).parent().parent().find(".time2").val(),
					    		otherTimeOne:$(this).parent().parent().find(".otherTimeOne2").val(),
					    		otherTimeTwo:$(this).parent().parent().find(".otherTimeTwo2").val(),
					    	}
					    	$.ajax({
							      url:"${ctx}/product/addOrdinaryLaser",
							      data:data,
							      type:"POST",
					      		  success: function (result) {
					      			 $(result.data).each(function(i,o){
					      				that.parent().parent().find(".rabbTime2").text(parseFloat((o.rabbTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserTime2").text(parseFloat((o.singleLaserTime).toFixed(5)));
					      				that.parent().parent().find(".singleLaserHandTime2").text(parseFloat((o.singleLaserHandTime).toFixed(5)));
					      				that.parent().parent().find(".labourCost2").text(parseFloat((o.labourCost).toFixed(8)));
					      				that.parent().parent().find(".equipmentPrice2").text(parseFloat((o.equipmentPrice).toFixed(5)));
					      				that.parent().parent().find(".administrativeAtaff2").text(parseFloat((o.administrativeAtaff).toFixed(5)));
					      				that.parent().parent().find(".stallPrice2").text(parseFloat((o.stallPrice).toFixed(5)));
					      			}); 
					      		  },error:function(){
										layer.msg("加载失败！", {icon: 2});
										layer.close(index);
								  }
							  });
					    })
			  }
			this.loadEvents = function(){
				//遍历裁剪方式
				var data = {
						type:"tailor",
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
					       htmlto='<select class="text-center form-control selecttailorType"><option value="">请选择</option>'+html+'</select>'
			      		  $(".tailorType").html(htmlto)
			      		  //改变事件
			      		  $(".selecttailorType").each(function(i,o){
			      		var id=	$(o).parent().data("tailortypeid");
								$(o).val(id)
								}) 
			      		  $(".selecttailorType").change(function(){
			      			var that=$(this);
			      			var a=$(this).parent().prev().find(".tailorSize").val();
			      			var id=$(this).parent().prevAll().find(".checkboxId").val();
			      			  if(a==""){
			      				$(that).each(function(i,o){
									$(o).val("")
									}) 
			      				  return layer.msg("请先填写裁片的平方M", {icon: 2});
			      			  }
				    var	datae={
				    			tailorSize:a,
				    			tailorTypeId:$(this).val(),
				    			id:id,
				    	}
				    	$.ajax({
						      url:"${ctx}/product/getOrdinaryLaserDate",
						      data:datae,
						      type:"POST",
				      		  success: function (result) {
				      			 $(result.data).each(function(i,o){
				      			that.parent().parent().find(".managePrice").text(o.managePrice);
				      			that.parent().parent().find(".experimentPrice").text(parseFloat((o.experimentPrice).toFixed(5)));
				      			 }); 
				      			layer.close(index)
				      			var datar={
				      				id:id,
				      				tailorSize:a,
					    			tailorTypeId:that.val(),
					    			managePrice:result.data.managePrice,
					    			experimentPrice:result.data.experimentPrice,
					    			ordinaryLaserId:that.val(),
				      			}
				      			$.ajax({
								      url:"${ctx}/product/addTailor",
								      data:datar,
								      type:"POST",
						      		  success: function (result) {
						      			 $(result.data).each(function(i,o){
						      				if(0==result.code){
												layer.msg(result.message, {icon: 1});
												layer.close(index);
												}else{
													layer.msg(result.message, {icon: 2});
													layer.close(index);
												}
						      			 }); 
						      			layer.close(index)
						      			
						      			
								      },error:function(){
											layer.msg("加载失败！", {icon: 2});
											layer.close(index);
									  }
								  });
						      },error:function(){
									layer.msg("加载失败！", {icon: 2});
									layer.close(index);
							  }
						  });
				    		})
			      		  },error:function(){
								layer.msg("加载失败！", {icon: 2});
								layer.close(index);sa
						  }
					  });
				    
				    $(".costPrice").change(function(){
				    	var that=$(this);
		      			var a=$(this).parent().parent().find(".tailorSize").val();
		      			var id=$(this).parent().parent().find(".checkboxId").val();
		      			var selecttailorTypeid=$(this).parent().parent().find(".selecttailorType").val();
		      			var	datae={
				    			tailorSize:a,
				    			tailorTypeId:selecttailorTypeid,
				    			id:id,
				    			costPrice:$(this).val(),
				    	}
				    	$.ajax({
						      url:"${ctx}/product/getOrdinaryLaserDate",
						      data:datae,
						      type:"POST",
				      		  success: function (result) {
				      			 $(result.data).each(function(i,o){
				      			 that.parent().parent().find(".ratePrice").text(parseFloat((o.ratePrice).toFixed(5)));
				      			 that.parent().parent().find(".allCostPrice").text(parseFloat((o.allCostPrice).toFixed(3)));  
				      			that.parent().parent().find(".scaleMaterial").text(parseFloat((o.scaleMaterial).toFixed(5)));  
				      			that.parent().parent().find(".noeMbroiderPriceDown").text(parseFloat((o.noeMbroiderPriceDown).toFixed(5)));
				      			 }); 
				      			layer.close(index)
				      			var datar={
				      				id:id,
				      				ratePrice:result.data.ratePrice,
				      				allCostPrice:result.data.allCostPrice,
				      				scaleMaterial:result.data.scaleMaterial,
				      				costPrice:that.val(),
				      			}
				      			$.ajax({
								      url:"${ctx}/product/addTailor",
								      data:datar,
								      type:"POST",
						      		  success: function (result) {
						      			 $(result.data).each(function(i,o){
						      				if(0==result.code){
						      					
												layer.msg(result.message, {icon: 1});
												layer.close(index);
												}else{
													layer.msg(result.message, {icon: 2});
													layer.close(index);
												}
						      			 }); 
						      			layer.close(index)
						      			
						      			
								      },error:function(){
											layer.msg("加载失败！", {icon: 2});
											layer.close(index);
									  }
								  });
						      },error:function(){
									layer.msg("加载失败！", {icon: 2});
									layer.close(index);
							  }
						  });
				    })
				   
				    $(".tailorSize").blur(function(){
			      			var that=$(this);
			      			var a=$(this).parent().parent().find(".tailorSize").val();
			      			var id=$(this).parent().parent().find(".checkboxId").val();
			      			var selecttailorTypeid=$(this).parent().parent().find(".selecttailorType").val();
				    if(selecttailorTypeid==""){
				    	return "";
				    }
			      			var	datae={
				    			tailorSize:a,
				    			tailorTypeId:selecttailorTypeid,
				    			id:id,
				    	}
				    	$.ajax({
						      url:"${ctx}/product/getOrdinaryLaserDate",
						      data:datae,
						      type:"POST",
				      		  success: function (result) {
				      			 $(result.data).each(function(i,o){
				      			that.parent().parent().find(".managePrice").text(o.managePrice);
				      			that.parent().parent().find(".experimentPrice").text(parseFloat((o.experimentPrice).toFixed(5)));
				      			that.parent().parent().find(".selectcostprice").html("<select class='form-control costPrice2'><option value='0'>请选择</option><option value="+o.managePrice+">"+o.managePrice+"</option><option value="+o.experimentPrice+">"+o.experimentPrice+"</option></select>")
				      			 }); 
				      			layer.close(index)
				      			var experimentPrice=result.data.experimentPrice;
				      			var managePrice=result.data.managePrice;
				      			var datar={
				      				id:id,
				      				tailorSize:a,
					    			tailorTypeId:selecttailorTypeid,
					    			managePrice:result.data.managePrice,
					    			experimentPrice:result.data.experimentPrice,
					    			ordinaryLaserId:selecttailorTypeid,
				      			}
				      			$.ajax({
								      url:"${ctx}/product/addTailor",
								      data:datar,
								      type:"POST",
						      		  success: function (result) {
						      			 $(result.data).each(function(i,o){
						      				if(0==result.code){
						      					
												layer.msg(result.message, {icon: 1});
												layer.close(index);
												}else{
													layer.msg(result.message, {icon: 2});
													layer.close(index);
												}
						      			 }); 
						      			layer.close(index)
						      			
						      			
								      },error:function(){
											layer.msg("加载失败！", {icon: 2});
											layer.close(index);
									  }
								  });
				      			
				      			$(".costPrice2").change(function(){
				      				var that=$(this);
					      			var a=$(this).parent().parent().find(".tailorSize").val();
					      			var id=$(this).parent().parent().find(".checkboxId").val();
					      			var selecttailorTypeid=$(this).parent().parent().find(".selecttailorType").val();
					      			var	datae={
							    			tailorSize:a,
							    			tailorTypeId:selecttailorTypeid,
							    			id:id,
							    			costPrice:$(this).val(),
							    	}
							    	$.ajax({
									      url:"${ctx}/product/getOrdinaryLaserDate",
									      data:datae,
									      type:"POST",
							      		  success: function (result) {
							      			 $(result.data).each(function(i,o){
							      			 that.parent().parent().find(".ratePrice").text(parseFloat((o.ratePrice).toFixed(5)));
							      			 that.parent().parent().find(".allCostPrice").text(parseFloat((o.allCostPrice).toFixed(3)));  
							      			that.parent().parent().find(".scaleMaterial").text(parseFloat((o.scaleMaterial).toFixed(5)));  
							      			that.parent().parent().find(".noeMbroiderPriceDown").text(parseFloat((o.noeMbroiderPriceDown).toFixed(5)));
							      			 }); 
							      			layer.close(index)
							      			var datar={
							      				id:id,
							      				ratePrice:result.data.ratePrice,
							      				allCostPrice:result.data.allCostPrice,
							      				scaleMaterial:result.data.scaleMaterial,
							      				costPrice:that.val(),
							      			}
							      			$.ajax({
											      url:"${ctx}/product/addTailor",
											      data:datar,
											      type:"POST",
									      		  success: function (result) {
									      			 $(result.data).each(function(i,o){
									      				if(0==result.code){
									      					
															layer.msg(result.message, {icon: 1});
															layer.close(index);
															}else{
																layer.msg(result.message, {icon: 2});
																layer.close(index);
															}
									      			 }); 
									      			layer.close(index)
									      			
									      			
											      },error:function(){
														layer.msg("加载失败！", {icon: 2});
														layer.close(index);
												  }
											  });
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
			      			
				    		})
				    
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
				$(".searchtask").on('click',function(){
					$(".layer-right").css("display","block");
					var demo = new mSlider({
						dom:".layer-right",
						direction: "right",
						distance:"35%",
						
					})
					demo.open()
			
					
					
					
					
				})
			}
   	}
   			var login = new Login();
				login.init();
			})
    
    </script>
  
       
</body>

</html>