<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<!DOCTYPE html>
<html class="no-js">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>蓝白工艺</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

	<link rel="stylesheet" href="${ctx }/static/plugins/bootstrap/css/bootstrap.min.css"><!-- 菜单栏样式 -->
	<link rel="stylesheet" href="${ctx }/static/plugins/bootstrap/css/autocomplete.css">
	<link rel="stylesheet" href="${ctx }/static/css/font-awesome.min.css">  <!-- 菜单栏图标 -->
	<link rel="stylesheet" href="${ctx }/static/css/simple-line-icons.css">
	<link rel="stylesheet" href="${ctx }/static/css/main.css">  <!-- 界面样式 -->
	<script src="${ctx }/static/js/vendor/jquery-3.3.1.min.js"></script>  <!-- jquery -->
	<script src="${ctx }/static/plugins/bootstrap/js/bootstrap.min.js"></script>   <!-- js功能 -->
	<script src="${ctx }/static/plugins/navgoco/jquery.navgoco.min.js"></script>
	<script src="${ctx }/static/plugins/fullscreen/jquery.fullscreen-min.js"></script>
	<script src="${ctx }/static/js/src/app.js"></script>
	<link rel="stylesheet" href="${ctx }/static/layui-v2.4.5/layui/css/layui.css" media="all">
	<script src="${ctx}/static/layui-v2.4.5/layui/layui.js"></script>
</head>
<body>
	<header id="header">
		<!--logo start-->
		<div class="brand">
		</div>
		<!--logo end-->
		
		<ul class="nav navbar-nav navbar-left">
			<li class="toggle-navigation toggle-left">
				<button class="sidebar-toggle" id="toggle-left">
					<i class="fa fa-bars"></i>
				</button>
			</li>
			<li class="toggle-profile hidden-xs">
				<button type="button" class="btn btn-default" id="toggle-profile">
					<i class="icon-user"></i>
				</button>
			</li>

		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown profile hidden-xs"><a
				href="javascript:void(0);" class="dropdown-toggle"
				data-toggle="dropdown"> <span class="meta"> <span
						class="avatar"> <img
							src="${ctx }/static/images/profile.jpg" class="img-circle" alt="">
					</span> <span class="text"> <shiro:principal /></span> <span class="caret"></span>
				</span>
			</a>
				<ul class="dropdown-menu animated fadeInRight" role="menu">
					<li><a href="#" id="login"> <span class="icon"><i class="fa fa-sign-out"></i> </span>退出</a></li>
					<li><a href="#" id="updatePwd"> <span class="icon"><i class="fa fa-user"></i> </span>修改密码</a></li>
				</ul></li>
			<li class="toggle-fullscreen hidden-xs">
				<button type="button" class="btn btn-default expand"
					id="toggle-fullscreen">
					<i class="fa fa-expand"></i>
				</button>
			</li>
			<li class="toggle-navigation toggle-right">
				<button class="sidebar-toggle" id="toggle-right">
					<i class="fa fa-indent"></i>
				</button>
			</li>
		</ul>
	</header>
	
	<!--sidebar left start-->
	<aside class="sidebar sidebar-left">
		<div class="sidebar-profile">
			<div class="avatar">
				<img class="img-circle profile-image"
					src="${ctx }/static/images/profile.jpg" alt="profile"> <i
					class="on border-dark animated bounceIn"></i>
			</div>
			<div class="profile-body dropdown">
				<a href="javascript:void(0);" aria-expanded="false">
					<h4>
						<shiro:principal />
					</h4>
				</a> <small class="title">你好世界</small>
			</div>
		</div>
		<nav>

			<ul class="nav nav-pills nav-stacked " id="informatic">
			</ul>
		</nav>
	</aside>
	<!--sidebar left end-->

	<section class="main-content-wrapper">	<!-- 用于链入其他内容，不可省略 -->
	
	
	<!-- 修改密码隐藏框 -->	
	<button type="button" data-toggle="modal" data-target="#myModal"  id="hiddenButton" style="display:none;">隐藏按钮、触发修改密码弹窗</button>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">修改</h4>
				</div>
				<div class="modal-body">
					<p><label>原密码：</label><input type="password" class="form-control" id="oldPwd"></p>
					<div class="alert alert-danger" role="alert" id="oldPwdError" style="display:none;">原密码错误</div>
				    <p><label>修改密码：</label><input type="password" class="form-control" id="newPwd"></p>
				    <div class="alert alert-danger" role="alert" id="againPwdError" style="display:none;">两次输入的密码不一致</div>
				    <p><label>确认密码：</label><input type="password" class="form-control" id="againPwd"></p>
				    <div class="alert alert-danger" role="alert" id="emptyPwdError" style="display:none;">密码不能为空</div>
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
				    <button class="btn btn-primary" type="button" id="primaryUpdate">修改</button>
				</div>
			</div>
		</div>
	</div>


</body>
<script type="text/javascript">
//菜单栏的定位
function leftNavChange(id){ 
	//清空所有二、三级菜单的激活
	  $('#informatic li ul li  a').each(function(){
		  $(this).parent().removeClass("active");
		  $(this).parent().siblings().removeClass("active");
	  })  
	  $('#informatic li ul li a').each(function(){ 
		  if('lay-iframe-'+$(this).attr("id") == id){  
			$(this).parent().addClass("active");   //本菜单激活
			$(this).parent().parent().parent().addClass("active")   //点击二级菜单时，其父元素（上级菜单激活）
			$(this).parent().parent().parent().siblings().removeClass("active") 
			$(this).parent().parent().parent().parent().parent().addClass("active")   //点击三级时，其祖元素（上上级菜单）
			$(this).parent().parent().parent().parent().parent().siblings().removeClass("active") 
		  }
	  })   
}
jQuery(function($){
	$('#login').on('click',function(){
		location.href = "${ctx}/logout";
	})
	$('#updatePwd').on('click',function(){				//修改密码
		$('#hiddenButton').click();
	})
	$('#primaryUpdate').on('click',function(){
		$('#oldPwdError').hide();
		$('#againPwdError').hide();
		$('#emptyPwdError').hide();
		if($('#newPwd').val()=='' || $('#againPwd').val()=='' || $('#oldPwd').val==''){
			$('#emptyPwdError').show();
			return;
		}
		if($('#newPwd').val()!=$('#againPwd').val()){
			$('#againPwdError').show();
			return;
		}
	 	$.ajax({
			url:"${ctx}/system/user/checkPassword",
			data:{
				password:$('#oldPwd').val()
			},
			type:"post",
			success:function(result){
				if(result.code==0){
					$.ajax({
						url:"${ctx}/system/user/updatePassword",
						type:"post",
						data:{password:$('#newPwd').val()},
						success:function(result){
							if(0==result.code){
								 $("#myModal").modal('hide');
								 layer.msg("修改成功",{icon:1});
							}else{
								layer.msg("修改发生服务器异常",{icon:2});
							}
						}
					})
				 }
				else{
					console.log(result)
					$('#oldPwdError').show();
				}
			}
		}) 
	})//修改密码结束
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
	this.init = function(){
		//注册绑定事件
		self.events();
	}
	this.events = function(){
		var productId="${productId}"; 
		var html = '';
		var htmlto;
		var htmlth;
		var htmltr;
      	var arr=new Array();
      	var arrTo=new Array();
      	var arrTh=new Array();
      	var a=""; 
		    var b="";
      	var c="";
			var d="";
			var e="";
			var f="";
			var fristicon="";
			var secondicon="";
			var Thirdicon="";
			/* 遍历菜单栏 */
			$.ajax({
				url:"${ctx}/menus",
				type:"GET", 
				success: function (result) {
					arr=result.data
					for (var i = 0; i < arr.length; i++) {
					 	a=arr[i].name //第一层次的命名
						b= arr[i].url //第一层次的链接
						fristicon=arr[i].icon //第一层次的图标
						arrTo=arr[i].children //第二层次的数组
						htmlto = "";
					 	htmltr = "";
						if(arrTo!=null){
							 for (var k = 0; k < arrTo.length;k++) {
								c=arrTo[k].name //第二层次的命名
								d=arrTo[k].url  //第二层次的链接
								secondicon=arrTo[k].icon //第二层次的图标
								arrTh=arrTo[k].children //第三层次的数组
								
								var identy=arrTo[k].identity;    //每一个url存放属性：url指向id   title 当前菜单名   id 唯一标志identy
							
								htmlto +='<li><a href="#"  url='+d+' title='+c+' id='+identy+'><i class="fa  fa-fw '+secondicon+'"></i>'+c+'</a></li>' //拼接第二层
								htmlth = "";
								if(arrTh!=null){
									for (var j = 0; j < arrTh.length; j++) {
										e=arrTh[j].name //第三层次的命名
										f=arrTh[j].url  //第三层次的链接
										Thirdicon=arrTh[j].icon //第三层次的图标

										var identy=arrTh[j].identity;

										htmlth +='<li><a href="#" url='+f+' title='+e+' id='+identy+' class="third"><i class="fa   fa-fw '+Thirdicon+'" ></i>'+e+'</a></li>' //拼接第三层
									}
	      						}
		      					htmltr +='<li class="nav-dropdown"><a href="#" url='+d+' id='+identy+' class="onclic" title='+c+'><i class="fa   fa-fw '+secondicon+'"></i>'+c+'</a><ul class="nav-sub" style="display:none;">'+htmlth+'</ul></li>'
							} 
      			   		}
      					html +='<li class="nav-dropdown"><a href="#" class="sele"><i class="fa  fa-fw '+fristicon+'"></i>'+a+'</a><ul class="nav-sub" style="display:none;">'+htmltr+'</ul></li>'
					}
      				$('#informatic').append("<li class='active'><a href='${ctx }/' class='index'   title='首页'><i class='fa  fa-fw fa-tachometer'></i> 首页</a></li>"+html); 
			
			
      			//在每个菜单的跳转的超链接a中，href均为#，title属性存放的是该菜单的菜单名,url存放的是该超链接指向的url
				 $('a').on('click',function(){
					 var display =$(this).next().css("display")    //菜单下级菜单隐藏显示的切换
					 if(display=='none'){
						$(this).next().css("display","block");  
						}else{
							$(this).next().css("display","none"); 
						} 
					 var p= $(this).attr("url");
					 if(p!=null && p!="" && p!="#"){  //如果为null或者空则为1级菜单，如果为#则表示为有下级的二级菜单，则不发生打开新页面或定位新页面即只切换菜单栏的下级菜单
						//console.log($(this).attr("id"))
						 openPage($(this).attr("title"),$(this).attr("url"),$(this).attr("id"));
					 }
				 })
			  },//success结束
			  error:function(){
					layer.msg("失败", {icon: 2});
					layer.close(index);
			  }
			
			})
		    //ajax 结束
				
	}
	
	
}
	var login = new Login();
	login.init();

}) 
</script>
</html>