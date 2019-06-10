<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE>
<html>
<head>
	<link rel="stylesheet" href="${ctx }/static/layui-v2.4.5/layui/css/layui.css" media="all">
	<script src="${ctx}/static/layui-v2.4.5/layui/layui.js"></script>
	<script src="${ctx}/static/js/vendor/jquery-3.3.1.min.js"></script>
	<script src="${ctx}/static/js/vendor/jquery.cookie.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品资料</title>
<style>
.layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
     top: 50%;
     transform: translateY(-50%);
}
</style>
</head>
<body>

<div class="layui-card">
	<div class="layui-card-body">
		<table class="layui-form">
			<tr>
				<td><select name=""><option value="skuCode">按商品编号查找</option></select></td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td><input type='text' name='skuCode' class='layui-input' placeholder='请输入查找信息'></td>
				<td>&nbsp;&nbsp;&nbsp;</td>
				<td><button type="button" class="layui-btn layui-btn-sm" lay-submit lay-filter="search">搜索</button></td>
			</tr>
		</table>
		<table class="layui-form" id="productTable" lay-filter="productTable"></table>
	</div>
</div>


</body>

<!-- 表格工具栏模板 -->
<script type="text/html" id="productTableToolbar">
<div>
	<span lay-event="add"  class="layui-btn layui-btn-sm" >新增商品</span>
	<span lay-event="update"  class="layui-btn layui-btn-sm" >修改商品</span>
	<span lay-event="delete"  class="layui-btn layui-btn-sm layui-btn-danger" >删除商品</span>
	<span class="layui-badge" >提示：双击查看库存</span>
</div>
</script>

</body>

<!-- 新增、修改商品模板 -->
<script type="text/html" id="addEditTpl">
<div class="layui-form" style="padding:10px;">
	<input type="hidden" name="id" value="{{d.id}}">
	<div class="layui-item">
		<label class="layui-form-label">商品编号</label>
		<div class="layui-input-block">
			<input class="layui-input" name="skuCode" value="{{d.skuCode}}" lay-verify="required">
		</div>
	</div>
	<div class="layui-item">
		<label class="layui-form-label">1688价/元</label>
		<div class="layui-input-block">
			<input class="layui-input" name="oseePrice" value="{{d.oseePrice}}">
		</div>
	</div>
	<div class="layui-item">
		<label class="layui-form-label">天猫价/元</label>
		<div class="layui-input-block">
			<input class="layui-input" name="tianmaoPrice" value="{{d.tianmaoPrice}}">
		</div>
	</div>
	<div class="layui-item">
		<label class="layui-form-label">线下价/元</label>
		<div class="layui-input-block">
			<input class="layui-input" name="offlinePrice" value="{{d.offlinePrice}}">
		</div>
	</div>
	<div class="layui-item">
		<label class="layui-form-label">商品重量/g</label>
		<div class="layui-input-block">
			<input class="layui-input" name="weight" value="{{d.weight}}">
		</div>
	</div>
	<div class="layui-item">
		<label class="layui-form-label">商品高度/cm</label>
		<div class="layui-input-block">
			<input class="layui-input" name="size" value="{{d.size}}">
		</div>
	</div>
	<div class="layui-item">
		<label class="layui-form-label">成本/元</label>
		<div class="layui-input-block">
			<input class="layui-input" name="cost" value="{{d.cost}}">
		</div>
	</div>
	<div class="layui-item">
		<label class="layui-form-label">广宣成本/元</label>
		<div class="layui-input-block">
			<input class="layui-input" name="propagandaCost" value="{{d.propagandaCost}}">
		</div>
	</div>
	<div class="layui-item">
		<label class="layui-form-label">材质</label>
		<div class="layui-input-block">
			<input class="layui-input" name="material" value="{{d.material}}">
		</div>
	</div>
	<div class="layui-item">
		<label class="layui-form-label">填充物</label>
		<div class="layui-input-block">
			<input class="layui-input" name="fillers" value="{{d.fillers}}">
		</div>
	</div>
	<div class="layui-item">
		<label class="layui-form-label">备注</label>
		<div class="layui-input-block">
			<input class="layui-input" name="remark" value="{{d.remark}}">
		</div>
	</div>
	<p style="text-align:center;"><button class="layui-btn layui-btn-sm" lay-submit lay-filter="sure">确定</button></p>
</div>
</script>
<script>
layui.config({
	base : '${ctx}/static/layui-v2.4.5/'
}).extend({
	tablePlug : 'tablePlug/tablePlug',
}).define(
	['tablePlug'],
	function(){
		var $ = layui.jquery
		, layer = layui.layer 				
		, form = layui.form			 		
		, table = layui.table 
		, laytpl = layui.laytpl
		, tablePlug = layui.tablePlug;
		
		var allInventory=[];
		getAllInventory();
		var cols=[[
					{align:'center', type:'checkbox',},
					{ title:'商品编号',   field:'skuCode',	width:'20%',},
					{ title:'商品高度',   field:'size',    width:'',},
					{ title:'商品重量', 	field:'weight', width:'',},
					{ title:'1688单价',   	field:'oseePrice',		width:'', },
					{ title:'天猫单价',   	field:'tianmaoPrice',	width:'',},
					{ title:'线下单价',   	field:'offlinePrice',	width:'',},
					{ title:'成本价', 		field:'cost',	width:'',},
					{ title:'广宣成本', 	field:'propagandaCost',	width:'',},
					{ title:'材质', 		field:'material',	},
					{ title:'填充物', 		field:'fillers',	},
					{ title:'备注', 		field:'remark',	},
		           ]];
		for(var i=0;i<allInventory.length;i++)
			cols[0].push({ title:allInventory[i].name, sort:true, templet : getInventoryNumber(allInventory[i].id),	})
		
		function getInventoryNumber(warehouseId){
			return function(d){
				var inv=d.inventorys;
				console.log(d.field)
				for(var j=0;j<inv.length;j++){
					if(inv[j].warehouse.id==warehouseId)
						return '<span style="color:blue;">'+inv[j].number+'</span>';
				}
				return '<span style="color:red;">无库存</span>';
			}
		}
		
		table.render({
			elem:'#productTable',
			url:'${ctx}/inventory/commodityPage',
			toolbar:'#productTableToolbar',
			loading:true,
			page:true,
			limits:[10,25,50,100],
			limit:100,
			request:{
				pageName:'page',
				limitName:'size'
			},
			parseData:function(ret){
				return {data:ret.data.rows,count:ret.data.total,msg:ret.message,code:ret.code }
			},
			cols:cols
		})
		
		form.on('submit(search)',function(obj){
			table.reload('productTable',{
				where:{skuCode:obj.field.skuCode},
				page: { curr : 1}
			})
		}) 
		table.on('toolbar(productTable)',function(obj){
			switch(obj.event){
			case 'add':		addEdit('add');		break;
			case 'update':	addEdit('edit'); 	break;
			case 'delete':	deletes();			break;
			}
		})
		
		function addEdit(type){
			var data={id:'',skuCode:'',weight:'',size:'',material:'',fillers:'',cost:'',propagandaCost:'',remark:'',tianmaoPrice:'',oseePrice:'',offlinePrice:''},
			choosed=layui.table.checkStatus('productTable').data,
			tpl=addEditTpl.innerHTML,
			title='新增商品',
			html='';
			if(type=='edit'){
				if(choosed.length>1){
					layer.msg("不能同时编辑多条信息",{icon:2});
					return;
				}
				if(choosed.length<1){
					layer.msg("至少选择一条信息编辑",{icon:2});
					return;
				}
				data=choosed[0];
				title="修改商品";
			}
			laytpl(tpl).render(data,function(h){
				html=h;
			})
			var addEditWin=layer.open({
				type:1,
				title:title,
				area:['40%','65%'],
				content:html
			})
			form.render();
			form.on('submit(sure)',function(obj){
				var load=layer.load(1);
				$.ajax({
					url:'${ctx}/inventory/addCommodity',
					type:'post',
					data:obj.field,
					success:function(result){
						if(0==result.code){
							table.reload('productTable');
							layer.close(addEditWin);
							layer.msg(result.message,{icon:1});
						}else
							layer.msg(result.message,{icon:2});
						layer.close(load);
					},
					error:function(){
						layer.msg("服务器异常");
						layer.close(load);
					}
				})
			})
		}
		function deletes(){
			var choosed=layui.table.checkStatus('productTable').data;
			if(choosed.length<1){
				layer.msg('请选择商品',{icon:2});
				return;
			}
			layer.confirm("是否确认删除？",function(){
				var ids='';
				for(var i=0;i<choosed.length;i++){
					ids+=(choosed[i].id+",");
				}
				var load=layer.load(1);
				$.ajax({
					url:"${ctx}/inventory/deleteCommodity",
					data:{ids:ids},
					success:function(result){
						if(0==result.code){
							layer.msg(result.message,{icon:1});
							table.reload('productTable');
						}
						else{
							layer.msg(result.message,{icon:2});
						}
						layer.close(load);
					},
					error:function(result){
						layer.msg('ajax异常',{icon:2});
						layer.close(load);
					}
				})
			})
		}
		function getAllInventory(){					//获取所有仓库
			$.ajax({
				url:'${ctx}/basedata/list?type=inventory',
				async:false,
				success:function(r){
					if(0==r.code){
						for(var i=0;i<r.data.length;i++){
							allInventory.push({ id:r.data[i].id,name:r.data[i].name});
						}
					}
				}
			})
		}
		$(document).on('click', '.layui-table-view tbody tr', function(event) {
			var elemTemp = $(this);
			var tableView = elemTemp.closest('.layui-table-view');
			var trIndex = elemTemp.data('index');
			tableView.find('tr[data-index="' + trIndex + '"]').find('[name="layTableCheckbox"]+').last().click();
		})
		//-----------------------cookie保存筛选列-----------------
		var COOKIENAME = 'productDataCookie';		//变量名，存放的cookie名
	 	readCookie();
	 	function readCookie(){							//读取cookie值并，设置筛选的字段
	 		var hideField = $.cookie(COOKIENAME);		//读取cookie
	 		if(hideField==undefined || hideField=='')	
	 			return;
	 		$('.layui-icon-cols').click();    			//打开筛选列
	 		var panel = $('.layui-table-tool-panel');	//筛选面板
	 		
	 		var hf = hideField.split(',');
	 		for(var i=0;i<hf.length;i++){
	 			panel.find('.layui-form-checkbox')[hf[i]].click();
	 		}
	 		$('.layui-table').click(); 					//关闭筛选列，随便点击一个地方即关闭
	 	}
	 	//$.removeCookie(COOKIENAME); 
	 	function saveCookie(event){						//保存用户筛选的设置
	 		if($.cookie(COOKIENAME)==undefined)
	 			$.cookie(COOKIENAME,'');
	 		var panel = $('.layui-table-tool-panel');				//筛选面板
	 		var leng = panel.find('.layui-form-checkbox').length-1;	//获取所有字段的总数
	 		var key='';												//根据点击的不同位置获取点击的索引,可点击div span i
	 		if(event.target.localName=='i')
	 			key = $(event.target).parent().parent().children("input:first-child").attr('data-key')
	 		else if(event.target.localName=='span')
	 			key = $(event.target).parent().parent().children("input:first-child").attr('data-key')
	 		else if(event.target.localName=='div')
	 			key = $(event.target).parent().children("input:first-child").attr('data-key');
	 		var hideField = $.cookie(COOKIENAME);
 			if(key==undefined){							//点击全选的时候
 				var hf=[];
 				if(hideField=='')
 					for(var i=0;i<leng;i++)
 						hf.push(i-(-1));				//第一个复选框为全选，因此需要加1
 				$.cookie(COOKIENAME, hf.join(','));
 			}else{
 				var hf = hideField==''?[]:hideField.split(',');			//
 				var i;
 				var index = (key.split('-'))[1]-(-1)
	 			for(i=0;i<hf.length;i++)
	 				if(hf[i] == index)
	 					break;
	 			if(i<hf.length)
	 				hf.splice(i,1);
	 			else
	 				hf.push(index);
	 			$.cookie(COOKIENAME, hf.join(','));
 			}
	 	}
	 	$(document).on('mousedown', '.layui-unselect', function (event) { 
	 		saveCookie(event);
	   	});
	 	//----------------------cookie结束----------------------------
	}//end define function
)//endedefine
</script>

</html>