<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE>
<html>
<head>
	<link rel="stylesheet" href="${ctx }/static/layui-v2.4.5/layui/css/layui.css" media="all">
	<script src="${ctx}/static/layui-v2.4.5/layui/layui.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生产单</title>
<style>
td{
	text-align:center;
}
.layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
     top: 50%;
     transform: translateY(-50%);
}
.layui-card .layui-table-cell{	/* 表格内容自动换行样式 */
	  height:auto; 
	  padding:0px; 
}
.layui-card  .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
     top: 50%;
     transform: translateY(0%);
}
.layui-table tbody tr:hover, .layui-table-hover {
	 background-color: transparent; 
}
</style>
</head>
<body>  

<!-- 主页面 -->
<div class="layui-card">
	<div class="layui-card-body">
		<table class="layui-form">
			<tr>
				<td>批次号:</td>
				<td><input type="text" class="layui-input" name="batchNumber" placeholder='请输入批次号'></td>
				<td>&nbsp;&nbsp;</td>
				<td>商品名:</td>
				<td><input type="text" class="layui-input" name="commodityName" placeholder='请输入商品名'></td>
				<td>&nbsp;&nbsp;</td>
				<td><select name="flag"><option value="">是否反冲</option><option value="1">反冲</option><option value="0" selected>未反冲</option></select>
				<td>&nbsp;&nbsp;</td>
				<td><span class="layui-btn" lay-submit lay-filter="search">搜索</span></td>
			</tr>
		</table>
		<table class="layui-table" id="productOrderTable" lay-filter="productOrderTable"></table>
	</div>
</div>

<!-- 添加订单隐藏框  -->
<div id="addOrderDiv" style="display:none;padding:10px;">
	<table class="layui-form layui-table"  lay-size="sm" lay-skin="nob"> 
		<tr><td>下单时间 <input type="hidden" name="type" value="0" ></td> <!-- 默认type类型为0，表示为生产单 -->
			<td><input type="text" class="layui-input" name="createdAt" id="addCreatedAt"  ></td>
			<td>经手人</td>
			<td><select name="userId" id='userIdSelectAdd' lay-search><option value="1" >获取数据中...</option></select></td>
			<td>数量</td>
			<td><input type="text" class="layui-input" name="number" id="addNumber" readonly value='0'></td></tr>
		<tr>
			<td>默认批次号</td>	
			<td><input type="text" class="layui-input" name="batchNumber" id="addBatchNumber"></td>
			<td>备注</td>
			<td><input type="text" name="remark" class="layui-input" id="addRemark"></td>
			<td colspan="2" style="text-align:right;"><span class="layui-btn" lay-submit lay-filter="sureAdd" >确定新增</span>
							<span class="layui-btn layui-btn-danger" id='resetAddOrder' >清空数据</span> </td></tr>
	</table>
	<table class="layui-table" id="productListTable" lay-filter="productListTable"></table>
</div>

<!-- 查看订单隐藏框  -->
<div id="lookoverOrderDiv" style="display:none;padding:10px;">
	<table class="layui-form layui-table" lay-size="sm" lay-skin="nob">
		<tr><td>下单时间</td>	
			<td><input type="text" class="layui-input" readonly id="look_createdAt"></td>
			<td>经手人</td>
			<td><input type="text" class="layui-input" readonly id="look_user" value='无经手人'></td>
			<td>总数量</td>
			<td><input type="text" class="layui-input" id="look_number" readonly></td></tr>
		<tr><td>备注</td>
			<td colspan="3"><input type="text" id="look_remark" class="layui-input" readonly></td></tr>
	</table>
	<table class="layui-table" id="lookOverProductListTable" lay-filter="lookOverProductListTable"></table>
</div>

<!-- 生成针工单隐藏框  -->
<div id="becomeOrderDiv" style="display:none;padding:10px;">
	<table class="layui-form layui-table" lay-size="sm" lay-skin="nob">
		<tr><td>下单时间<input type="hidden" name="type" value="1" >					<!-- 默认type类型为1，表示为针工单 -->	
					  <input type="hidden" name="id" id="becomeOrderId" ></td>		<!-- 生成针工单的生产单id。用于生产单数量的减少 -->
			<td><input type="text" class="layui-input" name="createdAt" id="becomeCreatedAt"  ></td>
			<td>经手人</td>
			<td><select name="userId" id='userIdSelectBecome' lay-search><option value="1" >获取数据中...</option></select></td>
			<td>默认生成针工单数量</td>
			<td><select lay-filter="defaultNumberSelect"><option value="zero">默认生成针工单数量为0</option><option value="all">全部生成针工单</option></select></tr>
		<tr><td>备注</td>
			<td colspan="3"><input type="text" name="remark" class="layui-input"></td>
			<td>操作</td>
			<td><span class="layui-btn" lay-submit lay-filter="sureBecome" >确定</span></td></tr>
	</table>
	<table class="layui-table" id="becomeProductListTable" lay-filter="becomeProductListTable"></table>
</div>

<!-- 商品选择隐藏框 -->
<div id="productChooseDiv" style="display:none;">
	<table class="layui-form layui-table" lay-size="sm" lay-skin="nob"  style="width:60%;">
		<tr>
			<td><select><option value="1">按商品名称查找</option></select></td>			
			<td><input type="text" class="layui-input" name="skuCode" placeholder="请输入查找的信息"></td>				
			<td><button type="button" class="layui-btn layui-btn-sm" lay-submit lay-filter="searchProduct" >搜索</button>				
				<button type="button" class="layui-btn layui-btn-sm" id="sure" >确定添加</button>
				<button type="button" class="layui-btn layui-btn-sm" id="addNewProduct" >添加新商品</button>	</td>
		</tr>
	</table>
	<table class="layui-table" id="productChooseTable" lay-filter="productChooseTable"></table>
</div>


<!-- 添加新商品隐藏框 -->
<form class="layui-form" style="display:none;padding:10px;" id="addNewProductWin">
<table style="width:100%;height:330px;">
	<tr><td>商品名称</td>
		<td><input type="text" class="layui-input" lay-verify="required"	name="skuCode"></td>
		<td>1688批发价/元</td>
		<td><input type="text" class="layui-input" 		name="OSEEPrice"></td></tr>
	<tr><td>天猫单价/元</td>
		<td><input type="text" class="layui-input" 		name="tianmaoPrice"> </td>
		<td>线下批发价/元</td>
		<td><input type="text" class="layui-input" 		name="offlinePrice"></td></tr>
	<tr><td>商品重量/g</td>
		<td><input type="text" class="layui-input" 		name="weight" ></td>
		<td>商品高度/cm</td>
		<td><input type="text" class="layui-input" 		name="size" ></td></tr>
	<tr><td>商品成本/元</td>
		<td><input type="text" class="layui-input" 		name="cost"></td>
		<td>广宣成本/元</td>
		<td><input type="text" class="layui-input" 		name="propagandaCost" ></td></tr>
	<tr><td>商品填充物</td>
		<td><input type="text" class="layui-input" name="fillers"></td>
		<td>商品材质</td>
		<td><input type="text" class="layui-input" name="material"></td></tr>
	<tr><td>备注</td>
		<td colspan="3"><textarea type="text" class="layui-input" name="remark"></textarea></td></tr>
	<tr><td colspan="4"><button type="reset"   class="layui-btn layui-btn-sm layui-btn-danger">清空</button>
						<button type="button"  class="layui-btn layui-btn-sm"  lay-submit lay-filter="sureAddNew">确定</button></td></tr>
</table>
</form>

<!-- 生产单表格工具栏 -->
<script type="text/html" id="productOrderTableToolbar" >
<div  class="layui-button-container">
	<span lay-event="add"  class="layui-btn layui-btn-sm" >新增生产单</span>
	<span lay-event="becomeNeedle"  class="layui-btn layui-btn-sm" >生成针工单</span>
	<span lay-event="delete"  class="layui-btn layui-btn-sm layui-btn-danger" >一键反冲</span>
	<span class="layui-badge" >小提示：双击查看详细信息</span>
</div>
</script>

<!-- 商品列表表格工具栏 -->
<script type="text/html" id="productListTableToolbar" >
<div  class="layui-button-container">
	<span lay-event="add"  class="layui-btn layui-btn-sm" >新增商品</span>
	<span lay-event="delete"  class="layui-btn layui-btn-sm layui-btn-danger" >删除商品</span>
</div>
</script>

<!-- 是否反冲转换模板 -->
<script type="text/html" id="flagTpl">
	{{# var color=d.flag==1?'':'green';
		var msg=d.flag==1?'反冲数据':'未反冲';}}
	<span class="layui-badge layui-bg-{{ color }}">{{ msg }}</span>
</script>
</body>
<script>
layui.config({
	base : '${ctx}/static/layui-v2.4.5/'
}).extend({
	tablePlug : 'tablePlug/tablePlug',
}).define(
	['tablePlug','laydate'],
	function(){
		var $ = layui.jquery
		, layer = layui.layer 				
		, form = layui.form	
		, laydate = layui.laydate
		, table = layui.table 
		, tablePlug = layui.tablePlug;
		
		var chooseProductWin;		//选择商品弹窗
		var allUser = [];
		var currUser = {id:''};       		//当前用户
		var searchBatchNumber = '';			//记录搜索使用的数据，用于过滤筛选子单数据
		var searchCommodityName = '';
		getAllUser();
		getCurrUser();
		
		form.render();
		table.render({				//渲染主页面单表格
			elem:'#productOrderTable',
			url:'${ctx}/inventory/procurementPage?type=0&flag=0',
			toolbar:'#productOrderTableToolbar',
			loading:true,
			page:{},
			request:{pageName:'page',limitName:'size'},
			parseData:function(ret){ return {data:ret.data.rows,count:ret.data.total,msg:ret.message,code:ret.code}},
			cols:[[
			       {align:'center', type:'checkbox',},
			       {align:'center', title:'单据编号',   	field:'documentNumber',width:'10%',	},
			       {align:'center', title:'计划数量', field:'number', width:'4%',},
			       {align:'center', title:'剩余数量', field:'residueNumber', width:'4%',},
			       {align:'center', title:'经手人',	templet:'<p>{{ d.user.userName }}</p>',width:'4%',},
			       {align:'center', title:'是否反冲', 	field:'flag', templet:'#flagTpl',width:'4%',},
			       {align:'center', title:'日期',   	field:'createdAt',	width:'9%',},
				   {align:'center', title:'批次号',	  templet: orderContent('batchNumber'),   width:'10%'	,},
				   {align:'center', title:'商品名',	  templet: orderContent('skuCode'),		  width:'18%'	,},
				   {align:'center', title:'计划数量',  templet: orderContent('number'),		  width:'4%',	},
				   {align:'center', title:'剩余数量',  templet: orderContent('residueNumber'), width:'4%'	,},
				   {align:'center', title:'备注', 	  templet: orderContent('childRemark'),   	}
			       ]]
		})
		function orderContent(field){
			return function(d){
				var html = '<table style="width:100%;" class="layui-table">';
				for(var i=0;i<d.procurementChilds.length;i++){
					var t=d.procurementChilds[i];
					var style = 'border-right:none;';
					if(t.batchNumber.indexOf(searchBatchNumber)==-1 || t.commodity.skuCode.indexOf(searchCommodityName)==-1)
						continue;
					if(i==d.procurementChilds.length-1)
						style += 'border-bottom:none;';
					if(field == 'childRemark')
						style += 'text-align:left;';
					html+='<tr><td style="'+style+'">'+ (field == 'skuCode' ? t.commodity[field] : t[field]) +'&nbsp;</td></tr>';
				}
				return html+'</table>';
			}
		}
		
		table.on('toolbar(productOrderTable)',function(obj){	//监听单表格按钮
			switch(obj.event){
			case 'add':			add();			break;
			case 'delete':		deletes();		break;
			case 'becomeNeedle':becomeNeedle(); break;
			}
		})
		
		table.on('rowDouble(productOrderTable)',function(obj){
			lookover(obj.data);
		})
		form.on('submit(search)',function(obj){
			obj.field.batchNumber = obj.field.batchNumber.trim();
			obj.field.commodityName = obj.field.commodityName.trim();
			searchBatchNumber = obj.field.batchNumber;
			searchCommodityName = obj.field.commodityName;
			table.reload('productOrderTable',{
				where:obj.field,
				page: {  curr: 1   },
				url:'${ctx}/inventory/procurementPage?type=0',
			})
		})
		
		function deletes(){							//删除生产单表格
			var choosed=layui.table.checkStatus('productOrderTable').data;
			if(choosed.length<1){
				layer.msg('请选择生产单',{icon:2,offset:'100px',});
				return;
			}
			for(var i=0;i<choosed.length;i++)
				if(choosed[i].flag==1){
					layer.msg('该订单已反冲，请勿重复反冲',{icon:2,offset:'100px',});
					return;
				}
			layer.confirm('是否确认反冲？',{offset:'100px',},function(){
				var ids='';
				for(var i=0;i<choosed.length;i++)
					ids+=(choosed[i].id+',');
				var load=layer.load(1);
				$.ajax({
					url:'${ctx}/inventory/deleteProcurement?ids='+ids,
					success:function(result){
						if(0==result.code){
							table.reload('productOrderTable');
							layer.msg(result.message,{icon:1,offset:'100px',});
						}else
							layer.msg(result.message,{icon:2,offset:'100px',});
						layer.close(load);
					}
				})
			})
		}
		
		//-------生成针工单功能---------------
		laydate.render({ elem:'#becomeCreatedAt', type:'datetime' })
		var becomeProduct=[];			//生成针工单时，所选中的生产单的子订单集合
		var defaultBecomeNumber='zero';	//默认转单数量模式
		function becomeNeedle(){
			becomeProduct=[];			//清空之前的数据
			$('#becomeOrderId').val('');
			var choosed = layui.table.checkStatus('productOrderTable').data;
			var msg='';
			if(choosed.length<1)
				msg='请选择信息';
			else if(choosed.length>1)
				msg='无法同时使用多条信息生产针工单';
			else if(choosed[0].flag==1)
				msg='已反冲的数据无法进行转换';
			if(msg!=''){
				layer.msg(msg,{icon:2,offset:'100px',});
				return
			}
			$('#becomeOrderId').val(choosed[0].id);		//设置被转成针工单的生产单id
			layer.open({
				type : 1,
				title:'生成针工单',
				offset:'30px',
				area : ['90%','90%'],
				content:$('#becomeOrderDiv'),
			})
			table.render({									//渲染选择后的商品表格
				elem:'#becomeProductListTable',
				page:{},
				loading:true,
				cols:[[
				       {type:'checkbox', align:'center', fixed:'left'},
				       {align:'center', title:'批次号',   field:'batchNumber',},
				       {align:'center', title:'商品名称', templet:'<p>{{ d.commodity.skuCode }}</p>',},
				       {align:'center', title:'商品数量', field:'number', },
				       {align:'center', title:'剩余数量', field:'residueNumber'},
				       {align:'center', title:'生成针工单数量',    style:'color:blue', field:'becomeNumber', 	 edit:true,},
				       {align:'center', title:'针工单备注',  	  style:'color:blue', field:'becomeChildRemark', edit:true}, 
				       ]]
			})
			becomeProduct=choosed[0].procurementChilds;
			getUserSelect(currUser.id,'userIdSelectBecome');
			$('#become_bacthNumber').val(choosed[0].batchNumber);
			for(var i=0;i<becomeProduct.length;i++){
				becomeProduct[i].becomeNumber=(defaultBecomeNumber=='all'?becomeProduct[i].residueNumber:0);
				becomeProduct[i].becomeChildRemark='';
			}
			table.reload('becomeProductListTable',{ data : becomeProduct })
		}
		form.on('select(defaultNumberSelect)',function(obj){
			defaultBecomeNumber=obj.value
			for(var i=0;i<becomeProduct.length;i++)
				becomeProduct[i].becomeNumber=(defaultBecomeNumber=='all'?becomeProduct[i].residueNumber:0);
			table.reload('becomeProductListTable',{data : becomeProduct});
		})
		form.on('submit(sureBecome)',function(obj){
			var choosed = layui.table.checkStatus('becomeProductListTable').data;
			if(choosed.length<1){
				layer.msg('请勾选需要生成针工单的信息',{icon:2,offset:'100px',});
				return;
			}
			var c=[];       //用于存放提取真正需要的数据
			var allNumber=0;
			for(var i=0;i<choosed.length;i++){
				var t=choosed[i];
				if(t.becomeNumber==0){
					layer.msg('转单商品数量不能为0',{icon:2,offset:'100px',});
					return;
				}
				c.push({						//真正需要传参的只有这三个参数，去除不必要的参数传递
					commodityId :	t.commodity.id,
					number :		t.becomeNumber,
					batchNumber : 	t.batchNumber,
					childRemark :	t.becomeChildRemark
				})
				allNumber-=(-t.becomeNumber);	//使用+号会拼接成字符串，无法完成正常计算
			}
			var data=obj.field;	//表单field中有batchNumber、userId、remark、type，其他的参数需要手动设置
			data.number=allNumber;
			data.commodityNumber=JSON.stringify(c);		
			var load = layer.load(1);
			$.ajax({
				url:"${ctx}/inventory/addProcurement",
				type:"post",
				data:data,			
				success:function(result){
					if(0==result.code){
						layer.closeAll();
						table.reload('productOrderTable');
						layer.msg(result.message,{icon:1,offset:'100px',});
					}else{
						layer.msg(result.message,{icon:2,offset:'100px',});
					}
					layer.close(load);
				},
				error:function(){
					layer.msg("服务器异常",{icon:2,offset:'100px',});
					layer.close(load);
				}
			})
		})
		table.on('edit(becomeProductListTable)', function(obj){  //首先判断数据的合法性，如果合法则更新到渲染表格的数据中，非法则忽略，最后重载表格，若数据没更新则还原为之前的状态，取消非法的修改
			if(obj.field=='becomeNumber'){
				if(isNaN(obj.value))
					layer.msg("修改无效！请输入正确的数字",{icon:2,offset:'100px',});
				else if(obj.value=='')
					layer.msg('转成针工单的数量不能为空',{icon:2,offset:'100px',});
				else if(obj.value<0)
					layer.msg('转成针工单的数量不能小于0',{icon:2,offset:'100px',});
				else if(obj.value%1 !== 0)
					 layer.msg('转成针工单的数量必须为整数',{icon:2,offset:'100px',});
				else{
					for(var i=0;i<becomeProduct.length;i++){
						 if(becomeProduct[i].id==obj.data.id){		
							 if(obj.value>becomeProduct[i].residueNumber)
								 layer.msg('转成针工单的数量不能大于剩余数量',{icon:2,offset:'100px',});
							 else
							 	 becomeProduct[i].becomeNumber=parseInt(obj.value);
						 	break;
						}
					}
				}
			}else{
				for(var i=0;i<becomeProduct.length;i++){
					 if(becomeProduct[i].id==obj.data.id){			
						 becomeProduct[i].becomeChildRemark=obj.data.becomeChildRemark;
					 	break;
					}
				}
			}
			table.reload('becomeProductListTable',{
				data:becomeProduct
			})
		});
		//-------查看生产单功能--------------------
		function lookover(data){
			if(data.type==undefined)				//防止空数据弹窗bug，双击详细内容时
				return;
			layer.open({
				type : 1,
				title : '查看生产单',
				offset:'30px',
				area : ['90%','90%'],
				content : $('#lookoverOrderDiv')
			})
			table.render({									//渲染选择后的商品表格
				elem:'#lookOverProductListTable',
				data:data.procurementChilds,
				page:{},
				loading:true,
				cols:[[
					   {align:'center', title:'批次号',   field:'batchNumber',},
				       {align:'center', title:'商品名称',  templet:'<p>{{ d.commodity.skuCode }}</p>'},
				       {align:'center', title:'数量',     field:'number',},
				       {align:'center', title:'剩余数量', field:'residueNumber'},
				       {align:'center', title:'备注', 	  field:'childRemark',}, 
				       ]]
			})
			$('#look_createdAt').val(data.createdAt);
			$('#look_remark').val(data.remark);
			$('#look_number').val(data.number);
			if(data.user!=null)
				$('#look_user').val(data.user.userName);
		}
		//-------新增生产单功能---------------
		laydate.render({ elem:'#addCreatedAt', type:'datetime' });
		var choosedProduct=[];		//用户已经选择上的产品,渲染新增单的产品表格数据
		function add(){										//新增单
			//choosedProduct=[];								//清空已选中的商品内容
			layer.open({
				type : 1,
				title : '新增生产单',
				offset:'30px',
				area : ['90%','90%'],
				content : $('#addOrderDiv')
			})
			getUserSelect(currUser.id,'userIdSelectAdd');
			table.render({									//渲染选择后的商品表格
				elem:'#productListTable',
				toolbar:'#productListTableToolbar',
				data:[],
				loading:true,
				page:{},
				cols:[[
				       {type:'checkbox', align:'center', fixed:'left'},
				       {align:'center', title:'批次号',   field:'batchNumber', edit:true,style:'color:blue', },
				       {align:'center', title:'商品名称', field:'skuCode',},
				       {align:'center', title:'数量',     field:'number', edit:true,style:'color:blue', },
				       {align:'center', title:'备注',  	  field:'childRemark', edit:true,style:'color:blue', }, 
				       ]]
			})
			table.reload('productListTable',{ data : choosedProduct });
		}
		$('#addBatchNumber').change(function(){			//默认批次号改变
			for(var i=0;i<choosedProduct.length;i++){
				choosedProduct[i].batchNumber=$('#addBatchNumber').val();
			}
			table.reload('productListTable',{ data : choosedProduct });
		})
		table.on('toolbar(productListTable)',function(obj){		//监听选择商品表格的工具栏按钮
			switch(obj.event){
			case 'add': openChooseProductWin(); break;
			case 'delete':deleteChoosedProduct();break;
			}
		})
		table.on('edit(productListTable)', function(obj){ 			//监听编辑表格单元
			if(obj.field=='number'){
				var msg='';
				if(isNaN(obj.value))
					msg="修改无效！请输入正确的数字";
				else if(obj.value=='')
					msg='计划的数量不能为空';
				else if(obj.value<0)
					msg='计划的数量不能小于0';
				else if(obj.value%1 !== 0)
					msg='计划的数量必须为整数';
				for(var i=0;i<choosedProduct.length;i++){
					if(choosedProduct[i].id==obj.data.id){		
						if(msg!=''){
							layer.msg('"'+obj.value+'" 为非法输入！'+msg,{icon:2,offset:'100px',});
							$(this).val(1)
							choosedProduct[i].number=1;
							return;
						}
						$('#addNumber').val($('#addNumber').val()-choosedProduct[i].number-(-parseInt(obj.value)));
						$(this).val(parseInt(obj.value))
						choosedProduct[i].number=parseInt(obj.value);
						return;
					}
				}
			}else{
				for(var i=0;i<choosedProduct.length;i++){
					 if(choosedProduct[i].id==obj.data.id){		//重新对该行的相关数据进行计算
						if(obj.field=='childRemark')
						 	choosedProduct[i].childRemark=obj.data.childRemark;
						else if(obj.field=='batchNumber')
							choosedProduct[i].batchNumber=obj.data.batchNumber;
					 	layer.msg('修改成功！',{icon:1,offset:'100px',});
					 	break;
					}
				}
			}
		});
		form.on('submit(sureAdd)',function(obj){					//确定添加生产单
			var data=obj.field;
			if(choosedProduct.length==0){
				layer.msg("请选择商品",{icon:2,offset:'100px',});
				return;
			}
			var child=[],allNum=0;
			for(var i=0;i<choosedProduct.length;i++){
				if(choosedProduct[i].batchNumber.replace(/(^\s*)|(\s*$)/g, '')==''){
					layer.msg('商品批次号不可省略！',{icon:2,offset:'100px',});
					return;
				}
				for(var j=0;j<choosedProduct.length;j++){
					var item = choosedProduct[j];
					if( item.id != choosedProduct[i].id && item.commodityId == choosedProduct[i].commodityId && item.batchNumber == choosedProduct[i].batchNumber){
						layer.msg('相同的商品不能同时使用相同的批次号！',{icon:2,offset:'100px',});
						return;
					}
				}
				child.push({batchNumber : choosedProduct[i].batchNumber.replace(/(^\s*)|(\s*$)/g, ''),
							commodityId : choosedProduct[i].commodityId,
							number : choosedProduct[i].number,
							childRemark : choosedProduct[i].childRemark});
			}
			data.commodityNumber=JSON.stringify(child);			//子列表商品
			var load = layer.load(1);
			$.ajax({
				url:"${ctx}/inventory/addProcurement",
				type:"post",
				data:data,			
				success:function(result){
					if(0==result.code){
						$('#resetAddOrder').click();
						layer.closeAll();
						table.reload('productOrderTable');
						layer.msg(result.message,{icon:1,offset:'100px',});
					}else{
						layer.msg(result.message,{icon:2,offset:'100px',});
					}
					layer.close(load);
				},
				error:function(){
					layer.msg("服务器异常",{icon:2,offset:'100px',});
					layer.close(load);
				}
			})
		}) 
	
		//选择商品隐藏框的按钮监听.添加商品弹窗共4个按钮监听。搜索、添加新商品、确定添加
		$('#sure').on('click',function(){	
			if(sureChoosed())											//如果选择成功
				layer.close(chooseProductWin);							
		})
		
		$('#resetAddOrder').on('click',function(){			//此处如果加confirm提示。则新增成功时无法清空
			$('#addRemark').val('');
			$('#addBatchNumber').val('');
			$('#addCreatedAt').val('');
			$('#addNumber').val(0);
			choosedProduct=[];	
			getUserSelect(currUser.id,'userIdSelectAdd');
			table.reload('productListTable',{ data:choosedProduct })
		})
		form.on('submit(searchProduct)',function(obj){
			table.reload('productChooseTable',{
				where:obj.field,
				page: {  curr: 1   }
			})
		})
		
		//----添加新商品功能--------------
		$('#addNewProduct').on('click',function(){						
			openAddNewPorductWin();
		})

		form.on('submit(sureAddNew)',function(obj){			
			var load=layer.load(1);
			$.ajax({
				url:'${ctx}/inventory/addCommodity',
				type:"post",
				data:obj.field,
				success:function(result){
					if(0==result.code){
						table.reload('productChooseTable');
						layer.close(addNewPorductWin);
						layer.msg(result.message,{icon:1,offset:'100px',});
					}
					else
						layer.msg(result.message,{icon:2,offset:'100px',});
					layer.close(load);
				},
				error:function(result){
					layer.msg('发生未知错误',{icon:2,offset:'100px',});
					layer.close(load);
				}
			})
		})
		function deleteChoosedProduct(){								//删除商品
			var choosed = layui.table.checkStatus('productListTable').data;
			if(choosed.length==0){
				layer.msg("请选择商品删除",{icon:2,offset:'100px',});
				return;
			}
			for(var i=0;i<choosed.length;i++){
				for(var j=0;j<choosedProduct.length;j++){
					if(choosed[i].id==choosedProduct[j].id){
						$('#addNumber').val($('#addNumber').val()-choosedProduct[j].number);
						choosedProduct.splice(j,1);
						break;
					}
				}
			}
			table.reload('productListTable',{ data:choosedProduct, })
		}
		function openChooseProductWin(){					//商品选择隐藏框
			chooseProductWin = layer.open({		
				type:1,
				title:'选择产品',
				offset:'60px',
				area:['80%','80%'],
				content:$('#productChooseDiv'),
			})
			table.render({
				elem:'#productChooseTable',
				url:'${ctx}/inventory/commodityPage',
				loading:true,
				page:true,
				request:{
					pageName:'page',
					limitName:'size'
				},
				parseData:function(ret){	
					return{ code:ret.code, msg:ret.message, data:ret.data.rows, count:ret.data.total,}},
				cols:[[
				       {type:'checkbox', align:'center', fixed:'left'},
				       {align:'center', title:'商品名称', field:'skuCode',},
				       {align:'center', title:'成本', 	  field:'cost',},
				       {align:'center', title:'广宣成本', 	  field:'propagandaCost',}, 
				      ]],
			});
			form.render();
		}
		var choosedId=0;	//由于可以选择不同的商品进行不同的批次号选择，因此原本的商品id无法作为唯一标识，因此相同的商品可能多次选择，因此需要添加一个字段作为标识
		function sureChoosed(){					//确定商品选择
			var choosed=layui.table.checkStatus('productChooseTable').data;
			if(choosed.length<1){
				layer.msg("请选择相关商品",{icon:2,offset:'100px',});
				return false;
			}
	 		for(var i=0;i<choosed.length;i++){
				var orderChild={
						skuCode : choosed[i].skuCode,			//商品名称
						commodityId : choosed[i].id,		//商品id
						number : 1,						//商品数量
						cost : choosed[i].cost,			//成本
						remark : choosed[i].remark,		//备注
						batchNumber : $('#addBatchNumber').val(),
						id : choosedId++,  //仅仅用于标识不同的数据
				};
				$('#addNumber').val($('#addNumber').val()-(-1));
				choosedProduct.push(orderChild);
			}
			table.reload('productListTable',{ data:choosedProduct });
			layer.msg('添加成功',{icon:1,offset:'100px',});
			return true;
		}
		function getAllUser(){
			$.ajax({
				url:'${ctx}/system/user/pages?size=999',
				success:function(r){
					if(0==r.code){
						for(var i=0;i<r.data.rows.length;i++)
							allUser.push({
								id:			r.data.rows[i].id,
								userName:	r.data.rows[i].userName
							})
					}
				}
			})
		}
		function getCurrUser(){
			$.ajax({
				url:'${ctx}/getCurrentUser',
				success:function(r){
					if(0==r.code)
						currUser = r.data;
				}
			})
		}
		function getUserSelect(id,select){
			var html='';
			for(var i=0;i<allUser.length;i++){
				var selected=( id==allUser[i].id?'selected':'' );
				html+='<option value="'+allUser[i].id+'" '+selected+'>'+allUser[i].userName+'</option>';
			}
			$('#'+select).html(html);
			form.render();
		}
		function openAddNewPorductWin(){		//添加新产品窗口
			addNewPorductWin = layer.open({								
				type:1,
				title:'添加产品',
				offset:'80px',
				content:$('#addNewProductWin'),
				area:['60%','60%']
			})
			form.render();
		}
		
		$(document).on('click', '.layui-table-view tbody tr', function(event) {
			var elemTemp = $(this);
			var tableView = elemTemp.closest('.layui-table-view');
			var trIndex = elemTemp.data('index');
			tableView.find('tr[data-index="' + trIndex + '"]').find('[name="layTableCheckbox"]+').last().click();
		})
		
	}//end define function
)//endedefine
</script>
</html>