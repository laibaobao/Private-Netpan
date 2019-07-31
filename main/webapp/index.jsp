<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2019/4/24
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Libs CSS -->
    <link rel="stylesheet" href="assets/fonts/feather/feather.min.css">
    <link rel="stylesheet" href="assets/libs/highlight.js/styles/vs2015.css">
    <link rel="stylesheet" href="assets/libs/quill/dist/quill.core.css">
    <link rel="stylesheet" href="assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="assets/libs/flatpickr/dist/flatpickr.min.css">

    <!-- Theme CSS -->

    <link rel="stylesheet" href="assets/css/theme.min.css" id="stylesheetLight">

    <link rel="stylesheet" href="assets/css/theme-dark.min.css" id="stylesheetDark">

    <style>body { display: none; }</style>


    <title>你好啊</title>
    <script>
        var flag=${sessionScope['org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS'][0]['error']};
        function remave(){
            $("#error").remove();
        }
        function error(value){
            if(value==1){
                $("#Head").append("<h4 id='error' class='text-center'><font color='red'>用户名不存在或密码错误！</font></h4>");
                setTimeout(remave,5000);
            }
            flag = 0;
        }
    </script>
</head>
<body class="d-flex align-items-center bg-auth border-top border-top-2 border-primary" onload="error(flag)">

<!-- CONTENT
================================================== -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-5 col-xl-4 my-5">

            <!-- Heading -->
            <h2 class="display-4 text-center mb-3">
                你的网盘
            </h2>

            <p id="Head"></p>
            <!-- Form -->
            <form action="Student/in.do" method="post">

                <!-- Email address -->
                <div class="form-group">

                    <!-- Label -->
                    <label>邮箱地址</label>

                    <!-- Input -->
                    <input type="email" required = "required" name="email" class="form-control" placeholder="name@address.com">

                </div>

                <!-- Password -->
                <div class="form-group">

                    <div class="row">
                        <div class="col">

                            <!-- Label -->
                            <label>密码</label>

                        </div>
                    </div> <!-- / .row -->

                    <!-- Input group -->
                    <div class="input-group input-group-merge">

                        <!-- Input -->
                        <input type="password" name ="password" required = "required"class="form-control form-control-appended" placeholder="请输入密码">

                        <!-- Icon -->
                        <div class="input-group-append">
                  <span class="input-group-text">
                    <i class="fe fe-eye"></i>
                  </span>
                        </div>

                    </div>
                </div>

                <!-- Submit -->
                <input type="submit" value="登录" class="btn btn-lg btn-block btn-primary mb-3">



                <!-- Link -->
                <div class="text-center">
                    <small class="text-muted text-center">
                        没有账号？<a href="Student/moveup.do">注册</a>.
                    </small>
                </div>

            </form>

        </div>
    </div> <!-- / .row -->
</div> <!-- / .container -->

<!-- JAVASCRIPT
================================================== -->
<!-- Libs JS -->
<script src="assets/libs/jquery/dist/jquery.min.js"></script>
<script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/libs/chart.js/dist/Chart.min.js"></script>
<script src="assets/libs/chart.js/Chart.extension.min.js"></script>
<script src="assets/libs/highlightjs/highlight.pack.min.js"></script>
<script src="assets/libs/flatpickr/dist/flatpickr.min.js"></script>
<script src="assets/libs/jquery-mask-plugin/dist/jquery.mask.min.js"></script>
<script src="assets/libs/list.js/dist/list.min.js"></script>
<script src="assets/libs/quill/dist/quill.min.js"></script>
<script src="assets/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="assets/libs/select2/dist/js/select2.min.js"></script>



</body>
</html>

<!--
<body>
<h1>SpringMVC</h1>
<a href="Student/start">点击测试</a>
<br/>
<br/>
<h1>输入学生信息</h1>
<form action="Student/save" method="post">
    id:<input class="from-contorl" type="text " name="student_Id" ><br/>
    姓名:<input type="text " name="name" ><br/>
<input type="submit" name="保存">
</form>
</body>
</html>
-->