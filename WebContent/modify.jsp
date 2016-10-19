<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
session.getAttribute("order");
if((String)session.getAttribute("username") == null){    
	out.println("<script type='text/javascript'>alert('您还没有登录，请先登录');window.location.href='login.jsp'; </script>");
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="shortcut icon" href="images/favicon/favicon.png"
	type="image/x-icon">
<link rel="icon" href="images/favicon/favicon.png" type="image/x-icon">

<title>订单修改</title>

<!--Library Styles-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/lib/font-awesome.css" rel="stylesheet">
<link href="css/lib/nivo-lightbox.css" rel="stylesheet">
<link href="css/lib/nivo-themes/default/default.css" rel="stylesheet">

<!--Template Styles-->
<link href="css/style.css" rel="stylesheet">
<link href="css/scheme/purple.css" rel="stylesheet">
<!-- Custom JS -->
<script type="text/javascript">
		function validate(modifyorderForm) {
            if(modifyorderForm.consignee_addr.value == ""){
            	alert("收件人地址不能为空");
                return false;
            }  
            if (modifyorderForm.consignee_phone.value == "") {
				alert("收件人电话不能为空");
				return false;
			}
            if (modifyorderForm.order_price.value == "") {
				alert("订单价格不能为空");
				return false;
			}
            if (isNaN(modifyorderForm.order_price.value)){
         	   alert("订单价格必须为数字");
         	   return false;
         	}
			return true;
		}
	</script>
</head>
<body>
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
        <div class="container">
        <div class="row">
          <br>
           <div class="col-sm-10 page-header" style="font-size:50px;">&nbsp;订单修改</div>
        </div>
        <br>
        <div class="row">
			<form class="form form-horizontal" role="form" id="modifyorderForm" method="post" action="ModifyOrderServlet" onsubmit="return validate(this);">
				<div class="form-group">
					<label for="id" class="col-sm-2 control-label" style="font-size: 20px">流水号</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="id" value="${order.id }" disabled="true">
					</div>
					<label class="control-label" style="font-size: 20px">(不可修改)</label>
				</div>

				<div class="form-group">
					<label for="no" class="col-sm-2 control-label" style="font-size: 20px">订单编号</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="no" value="${order.no }" disabled="true">
					</div>
					<label class="control-label" style="font-size: 20px">(不可修改)</label>
				</div>

				<div class="form-group">
					<label for="consignee_name" class="col-sm-2 control-label" style="font-size: 20px">收件人</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="consignee_name" value="${order.consignee_name }" disabled="true">
					</div>
					<label class="control-label" style="font-size: 20px">(不可修改)</label>
				</div>

				<div class="form-group">
					<label for="consignee_addr" class="col-sm-2 control-label" style="font-size: 20px">收件人地址</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="consignee_addr" value="${order.consignee_addr }">
					</div>
				</div>

				<div class="form-group">
					<label for="consignee_phone" class="col-sm-2 control-label" style="font-size: 20px">收件人电话</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="consignee_phone" value="${order.consignee_phone }">
					</div>
				</div>

				<div class="form-group">
					<label for="order_price" class="col-sm-2 control-label" style="font-size: 20px">订单价格</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="order_price" value="${order.order_price }">
					</div>
				</div>

				<div class="form-group">
					<label for="order_time" class="col-sm-2 control-label" style="font-size: 20px">下单时间</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="order_time" value="${order.order_time }" disabled="true">
					</div>
					<label class="control-label" style="font-size: 20px">(不可修改)</label>
				</div>
				
				<div class="form-group">
					<label for="order_amount" class="col-sm-2 control-label" style="font-size: 20px">商品数量</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="order_amount" value="${order.order_amount }" disabled="true">
					</div>
					<label class="control-label" style="font-size: 20px">(不可修改)</label>
				</div>
				
				
				
				<br>
				<div class="row" style="margin-left: 186px;">
					<div class="col-sm-3">
						<button type="submit" class="btn">修改</button>
					</div>
					<div class="col-sm-5">
						<button type="reset" class="btn">重置</button>
					</div>
				</div>
			</form>
			</div>
    </div>
    <!--Footer-->
    <div class="footer" style="margin-top:50px">
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
</body>
</html>