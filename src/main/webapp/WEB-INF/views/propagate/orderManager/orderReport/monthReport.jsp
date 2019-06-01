<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE>
<html>
<head>
	<link rel="stylesheet" href="${ctx }/static/layui-v2.4.5/layui/css/layui.css" media="all">
	<script src="${ctx}/static/layui-v2.4.5/layui/layui.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售月报表</title>
<style>
</style>
</head>
<body>
<div class="layui-card">
	<div class="layui-card-body">
		<table class="layui-form">
			<tr>
				<td>查询时间:&nbsp;&nbsp;</td>
				<td><input type='text' id='time' class='layui-input' placeholder='请输入查询时间'></td>
				<td>&nbsp;&nbsp;</td>
				<td>单据类型:&nbsp;&nbsp;</td>
				<td><select id='type'><option value='0'>生产单</option>
										<option value='1'>针工单</option>
										<option value='2'>入库单</option>
										<option value='3'>出库单</option></select></td>
				<td>&nbsp;&nbsp;</td>
				<td><button type="button" class="layui-btn layui-btn-sm" id='search'>搜索</button></td>
			</tr>
		</table>
		<table class="layui-form" id="dayReport" lay-filter="dayReport"></table>
	</div>
</div>
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
		, table = layui.table 
		, laydate = layui.laydate
		, tablePlug = layui.tablePlug;
		
		form.render();
	 	laydate.render({
			elem:'#time',
			type: 'month',
		}) 
		$('#search').on('click',function(){
			var time=$('#time').val();
			var bengin=time+'-01 00:00:00';
			table.reload('dayReport',{
				url:'${ctx}/inventory/report/storageDay?report=2',
				where:{
					type: $('#type').val(),
					orderTimeBegin : bengin
				}
			})
		})
		table.render({
			elem:'#dayReport',
			loading:true,
			size:'sm',
			request:{ pageName:'page', limitName:'size' },
			totalRow:true,
			parseData:function(ret){
				return {  
					msg:ret.message, 
					code:ret.code ,
					data:ret.data,
					} },
			cols:[[
			       {align:'center', title:'时间',     totalRowText: '合计',   field:'time',	 },
			       {align:'center', title:'成交金额',   field:'sumPayment',	totalRow:true,style:"color:#ff000a;"},
			       {align:'center', title:'成交单数',   field:'singular',  totalRow:true, },
			       {align:'center', title:'实际邮费', 	field:'sumpostFee', totalRow:true,	},
			       {align:'center', title:'成交宝贝数量',   field:'proNumber',totalRow:true,	},
			       {align:'center', title:'每单平均金额',   field:'averageAmount',totalRow:true,	},
			       {align:'center', title:'广宣成本',   field:'sumCost',	totalRow:true,  style:"color:blue;"},
			       {align:'center', title:'利润',   field:'profits',	totalRow:true,  style:"color:#0fda87;"},
			       ]]
		})
		
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