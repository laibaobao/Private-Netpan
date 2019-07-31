<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
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
    <link rel="stylesheet" href="<%=basePath%>/assets/fonts/feather/feather.min.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/libs/highlight.js/styles/vs2015.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/libs/quill/dist/quill.core.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/libs/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" href="<%=basePath%>/assets/css/theme.min.css" id="stylesheetLight">
    <script>
        var level = new Array();//文件目录回调路径层
        var levernum=0;//文件目录回调当前层
        var countsize=0;//总文件大小
        var movefile=null;//移动文件对象
        var countnum=0;//总文件数目
        var countfiles=new Array();//文件名数组对象
        var email = ""+${now.student_Id};//当前用户
        var dir = ${now.filepathData};//当前用户空间json数据
        var now = dir;//当前文件目录层数据
        console.log(typeof email);
        console.log(email);
        level[levernum]=now;
        var last=JSON.stringify(dir); //将JSON对象转化为JSON字符
        var obj = JSON.parse(last);
        //遍历整个用户空间，统计文件总数，文件大小，生成文件名数组
        function countfilesize(dir){
            for (var k =0;k<dir.files.length;k++){//统计每条文件对象
                countfiles[countnum]=dir.files[k].name;
                countnum++;
                countsize=Number(countsize)+Number(dir.files[k].size);
                countsize = countsize.toFixed(3);
                console.log(countsize)
            }
            if(dir.dirs.length==0){//当前目录没有文件目录返回
                return;
            }
            else{//递归当前目录下每条文件目录对象
                for(var i=0;i<dir.dirs.length;i++){
                    countfilesize(dir.dirs[i]);
                }
            }
        }
        //左边状态栏数字更具遍历数据修改
        function repro(){
            var xx=countsize;
            var aa=parseInt(xx*100/1024);//计算占空间比
            var bb=aa.toString()+'%';//占空间比百分号字符串
            var cc=countnum;
            $("#countsize").text("文件大小："+countsize+"M");//修改左侧文件大小
            $("#countnum").text("文件数量："+countnum+"个");//修改左侧文件数量
            $("#pro").empty();$("#hr").empty();//修改左侧空间百分比
            $("#pro").append("<div class='progress-bar' role='progressbar' style='width:"+bb+"'></div>")
            $("#hr").append("<a class='navbar-brand'>空间使用："+countsize+"M/1G</a>");
        }

    </script>
    <script src="<%=basePath%>/assets/js/common.js"></script>
    <title>你的网盘</title>
</head>
<body style="display: block" onload="countfilesize(dir);repro()" onbeforeunload="logout()">
<!--顶层主体-->
<nav class="navbar navbar-expand-xl navbar-dark" style="border: none">
    <div class="container-fluid">
        <!--左侧主题-->
        <a class="navbar-brand" href="#!"><img src="<%=basePath%>/assets/img/firefox.svg" alt="..." class="navbar-brand-img"> <b><font size='5' color='#483d8b'><label>简易网盘</label></font></b></a>
        <!--尾部描述-->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#!">--课程设计<span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!--左侧主体-->
<nav style='margin-top:70px' class="navbar navbar-vertical fixed-left navbar-expand-md navbar-dark" >
    <div class="container-fluid">
        <!--顶部图片-->
        <a class="navbar-brand"><img src="<%=basePath%>/assets/img/illustrations/designer-life.svg" alt="..." class="navbar-brand-img"></a>
        <!--用户名-->
        <a class="navbar-brand"><font size='3'><label>${now.name}</label></font></a>
        <!--主体描述-->
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a id="countnum" class="nav-link">
                        文件总数：
                    </a>
                </li>
                <li class="nav-item">
                    <a id="countsize" class="nav-link">
                        文件大小：
                    </a>
                </li>
            </ul>
        </div>
        <!--分割线-->
        <hr id="hr" class="navbar-divider my-3">
        <div class="col">
            <!--占空间百分比-->
            <div id="pro" class="progress progress-sm">
            </div>
        </div>
        </hr>
        <!--底部描述-注销登陆-->
        <div class="navbar-user d-none d-md-flex">
            <a  href="<%=basePath%>" onclick="logout()">注销登陆</a>
        </div>
    </div>
</nav>
<!--中心主体 -->
<div class="main-content">
    <div class="row">
        <div class="col-12">
            <div class="card" data-toggle="lists" data-lists-values='["name"]'>
                <!--头部描述-->
                <div class="card-header">
                    <!--右侧-->
                    <div class="row align-items-center">
                        <div class="col">
                            <!--文件目录回调-->
                            <ol id="breadcrumb" class="breadcrumb">
                            </ol>
                        </div>
<%--                        <div class="col">--%>
<%--                            <!--搜索表单-->--%>
<%--                            <form>--%>
<%--                                <div class="input-group input-group-flush input-group-merge">--%>
<%--                                    <input type="search" class="form-control form-control-prepended search" placeholder="搜索">--%>
<%--                                    <div class="input-group-prepend">--%>
<%--                                        <div class="input-group-text">--%>
<%--                                            <span class="fe fe-search"></span>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </div>--%>
                        <!--右侧描述-->
                        <div id="upfile" class="col-auto">
                            <!--上传表单-->
                            <form id="file" enctype="multipart/form-data" >
                            <label  for="fileload" class="btn btn-sm btn-primary">
                                上传   </label>
                            <input id="fileload" onchange="createFile(this.value)" type="file"  name="fileUpload" style="display: none">
                            </form>
                        </div>
                        <!--新建文件夹按钮-->
                        <div class="col-auto">
                            <label  class="btn btn-sm btn-primary" onclick="createDirs()">
                                新建文件夹   </label>
                        </div>
                    </div>
                </div>
                <!--中心主体内容-->
                <div class="card-body" >
                    <!--文件目录-->
                    <ul class="list-group list-group-sm  list-group-flush list my--4" id="showPage">
                    </ul>
                </div>
            </div>
        </div>
    </div> 
</div>
</div>
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
<script src="<%=basePath%>/assets/js/theme.min.js"></script>
<script>
    createPage();
</script>
</body>
</html>