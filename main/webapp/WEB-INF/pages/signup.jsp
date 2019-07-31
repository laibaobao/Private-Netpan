<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2019/5/24
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">

    <!-- Libs CSS -->
    <link rel="stylesheet" href="<%=basePath%>/assets/fonts/feather/feather.min.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/libs/highlight.js/styles/vs2015.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/libs/quill/dist/quill.core.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/libs/flatpickr/dist/flatpickr.min.css">

    <!-- Theme CSS -->

    <link rel="stylesheet" href="<%=basePath%>/assets/css/theme.min.css" id="stylesheetLight">

    <link rel="stylesheet" href="<%=basePath%>/assets/css/theme-dark.min.css" id="stylesheetDark">

    <style>body { display: none; }</style>


    <title>登陆</title>
</head>
<body class="d-flex align-items-center bg-auth border-top border-top-2 border-primary">

<!-- CONTENT
================================================== -->
<div class="container-fluid">
    <div class="row align-items-center justify-content-center">
        <div class="col-12 col-md-5 col-lg-6 col-xl-4 px-lg-6 my-5">

            <!-- Heading -->
            <h1 class="display-4 text-center mb-3">
                注册
            </h1>


            <!-- Form -->
            <form action="up.do" method="post">

                <!-- Email address -->
                <div class="form-group">

                    <!-- Label -->
                    <label>
                        邮箱地址
                    </label>

                    <!-- Input -->
                    <input type="email" required="required" name="email" id="email" class="form-control" placeholder="name@address.com">

                </div>

                <!-- Password -->
                <div class="form-group">

                    <!-- Label -->
                    <label>
                        密码
                    </label>

                    <!-- Input group -->
                    <div class="input-group input-group-merge">

                        <!-- Input -->
                        <input type="password" required="required" name="password" class="form-control form-control-appended" id="password" placeholder="请输入密码">

                        <!-- Icon -->
                        <div class="input-group-append">
                  <span class="input-group-text">
                    <i class="fe fe-eye"></i>
                  </span>
                        </div>

                    </div>
                </div>

                <!-- Submit -->
                <input type="submit" class="btn btn-lg btn-block btn-primary mb-3" value="提交" id="up">

            </form>

        </div>
        <div class="col-12 col-md-7 col-lg-6 col-xl-8 d-none d-lg-block">

            <!-- Image -->
            <div class="bg-cover vh-100 mt--1 mr--3" style="background-image: url(<%=basePath%>/assets/img/covers/auth-side-cover.jpg);"></div>

        </div>
    </div> <!-- / .row -->
</div>

<!-- JAVASCRIPT
================================================== -->
<!-- Libs JS -->
<script src="<%=basePath%>/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="<%=basePath%>/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=basePath%>/assets/libs/chart.js/dist/Chart.min.js"></script>
<script src="<%=basePath%>/assets/libs/chart.js/Chart.extension.min.js"></script>
<script src="<%=basePath%>/assets/libs/highlightjs/highlight.pack.min.js"></script>
<script src="<%=basePath%>/assets/libs/flatpickr/dist/flatpickr.min.js"></script>
<script src="<%=basePath%>/assets/libs/jquery-mask-plugin/dist/jquery.mask.min.js"></script>
<script src="<%=basePath%>/assets/libs/list.js/dist/list.min.js"></script>
<script src="<%=basePath%>/assets/libs/quill/dist/quill.min.js"></script>
<script src="<%=basePath%>/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="<%=basePath%>/assets/libs/select2/dist/js/select2.min.js"></script>

<!-- Theme JS -->
<script src="<%=basePath%>/assets/js/theme.min.js"></script>

</body>
</html>