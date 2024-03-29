<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html class="no-js">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

	<link rel="stylesheet" href="${ctx }/static/layui-v2.4.5/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="${ctx }/static/layui-v2.4.5/formSelect/formSelects-v4.css" />
	<script src="${ctx}/static/layui-v2.4.5/layui/layui.js"></script>
	<script src="${ctx }/static/js/vendor/jquery-3.3.1.min.js"></script> 
<title>角色管理</title>
<style type="text/css">
.treeMenuDiv{				/* 菜单穿梭框样式  */
	width:40%;
	height:80%;
	border:1px solid #e2e2e2;
	overflow:auto;
	padding:10px;
	margin:12px;
}
.treeMenuControl{
	margin:auto;
	margin-top:150px;
	width:8%;
	text-align:center;
	word-break: break-word;
}
</style>
</head>
<body>
	
<div class="layui-card">
	<div class="layui-card-body">
		<div id="LAY-role-table" class="table_th_search" lay-filter="LAY-role-table"></div>
	</div>
</div>


<!-- 编辑、添加角色模板  -->
<script type="text/html" id="editRoleTempl">
<div class="layui-form" id="editRoleDiv" style="padding:20px;"> 
  <div class="layui-form-item">
  <input type="hidden" id="editRoleId" placeholder="请输入" autocomplete="off" lay-verify="required" value="{{ d.id }}" class="layui-input">
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">角色名</label>
    <div class="layui-input-block">
      <input type="text" id="editRoleName" placeholder="请输入" autocomplete="off" lay-verify="required" value="{{ d.name }}" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">英文名称</label>
    <div class="layui-input-block">
      <input type="text" id="editRole" placeholder="请输入" autocomplete="off" lay-verify="required" value="{{ d.role }}" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">角色类型</label>
    <div class="layui-input-block">
      <select id="editRoleType" lay-filter="aihao">
      	<option value="管理员">管理员</option>
		<option value="超级管理员">超级管理员</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">是否可用</label>
    <div class="layui-input-block">
      <input type="checkbox" lay-skin="switch" id="editIsShow" lay-text="可用|不可用" {{ d.isShow==true?'checked':'' }} >
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">请填写描述</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" class="layui-textarea" id="editDescription">{{ d.description }}</textarea>
    </div>
  </div>
</div>
</script>
<!-- 权限等级样式模板 -->
<script type="text/html" id="permissionLevelDiv">
	{{# var arr=d.permissionNames.split(",");
			layui.each(arr, function(index, item){  }}
		<span class="layui-badge layui-bg-green">{{item}}</span>&nbsp;&nbsp;
	{{# }); }}
</script>
<!-- 角色表格工具栏  -->
<script type="text/html" id="toolbarDemo">
  	<div class="layui-btn-container layui-inline">
   		<span class="layui-btn layui-btn-sm layui-btn-danger" lay-event="deleteRole">批量删除</span>
    	<span class="layui-btn layui-btn-sm" lay-event="addRole">添加角色</span>
	</div>
</script>
<!-- 角色表格按钮 -->
<script type="text/html" id="aboutPermission">
	<button type="button" class="layui-btn layui-btn-sm" lay-event="lookOverPermission">查看权限</button>
	<button type="button" class="layui-btn layui-btn-sm" lay-event="editRole">编辑</button>
</script>	
<script>

var allMenu=[];    			//所有的menus接口菜单,用于添加权限时的级联拼接
var permissionLevel=[];   //用于存放相关的权限等级

layui.config({
	base : '${ctx}/static/layui-v2.4.5/'
}).extend({
	tablePlug : 'tablePlug/tablePlug',
	formSelects : 'formSelect/formSelects-v4',
	menuTree : 'layui/myModules/menuTree'
}).define(
	[ 'tablePlug','jquery','formSelects','menuTree'],
	function() {
		var $ = layui.jquery
		, formSelects = layui.formSelects	//多选下拉框插件
		, layer = layui.layer 				//弹层
		, form = layui.form			 		//表单
		, table = layui.table 				//表格
		, tablePlug = layui.tablePlug 		//表格插件
		, menuTree = layui.menuTree 
		, laytpl = layui.laytpl;			//模板引擎
		
		getMenu();   			//获取菜单，添加权限级联时使用
		getPermissionLevel();   //获取权限等级
		formSelects.btns('select1', ['select', 'remove', 'reverse']);
		table.render({
			elem : '#LAY-role-table',
			size : 'lg',
			url : '${ctx}/roles/page' ,
			request:{ pageName: 'page' ,limitName: 'size' 		 },
			page : {},       			
			loading : true,     		
			toolbar : '#toolbarDemo',	
			parseData : function(ret) {   
				return { code : ret.code, msg : ret.msg, count : ret.data.total, data : ret.data.rows }
			},
			cols : [ 
			[   {type: 'checkbox',align : 'center',fixed: 'left'},
				{field : "id",title : "ID",width : 80,sort : true,align : 'center'}, 
				{field : "name",title : "角色名",align : 'center'}, 
				{field : "role",title : "英文名称",align : 'center'}, 
				{field : "roleType",title : "角色类型",align : 'center',type: 'normal',templet:'<p>管理员</p>'}, 
				{field : "isShow",title : "是否可用",align : 'center',templet : '<p>{{ d.isShow == true ? "是" : "否" }} </p>'},
				{field : "description",title : "具体描述",align : 'center'},
				{title : "操作",templet : "#aboutPermission",align : 'center'}
			] ] 
		});

		table.on('tool(LAY-role-table)',function(obj){   						//监听表格按钮,obj为监听该行的对象
			switch(obj.event){
				case 'lookOverPermission':lookOverPermission(obj.data);break;  	//查看角色权限
				case 'editRole':editRole(obj.data); break;						//编辑角色
			}
		})

	    table.on('toolbar(LAY-role-table)', function (obj) { 	//监听头工具栏事件
			var tableId = obj.config.id;  						//用于获取复选框按钮选中，用于删除事件
			switch (obj.event) {
			  case 'addRole': addRole();						//新增角色
								break;
			  case 'deleteRole':  								// 获得当前选中的，不管它的状态是什么？只要是选中的都会获得
				  				deleteRole(tableId);  			//删除角色
				     			break;
			}
	    });
		
		/* 以下是对各个方法的调用 ******************************************************************************************************************************************/ 
		/* 以下是对各个方法的调用 ******************************************************************************************************************************************/
		
		function addRole(){  										 	//添加角色方法
			var data={
				id:'',name:'',role:'',isShow:false,description:''		//使用空数据对模板渲染，得到空弹窗
			};				
			var html='';
			var tpl=editRoleTempl.innerHTML;     						//进行模板渲染，将渲染的结果作为弹出窗的内容
			laytpl(tpl).render(data,function(h){
				html=h;
			})
        	var addRole=layer.open({
	        		type: 1,
		            title: '添加角色',
		            area:['30%','60%'],
		            content:html,
		            btn:["确定",'取消'],
		            yes:function(){
		            	var load=layer.load(1);
						var role={
								name:$('#editRoleName').val(),								//角色名
								role:$('#editRole').val(),									//角色英文名
								roleType:$('#editRoleType').val(),							//角色类型
								isShow:document.getElementById("editIsShow").checked?1:0,  	//是否有用
								description:$('#editDescription').val()						//具体描述
						}
						$.ajax({
  							url:"${ctx}/roles/add",
  							type:"post",
  							data:role,
  							success:function(result){
  								if(0==result.code){
  									layer.msg("添加成功" ,{icon: 1});		//返回的message为空。
  									table.reload('LAY-role-table');
  									layer.close(addRole); 					//关闭添加角色的窗口
  								}else
  									layer.msg(result.data, {icon: 2});		//返回的message为空。结果放在data中
  							}
  						})  
						layer.close(load);		//关闭加载
  					}
  				})
  				form.render();					//渲染表单，否则开关与下拉框不显示
   		}
		function editRole(data){  				//修改角色方法
			var html='';
			var tpl=editRoleTempl.innerHTML;    //进行模板渲染，将渲染的结果作为弹出窗的内容
			laytpl(tpl).render(data,function(h){
				html=h;
			})
			var edit=layer.open({
				title:'编辑角色信息'
				,type:1
				,btn:['确定','取消']
				,area:['30%','60%']
				,content:html
				,yes:function(){
					var load=layer.load(1);
					var updateName=false;						//记录名字是否修改
					if(data.name!=$('#editRoleName').val()){ 	//判断角色名是否进行了修改
						var res=$.ajax({  						//判断角色名是否存在
							url:'${ctx}/roles/exists?name='+$('#editRoleName').val(),
							type:"post",
							async:false,
							success:function(result){
								if(3000==result.code){
									updateName=true;
								}
							}
						})
					}
					if(updateName){
						layer.msg("该角色名已存在",{icon:2});
						layer.close(load);
						return;
					}
					var role={
						id:$('#editRoleId').val(),			//当前角色id
						name:$('#editRoleName').val(),		//角色名
						role:$('#editRole').val(),			//角色英文名
						roleType:$('#editRoleType').val(),	//角色类型
						isShow:document.getElementById("editIsShow").checked?1:0,  //是否有用
						description:$('#editDescription').val()	//具体描述
					};
					$.ajax({
						url:"${ctx}/roles/update",
						type:"post",
						data:role,
						success:function(result){
							if(result.code==0){
								layer.msg("修改成功",{icon:1});
								layer.close(edit);
							}
							else
								layer.msg(result.code+" "+result.message,{icon:2});
							table.reload('LAY-role-table');
							layer.close(load);
						}
					})
					
				}
			})
			form.render();
		}
		function deleteRole(tableId){    	//删除角色方法
			var deleteData={   			 	
			  ids: tablePlug.tableCheck.getChecked(tableId)
			}
			if(deleteData.ids==''){ layer.msg('请选择相关数据',{icon:2});return; }
			layer.confirm('您是否确定要删除选中的条记录？', function () {
			 	var load=layer.load(1);   //打开加载层
			  	$.ajax({
			  		url:"${ctx}/roles/delete",
			  		type:"get",
			  		data:deleteData,
			  		traditional:true,     	//阻止深度序列化参数对象
			  		success:function(result){ 
			  			if(result.code==0){
			  				layer.msg(result.message,{icon:1});
			  				table.reload('LAY-role-table');
			  			}
			  			else
			  				layer.msg(result.message,{icon:2});
			  			layer.close(load);
			  		},
			  		error:function(result){
			  			layer.msg(result.message,{icon:2});
			  			layer.close(load);
			  		}
			  	})
			 
			});
        }
		function lookOverPermission(data){  		//查看角色权限方法
			var roleId=data.id;						//角色id
			var aboutPermission=layer.open({     	//打开查看权限内容的弹窗
				   title: '查看角色权限：'+data.name
				   ,type:1
				   ,area: ['80%', '90%']
				   ,content:'<div class="table_th_search" lay-filter="lookOverPermissions" id="lookOverPermissions"></div>'  //permissionTable
				   ,end:function(){
					   $('#lookOverPermissions').css("display","none");
				   }
			});
			
			table.render({     //查看权限的表格
				elem:'#lookOverPermissions',
				url:"${ctx}/getRole?id="+data.id,
				toolbar:'<div class="layui-btn-container layui-inline"><span class="layui-btn layui-btn-sm" lay-event="add" data-roleid="'+data.id+'">添加权限</span></div>',
				cols:[[
					       {field:'id',title:'id',align:'center'},
					       {field:'createdAt',title:'创建时间',align:'center'},
					       {field:'menuName',title:'菜单名',align:'center'},
					       {field:'permissionNames',title:'权限等级',templet:'#permissionLevelDiv',align:'center'},
					       {field:'updatedAt',title:'更新时间',align:'center'},
					       {title:'操作',align:'center',templet:'<div class="layui-btn-container layui-inline">'+
					    	   									'<span class="layui-btn layui-btn-sm" lay-event="edit">编辑</span>&nbsp;&nbsp;'+
					    	   									'<span class="layui-btn layui-btn-sm" lay-event="remove">删除</span></div>'}
				       ]],
				id:'lookOverPermissions'
			})	
			table.on('tool(lookOverPermissions)',function(obj){    	//监听表格中的按钮tool 
				switch(obj.event){
					case 'edit':  editPermission(obj);   break;     		//编辑权限
					case 'remove': removePermission(obj); break;			//删除权限
				}
			})
		 	table.on('toolbar(lookOverPermissions)', function (obj) {  //监听表格中的工具栏按钮toolbar
					switch(obj.event){
					case 'add': 
								var roleId=$(this).data('roleid');
								addPermission(roleId);						//新增权限
								break;
				}
			})
			function editPermission(obj){   								//编辑权限,obj当前所在行对象，可根据obj.data获取所在行信息
				var array=(obj.data.permissionNames).split(",");			//将权限字符串分割为数组
				var html='<p>权限id：'+obj.data.id+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;菜单名：'+obj.data.menuName+'</p><select name="permissionLevelSelect "'+
						 'xm-select="selectId'+obj.data.id+'" xm-select-show-count="5">';  //xm-select-show-count="5", 超出后隐藏
				for(var i=0;i<permissionLevel.length;i++){   
					var selected='';
					for(var j=0;j<array.length;j++){
						if(array[j]==permissionLevel[i].name)
							selected='selected';
					}
					html+='<option '+selected+' value="'+permissionLevel[i].id+'" >'+permissionLevel[i].name+'</option>';
				}
				html+="</select>"; 
				var editPer=layer.open({
					title:'编辑权限'
					,type:1
				 	,area: ['40%', '40%']
					,content:html
					,btn: ['确认', '取消']
					,yes:function(){  													// 进行修改
						var ids=formSelects.value('selectId'+obj.data.id, 'valStr');	//获取多选下拉框的值，用,分割开的字符串: 1,2
						if(ids==""){
							layer.msg("权限类型不能为空",{icon:2});
							return;
						}

						var data={
							id:	obj.data.id,
							permissionIds:ids,
							roleId:roleId
						};
						var load=layer.load(1);
						$.ajax({
							url:"${ctx}/roles/updatePermission",
							type:"POST",
							data:data,
							success:function(result){
								if(result.code==0){
									layer.msg("修改成功",{icon:1});
									layer.close(editPer);
								}
								else
									layer.msg(result.code+''+result.message,{icon:2});
								table.reload('lookOverPermissions');
								layer.close(load);
							},
							error:function(result){
								layer.close(load);
								layer,msg(result.message,{icon:2});
							}
						}) 
					}
				})
				formSelects.render('selectId'+obj.id);  //无参数时，自动渲染所有
			}
			function removePermission(obj){  			//删除权限
				var id=obj.data.id;
				layer.confirm("确定删除吗？",function(){
					var load=layer.load(1);
					$.ajax({
						url:'${ctx}/roles/deleteRole',
						type:"post",
						data:{id:id},
						success:function(result){
							if(0==result.code){
								layer.msg('删除成功!',{icon:1});
							}
							else
								layer.msg(result.code+''+result.message,{icon:2});
							table.reload('lookOverPermissions');
							layer.close(load);
						}
					})
				})
			}
			function addPermission(roleId){    			//增加权限
				var html='';       						//打开加权限窗口的内容
				html += '<div style="float:left;" class="treeMenuDiv" id="menuDiv"></div>'+        //左侧存放联级菜单的div
						'<div style="float:right;" class="treeMenuDiv" id="choosedDiv"></div>'+    //右侧存放选中菜单的div
						'<div class="treeMenuControl">'+
							'<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" style="margin-bottom:10px;" id="btnNext">'+
								'<i class="layui-icon layui-icon-next"></i></button>'+
							'<button type="button" class="layui-btn layui-btn-sm layui-btn-primary" style="margin-left:0px;" id="btnPrev">'+
								'<i class="layui-icon layui-icon-prev"></i></button>'+
						'</div>'+
						'<div style="float:right;width:100%;text-align:center;"><button type="button" lay-submit lay-filter="addPermissionSure"'+
						' value="'+roleId+'" class="layui-btn layui-btn-sm" >确定</button></div>'; //确定按钮
				var addPer=layer.open({    							//打开添加权限的窗口
					 title: '编辑权限'
					   ,type:1
					   ,area: ['60%', '80%']
					   ,content:html
				}) 
				var allRolePermission=layui.table.cache.lookOverPermissions;		//该角色的相关权限详细信息
				var checkedTree = []; 												//选中树形结构菜单
				for(var i=0;i<allRolePermission.length;i++)
					checkedTree.push(allRolePermission[i].menuId);
				menuTree.render({				//渲染全部菜单
			    	  elem:'#menuDiv',
			    	  data : allMenu,
			    	  checked : checkedTree,
			    });
				var data = menuTree.getTreeData('menuDiv');
				menuTree.render({				//渲染已有菜单
						elem : '#choosedDiv',
						data : data,
						hide : false,
						closeCheckLink : true,  //关闭复选框联动，即选中子菜单，父菜单不会选中
				})  
				
				
				$('.treeMenuControl').find('#btnNext').on('click',function(){
					menuTree.reload('choosedDiv',{
						checked : menuTree.getVal('choosedDiv'),  //还原之前勾选的数据
						data : menuTree.getTreeData('menuDiv'),
					});
				})
				$('.treeMenuControl').find('#btnPrev').on('click',function(){
					menuTree.reload('choosedDiv',{
						data : menuTree.getUncheckedTreeData('choosedDiv')
					});
				})
				form.on('submit(addPermissionSure)',function(obj){   	//加权限中，确定按钮的监听
					var roleId=obj.elem.value;	
					var newCheck = [];
					getAllId(menuTree.getAllData('choosedDiv'));
					function getAllId(data){							//递归获取角色所有选中的新权限
						layui.each(data,function(index,item){
							newCheck.push(item.id);	
							if(item.children.length>0)
								getAllId(item.children);
						});
					}
					newCheck.push("15");		  //添加首页的权限，首页id为15 线上的数据库也为15
					layer.confirm('是否保存更改？',function(){
						var load = layer.load(1);
						layer.msg('保存权限更改中......');
						layui.each(checkedTree,function(index,item){		//首先删除之前存在，本次却没有选择的权限
							if(!(newCheck.indexOf(item+"")>-1)){
								for(var i=0;i<allRolePermission.length;i++){
									if(allRolePermission[i].menuId == item){
										$.ajax({
											url:'${ctx}/roles/deleteRole',
											async:false,
											type:"post",
											data:{ id : allRolePermission[i].id },
											success:function(result){
												if(0!=result.code)
													layer.msg(result.code+''+result.message,{icon:2});
											}
										}) 
										break;
									}
								}
							}
						})
						var permissions=[];
						layui.each(newCheck,function(index,item){				//然后，添加之前没有，本次选择的权限
							if(checkedTree.indexOf(parseInt(item)) == -1){
								permissions.push({ "menuId" : item, "permissionIds" : '1,' });
							}
						})
						if(permissions.length>0){
							var data={ roleId:roleId, permissions:JSON.stringify(permissions) };
							$.ajax({
								url:"${ctx}/roles/changeRole",
								type:"POST",
								async:false,
								data:data,
								success:function(result){
									if(result.code!=0)
										layer.msg(result.code+''+result.message,{icon:2});
								},
							}) 
						}
						layer.close(load);
						layer.close(addPer);
						table.reload('lookOverPermissions');
						layer.msg('保存成功......',{icon:1});
					})
				})
				 
			}//加权限结束（窗口的弹出、逻辑的判断。。）
			
		}//查看角色权限结束
		
		// tr点击触发复选列点击
		$(document).on('click', '.layui-table-view tbody tr', function(event) {
			var elemTemp = $(this);
			var tableView = elemTemp.closest('.layui-table-view');
			var trIndex = elemTemp.data('index');
			tableView.find('tr[data-index="' + trIndex + '"]').find('[name="layTableCheckbox"]+').last().click();
		})
		
	}// defind end
);

function getMenu(){
	 $.ajax({
		url : "${ctx}/getTreeMenuPage",
		type : "get",
		success : function(result) {
			if(0==result.code){
				var rows=result.data;  
				for(var i=0;i<rows.length;i++){  
					allMenu.push(rows[i]);   
				}
			}
		} 
	 });
}
function getPermissionLevel(){   //获取相关的权限等级
	$.ajax({
		url:"${ctx }/getPermission",
		type:"get",
		success:function(result){
			if(0==result.code){
				var data=result.data;
				for(var i=0;i<data.length;i++){
					permissionLevel.push(data[i]);
				}
			}
		}
	})
}

function getPermissionLevelSelect(menu){   //获取选中菜单的下拉框
	var html='<select name="permissionLevelSelect" xm-select="selectId'+menu.id+'" xm-select-show-count="3" >';  //xm-select-show-count="2", 超出后隐藏
	
	for(var i=0;i<permissionLevel.length;i++){   
		var selected='';
		if(i==0)   //默认选中某一列
			selected='selected';
		html+='<option '+selected+' value="'+permissionLevel[i].id+'">'+permissionLevel[i].name+'</option>';
	}
	html+="</select>";
	return html;
}

</script>



</body>
</html>