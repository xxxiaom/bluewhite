<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html class="no-js">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>考勤总汇</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="${ctx }/static/layui-v2.4.5/layui/css/layui.css"  media="all">
</head>

<body>
	<section id="main-wrapper" class="theme-default">
		<%@include file="../decorator/leftbar.jsp"%>
		<!--main content start-->
		<section id="main-content" class="animated fadeInUp">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">总汇信息</h3>
							<div class="actions pull-right">
								<i class="fa fa-expand"></i>
								<i class="fa fa-chevron-down"></i>
							</div>
						</div>
						
						<div class="panel-body">
							<table class="layui-hide"  lay-filter="test3" id="test">
							
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>

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
	<script src="${ctx }/static/js/vendor/typeahead.js"></script>
	<script src="${ctx }/static/js/laydate/laydate.js"></script>
	<script src="${ctx }/static/layui-v2.4.5/layui/layui.js"></script>
	<script>
	layui.use('table', function(){
		  var table = layui.table;
		  
		  table.render({
		    elem: '#test'
		    ,url:'${ctx}/personnel/getAllUser'
		    ,where: {address:'192.168.1.204'} 
		    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
		    , method:'GET'
		  ,parseData: function(res){ //res 即为原始返回的数据
          	res.data.code=0
              return {
                "code": res.data.code, //解析接口状态
                "msg": res.data.message, //解析提示文本
                "count": res.data.total, //解析数据长度
                "data": res.data //解析数据列表
              };
            }
		    ,cols: [[
		      {field:'number', width:'25%', title: '编号', sort: true,align: 'center'}
		      ,{field:'name', width:'25%', title: '用户名',align: 'center',edit: 'text'}
		      ,{field:'privilege', width:'25%',align: 'center',  title: '权限', sort: true,templet:function(d){
              	if(d.privilege=='3') return '管理员'; 
            	else if(d.privilege=='0') return '普通用户';}
				}
		      ,{field:'enabled', width:'17%',align: 'center', title: '是否启用'}
		      ,{fixed: 'right', title:'操作', align: 'center', toolbar: '#barDemo', width:150}
		    ]]
		    ,page: false
		  });
		  
		//监听单元格编辑
		  table.on('edit(test3)', function(obj){
		    var value = obj.value //得到修改后的值
		    ,data = obj.data //得到所在行所有键值
		    ,field = obj.field; //得到字段
		    var postData={
					number:data.number,
					[field]:value,
					address:'192.168.1.204',
					isPrivilege:data.privilege,
					enabled:data.enabled,
			}
		     $.ajax({
				url:"${ctx}/personnel/updateUser",
				data:postData,
				type:"GET",
				beforeSend:function(){
					index = layer.load(1, {
						  shade: [0.1,'#fff'] //0.1透明度的白色背景
						});
				},
				success:function(result){
					if(0==result.code){
						layer.msg('[ID: '+ data.number +'] ' + field + ' 字段更改为：'+ value); 
					layer.close(index);
					}else{
						layer.msg("修改失败！", {icon: 2});
						layer.close(index);
					}
				},error:function(){
					layer.msg("操作失败！", {icon: 2});
					layer.close(index);
				}
			}); 
		     
		  });
		
		  table.on('tool(test3)', function(obj){
			    var data = obj.data;
			    //console.log(obj)
			    if(obj.event === 'del'){
			      layer.confirm('真的删除行么', function(index){
			    	  var postData={
								number:data.number,
								address:'192.168.1.204',
						}
			    	  $.ajax({
							url:"${ctx}/personnel/deleteUser",
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
									obj.del();
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
			        layer.close(index);
			      });
			    }
		  });
		});
	
	
	</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs"  lay-event="del">删除</a>
</script>
</body>

</html>