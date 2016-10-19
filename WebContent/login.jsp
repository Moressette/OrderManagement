<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>好而不贵-订单管理系统</title>

<!--Library Styles-->
<link href="css/bootstrap.min.css" rel="stylesheet">
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
    </div>
    <!-- HEADER END -->
    <!-- Container -->
    <div class="container">
        <div class="row">
            <div class="formstyle">
                <form role="form" action="LoginServlet" method="post">
                    <div class="form-group">
                        <label for="username">用户名</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="在此输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="在此输入密码">
                    </div>
                    <button type="submit" class="btn">登录</button>
                </form>
            </div>
        </div>
    </div>
    
    <!--Footer-->
    <div class="footer" style="position: fixed;">
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