<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
session.getAttribute("orderFind");
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

<title>订单查询</title>

<!--Library Styles-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/lib/font-awesome.css" rel="stylesheet">
<link href="css/lib/nivo-lightbox.css" rel="stylesheet">
<link href="css/lib/nivo-themes/default/default.css" rel="stylesheet">

<!--Template Styles-->
<link href="css/style.css" rel="stylesheet">
<link href="css/scheme/purple.css" rel="stylesheet">

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
           <div class="col-sm-10 page-header" style="font-size:50px;width:1180px">&nbsp;订单查询</div>
        </div>
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
				<c:forEach items="${orderFind}" var="orderFind">
					<tr>
						<td>${orderFind.id }</td>
						<td>${orderFind.no }</td>
						<td>${orderFind.consignee_name }</td>
						<td>${orderFind.consignee_addr }</td>
						<td>${orderFind.consignee_phone }</td>
						<td>¥${orderFind.order_price }</td>
						<td>${orderFind.order_time }</td>
						<td>${orderFind.order_amount }</td>
						<td><a
							href="FindOrderByNoServlet?orderNo=${orderFind.no }">查看详情</a></td>
					</tr>

				</c:forEach>
			</table>
			<div class="col-sm-2">
						<a href="javascript:history.go(-1);" class="btn">返回</a>
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