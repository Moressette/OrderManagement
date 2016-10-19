<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
response.setContentType("text/html;charset=utf-8");
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8"); 
if((String)session.getAttribute("username") == null){    
	out.println("<script type='text/javascript'>alert('您还没有登录，请先登录');window.location.href='login.jsp'; </script>");
}
%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>好而不贵-订单管理系统</title>
	
    <!--Library Styles-->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/lib/font-awesome.css" rel="stylesheet">
    <link href="css/lib/nivo-lightbox.css" rel="stylesheet">
    <link href="css/lib/nivo-themes/default/default.css" rel="stylesheet">
	
    <!--Template Styles-->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/scheme/purple.css" rel="stylesheet">
    
    <!-- Custom JS-->
	<script type="text/javascript">
		function validate(addorderForm) {
			if (addorderForm.order_no.value == "") {
				alert("订单编号不能为空");
				return false;
			}
			if (addorderForm.consignee_name.value == "") {
				alert("收件人姓名不能为空");
				return false;
			}
            if(addorderForm.consignee_addr.value == ""){
            	alert("收件人地址不能为空");
                return false;
            }
			if (addorderForm.consignee_phone.value == ""){
				alert("收件人电话不能为空");
				return false;
			}
            if (addorderForm.order_price.value == ""){
				alert("订单价格不能为空");
				return false;
			}
            if (isNaN(addorderForm.order_price.value)){
            	   alert("订单价格必须为数字");
            	   return false;
            }
            if (addorderForm.order_amount.value == ""){
				alert("商品数量不能为空");
				return false;
			}
            else if(isNaN(addorderForm.order_amount.value)){
            	alert("商品数量必须为数字");
            	return false;
            }
			return true;
		}
	</script>
	
	<script type="text/javascript">
		function validate_no(searchviano) {
			if (searchviano.orderNo.value == "") {
				alert("未输入订单编号");
				return false;
            }
			return true;
		}
	</script>
	
	<script type="text/javascript">
		function validate_price(searchviaprice) {
			if (searchviaprice.low.value == "") {
				alert("请输入正确的价格区间");
				return false;
            }
            if (searchviaprice.high.value == "") {
            	alert("请输入正确的价格区间");
				return false;
            }
            if (isNaN(searchviaprice.low.value)){
          	   alert("请输入正确的价格区间");
          	   return false;
          	}
            if (isNaN(searchviaprice.high.value)){
         	   alert("请输入正确的价格区间");
         	   return false;
         	}
            var low = searchviaprice.low.value;
            var high = searchviaprice.high.value;
            if ( parseInt(low) > parseInt(high)) {
            	alert("请输入正确的价格区间");
				return false;
            }
			return true;
		}
	</script>
	
	<script type="text/javascript">
	function del(){
	if(confirm("确定删除吗")){
    	return true;
    }else{
    	return false;
    }
	}
	</script>
	
	
</head>

<body data-spy="scroll">

    <!-- Preloader -->
    <div id="preloader">
        <div id="status"></div>
    </div>
	<!-- HEADER -->
    <div class="headerColor">
        <div class="container">
            <center><font style="color:#ffffff;font-size:50px;font-family:微软雅黑">“好而不贵”网上购物系统订单管理系统</font></center>
        </div>
        <div style="float:right;z-index:99;color:#ffffff;margin-right:20px;margin-top:20px">
            ${username }，欢迎您
        </div>
    </div>
    <!-- HEADER END -->
    <div id="main-wrapper">
        
        <!-- Site Navigation -->
        <div id="menu">
            <nav class="navbar navbar-default" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a href="#" style="margin-left: 30px; font-size: 35px; color:#85939b">后台管理</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a class="sscroll" href="adminpage.html#orderlist" style="font-size: 21px; font-family: 微软雅黑">查看所有订单</a>
                        </li>
                        <li>
                            <a class="sscroll" href="adminpage.html#searchorder" style="font-size: 21px; font-family: 微软雅黑">查询订单</a>
                        </li>
                        <li>
                            <a class="sscroll" href="index.html#addorder" style="font-size: 21px; font-family: 微软雅黑">添加订单</a>
                        </li>
                        <li>
                            <a href="LogoutServlet" style="font-size: 21px; font-family: 微软雅黑">系统注销</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>
        </div>

		<div id="container">
			<!-- order list -->
			<section id="orderlist" class="addorders"> 
			    <span class="managetitle">查看所有订单</span> <br><br>
			    <table class="table table-striped table-hover">
				<th>流水号</th>
				<th>订单编号</th>
				<th>收件人</th>
				<th>收件人地址</th>
				<th>收件人电话</th>
				<th>订单价格</th>
				<th>下单时间</th>
				<th>商品数量</th>
				<th>操作</th>
				<c:forEach items="${orderlist}" var="order">
					<tr>
						<td>${order.id }</td>
						<td>${order.no }</td>
						<td>${order.consignee_name }</td>
						<td>${order.consignee_addr }</td>
						<td>${order.consignee_phone }</td>
						<td>¥${order.order_price }</td>
						<td>${order.order_time }</td>
						<td>${order.order_amount }</td>
						<td>
							<a href="ShowSingleOrderServlet?id=${order.id }">修改</a>&nbsp;&nbsp;&nbsp;
							<a href="DeleteOrderServlet?id=${order.id }" onclick="javascript:return del()">删除</a>
						</td>
					</tr>

				</c:forEach>
			</table>
			</section>
			<!--order list END-->
			
			<!-- search order-->
			<section id="searchorder" class="searchorder">
			    <span class="managetitle">订单查询</span> <br><br>
                <form class="form-horizontal" role="form" id="searchviano" method="post" action="FindOrderByNoServlet" style="margin-top:10px" onsubmit="return validate_no(this);">
                    <div class="form-group">
                        <label for="bookname" class="col-sm-2 control-label" style="font-size: 20px">按编号查询</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="orderNo" placeholder="输入订单编号以查询">
                        </div>
                        <div class="col-sm-2">
                            <button type="submit" class="btn btn-sm">查询</button>
                        </div>
                    </div>
                </form>
                <form class="form-horizontal" role="form" id="searchviaprice" method="post" action="FindOrderByPriceServlet" onsubmit="return validate_price(this);">
                    <div class="form-group">
                        <label for="bookname" class="col-sm-2 control-label" style="font-size: 20px">按价格查询</label>
                        <div class="col-sm-1">
                            <input type="text" class="form-control" name="low" placeholder="价格区间">
                        </div>
                        
                        <div class="col-sm-1">
                            <img src="img/to.png" style="width:100px;height:50px">
                        </div>
                        
                        <div class="col-sm-1">
                            <input type="text" class="form-control" name="high" placeholder="价格区间">
                        </div>
                        <div class="col-sm-2">
                            <button type="submit" class="btn btn-sm">查询</button>
                        </div>
                    </div>
                </form>
			</section>
			<!-- search order END-->

			<!-- Add order -->
			<section id="addorder" class="addorder"> 
			<span class="managetitle">添加订单</span><br><br>
			<form class="form-horizontal" role="form" id="addorderForm" method="post" action="AddOrderServlet" onsubmit="return validate(this);">
				<div class="form-group">
					<label for="order_no" class="col-sm-2 control-label" style="font-size: 20px">订单编号</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="order_no" placeholder="在此输入订单编号">
					</div>
				</div>

				<div class="form-group">
					<label for="consignee_name" class="col-sm-2 control-label" style="font-size: 20px">收件人</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="consignee_name" placeholder="在此输入收件人姓名">
					</div>
				</div>

				<div class="form-group">
					<label for="consignee_addr" class="col-sm-2 control-label" style="font-size: 20px">收件人地址</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="consignee_addr" placeholder="在此输入收件人地址">
					</div>
				</div>

				<div class="form-group">
					<label for="consignee_phone" class="col-sm-2 control-label" style="font-size: 20px">收件人电话</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="consignee_phone" placeholder="在此输入收件人电话">
					</div>
				</div>

				<div class="form-group">
					<label for="order_price" class="col-sm-2 control-label" style="font-size: 20px">订单价格</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="order_price" placeholder="在此输入订单价格">
					</div>
				</div>

				<div class="form-group">
					<label for="order_amount" class="col-sm-2 control-label" style="font-size: 20px">商品数量</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="order_amount" placeholder="在此输入商品数量">
					</div>
				</div>
				
				<br>
				<div class="row" style="margin-left: 250px;">
					<div class="col-sm-1">
						<button type="submit" class="btn btn-lg">添加</button>
					</div>
					<div class="col-sm-5">
						<button type="reset" class="btn btn-lg">重置</button>
					</div>
				</div>
			</form>
			</section>
			<!-- Add order END-->

		</div>
	</div>
    <!--Footer-->
    <div class="footer">
        <div class="container">
           <center>
            <p>
                Powered by <a href="http://v3.bootcss.com/" target="_Blank">Bootstrap</a> | Designed/Built by <a href="http://ten-min.com" target="_Blank">Moressette</a> | <a href="http://blog.csdn.net/wangcong9614/" target="_Blank">blog</a> & <a href="http://github.com/Moressette" target="_Blank">Github</a> <br>
                Special thanks to <a href="http://glyphicons.com/">glyphicons</a> | Promote <a href="https://developer.mozilla.org/zh-CN/" target="_Blank">MDN</a> | <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh_TW" target="_Blank">Creative Commons</a>
            </p>
            </center>
        </div>
    </div>
    <!--Footer END-->




    <!-- Library Scripts -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/lib/jquery.preloader.js"></script>
    <script src="js/lib/nivo-lightbox.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/lib/jquery.superslides.min.js"></script>
    <script src="js/lib/smoothscroll.js"></script>
    <script src="js/lib/jquery.sudoslider.min.js"></script>
    <script src="js/lib/jquery.bxslider.min.js"></script>
    <script src="js/lib/jquery.mixitup.min.js"></script>
    <script src="js/lib/jquery.backtotop.js"></script>
    <script src="js/lib/jquery.carouFredSel-6.2.1-packed.js"></script>
    <script src="js/lib/retina.min.js"></script>

    <!-- Custom Script -->    
    <script src="js/main.js"></script>
</body>

</html>
