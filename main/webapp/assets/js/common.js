/*
    目录对象：包含当前目录名，子目录数组，文件数组
    文件对象：包含文件名，文件大小,文件绝对路径名，文件名后缀
    位置数组：描述当前目录的绝对路径。（只记录目录路径）
    用户空间：使用json字符串生成对象，
* */
//文件对象
function File(name,final,size){
    this.name=name;//文件名
    //文件绝对路径，已创建时间为据对路径
    var date=new Date();
    this.addr= ""+date.getMonth()+1+"_"+date.getDate()+"_"+ date.getHours()+"_"+ date.getMinutes()+"_"+date.getSeconds()+"_"+date.getMilliseconds();
    this.final='.'+final;//文件名后缀
    this.size=size;//文件大小
}
//文件夹对象
function Dir(name) {
    this.name = name;//文件夹名
    this.files = new Array();//文件对象数组
    this.dirs = new Array();//文件夹对象数组
}
/**
  *函数功能：选择上传并创建新文件
  *输入参数：~
  *输出参数：~
  *返回值：~
  *调用关系：调用更新上传按钮函数createupfile，文件大小规范函数sizefan，整体遍历函数countfilesize，更新左边栏repro，上传动作upload.do，更新主体视图createpage；被上传按钮调用
  */
function createFile(){
    var flag=0;//是否已上传过flag
    var name,final;//新文件名，后缀
    var qname=$("#fileload").val().toString();//新文件本地完整路径
    createupfile(1);//改变上传按钮
    for(var i=qname.length-1;;i--){//遍历完整路径
        if(qname[i]=='\\'){//找出最后一个‘、’分隔符确定文件名
            break;
        }
        if(i==qname.length-1)name=qname[i];
        else name=qname[i]+name;
    }
    for(var i=qname.length-1;;i--){//找出最后一个‘。’分隔符确定文件后缀
        if(qname[i]=='.'){
            break;
        }
        if(i==qname.length-1)final=qname[i];
        else final=qname[i]+final;
    }
    for(var i=0;i<countnum;i++){//遍历文件夹名数组countfiles确定有无上传过
        if(name==countfiles[i]){
            alert("文件已上传");
            createupfile(0);
            flag=1;
            break;
        }
    }
    if(flag==1){
	    createupfile(0); 
	    return;//上传过推出创建
	}
    var f=document.querySelector("#fileload").files[0];
    var size=f.size;
    size=sizefan(size);//保留两位，获取文件大小单位‘M’
    if(size>=5){//文件大小超过5M
        alert("文件大小应小于5M");
        createupfile(0);
        return;
    }
    if(countsize+size>1024){//文件总大小超过用户空间
        alert("文件空间溢出");
        createupfile(0);
        return;
    }
    console.log($("#file"));
    console.log($("#file")[0]);
    var formdata=new FormData($("#file")[0]);//打包文件表单
    var newfile=new File(name,final,size);//创建新的文件对象
    var files=email;//服务器用户文件夹据对路径
    var file=newfile.addr+newfile.final;//文件服务器绝对路径
    formdata.append("filrs",files);//文件夹打包入表单
    formdata.append("file",file);//文件路径打包入表单
    //打包表单上传
    $.ajax({
        url:"upload.do",
        type: 'POST',
        data: formdata,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success:function (data) {//成功反馈
            console.log("chengg"+data.toString())
            createupfile(0);
            //文件入用户json数据
            now.files.push(newfile);
            countfiles[countnum]=newfile.name;//文件名入用户文件名数组
            countnum++;
            countsize=Number(countsize)+Number(newfile.size);
            countsize=countsize.toFixed(3);
            repro();//更新左侧数据
        },
        error:function (data) {//错误反馈
            console.log("shib"+data.toString())
            alert("文件上传失败")
            createupfile(0);
        }

    });
    //更新主体目录
    $("#showPage").empty();
    createPage();
}
/**
  *函数功能：删除文件
  *输入参数：目标文件的该目录下文件数组下标
  *输出参数：~
  *返回值：~
  *调用关系：调用整体遍历函数countfilesize，更新左边栏repro，删除动作upload.do，更新主体视图createpage；被文件删除按钮调用
  */
function deleteFile(value){
    var r=confirm("是否删除该文件");//弹窗
    if (r==true)//是
    {
        var files=email;//服务器用户文件夹据对路径
        var file=now.files[value].addr+now.files[value].final;//文件服务器绝对路径
        console.log(file+"delete");
        var formdata=new FormData();//打包文件表单
        formdata.append("filrs",files);//文件夹打包入表单
        formdata.append("file",file);//文件路径打包入表单
 		//打包表单上传
        $.ajax({
            url:"delete.do",
            type: 'POST',
            data: formdata,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function (data) {//成功反馈
                console.log("chengg"+data.toString())
                //从文件名数组中删除
                for(var i=0;i<countnum;i++){
                    if(now.files[value].name==countfiles[i]){
                        countfiles.splice(i,1);
                        countnum--;
                        countsize=Number(countsize)-Number(now.files[value].size);
                        countsize=countsize.toFixed(3);
                        repro();
                        break;
                    }
                }
               //从用户json数据中删除
                now.files.splice(value,1);
                //跟新主体目录
                $("#showPage").empty();
        		createPage();
            },
            error:function (data) {//错误反馈
                console.log("shib"+data.toString())
                alert("文件删除失败")
            }
        });
    }
}
/**
  *函数功能：确定修改文件名
  *输入参数：目标文件的该目录下文件数组下标
  *输出参数：~
  *返回值：~
  *调用关系：更新主体视图createpage；被删除文件名renamefile函数调用
  */
function refileYes(value){
    now.files[value].name=$("#NewName").val();
    $("#showPage").empty();
    createPage();
}
/**
  *函数功能：取消修改文件名
  *输入参数：目标文件的该目录下文件数组下标
  *输出参数：~
  *返回值：~
  *调用关系：更新主体视图createpage；被删除文件名renamefile函数调用
  */
function refileNo(value){
    $("#showPage").empty();
    createPage();
}
/**
  *函数功能：修改文件名
  *输入参数：目标文件的该目录下文件数组下标
  *输出参数：~
  *返回值：~
  *调用关系：调用确认删除refileyes与取消删除renameno函数；被文件删除按钮调用
  */
function renameFile(value){
    $("#filenameclass"+value.toString()).empty();
    var NewName=$("<input id='NewName'></input><button onclick='refileYes("+value+")'>确定</button><button onclick='refileNo("+value+")'>取消</button>");
    $("#filenameclass"+value.toString()).append(NewName);
}
/**
  *函数功能：移动文件
  *输入参数：目标文件的该目录下文件数组下标
  *输出参数：~
  *返回值：~
  *调用关系：调用更新主体视图createpage函数；被文件移动按钮调用
  */
function moveFile(value){
    movefile=now.files[value];
    now.files.splice(value,1);
    $("#showPage").empty();
    createPage();
}
/**
  *函数功能：下载文件
  *输入参数：目标文件的该目录下文件数组下标
  *输出参数：~
  *返回值：null/false，若为false则取消删除
  *调用关系：被文件文件按钮调用
  */
function downFile(value) {
    var r = confirm("是否下载该文件");
    if (r == true) {
        var files = email;//服务器用户文件夹
        var file = now.files[value].addr + now.files[value].final;//服务器用户文件绝对路径
        var ofile = now.files[value].name;//用户文件名
        var formdata = new FormData();//创建表单
        formdata.append("filrs", files);//文件夹名入表单
        formdata.append("file", file);//据对路径入表单
        formdata.append("ofile", ofile);//文件名入表单
        console.log(file + "down");
    }
    else
        return false;
}
/**
  *函数功能：打开文件夹
  *输入参数：目标文件夹的该目录下文件夹数组下标
  *输出参数：~
  *返回值：~
  *调用关系：调用更新视图按钮函数；被文件夹打开按钮调用
  */
function openDir(value) {
    now = now.dirs[value];//now切换至新文件目录
    levernum++;
    level[levernum]=now;//文件回调目录
    $("#showPage").empty();
    createPage();
};
/**
  *函数功能：删除文件夹
  *输入参数：目标文件夹的该目录下文件夹数组下标
  *输出参数：~
  *返回值：~
  *调用关系：调用更新视图按钮函数；被文件夹删除按钮调用
  */
function deleteDir(value){
	if(now.dirs[value].files.length==0){
	    now.dirs.splice(value,1);//用户json中删除
	    $("#showPage").empty();
	    createPage();
	}
	else{
		 alert("你不能删除有文件的文件夹");
	}
}
/**
  *函数功能：创建文件夹
  *输入参数：~
  *输出参数：~
  *返回值：~
  *调用关系：调用更新视图按钮函数；被文件夹创建按钮调用
  */
function createDirs(){
    var newdirs = new Dir("新建文件夹");
    now.dirs.push(newdirs);//入json数据
    $("#showPage").empty();
    createPage();
}
/**
  *函数功能：确认修改文件夹名
  *输入参数：目标文件夹的该目录下文件夹数组下标
  *输出参数：~
  *返回值：~
  *调用关系：调用更新视图按钮函数；被修改文件夹名renamedir调用
  */
function renameYes(value){
    now.dirs[value].name=$("#NewName").val();
    $("#showPage").empty();
    createPage();
}
/**
  *函数功能：取消修改文件夹名
  *输入参数：目标文件夹的该目录下文件夹数组下标
  *输出参数：~
  *返回值：~
  *调用关系：调用更新视图按钮函数；被修改文件夹名renamedir调用
  */
function renameNo(value){
    $("#showPage").empty();
    createPage();
}
/**
  *函数功能：修改文件夹名
  *输入参数：目标文件夹的该目录下文件夹数组下标
  *输出参数：~
  *返回值：~
  *调用关系：调用确认文件夹名修改renamediryes与取消文件夹名修改renameno函数；被文件修改按钮调用
  */
function renameDir(value){
    $("#nameclass"+value.toString()).empty();
    var NewName=$("<input id='NewName'></input><button onclick='renameYes("+value+")'>确定</button><button onclick='renameNo("+value+")'>取消</button>");
    $("#nameclass"+value.toString()).append(NewName);
}
/**
  *函数功能：移动文件至该目录下
  *输入参数：目标文件夹的该目录下文件夹数组下标
  *输出参数：~
  *返回值：~
  *调用关系：调用更新视图按钮函数；被粘贴按钮调用
  */
function pasteDir(value){
    var newfile=movefile;
    movefile=null;
    now.dirs[value].files.push(newfile);
    $("#showPage").empty();
    createPage();
}
/**
  *函数功能：点击跳转文件回调目录
  *输入参数：回调层
  *输出参数：~
  *返回值：~
  *调用关系：调用更新视图按钮函数；被回调按钮调用
  */
function rebreadcrumb(value){
    for(var j=levernum;j>value;j--){
        level.pop();
        levernum--;
    }
    now=level[value];
     $("#showPage").empty();
    createPage();
}
/**
  *函数功能：修改上传按钮
  *输入参数：1-改为文件上传中/0-改为上传按钮
  *输出参数：~
  *返回值：~
  *调用关系：被文件上传函数creatfilr调用
  */
function createupfile(value){
    console.log("createupfile")
    console.log(typeof value)
    console.log(value)
    //修改为文件上传中文本
    if(value==1) {
        $("#file").hide();
        $("#upfile").append("<a id='ing'>文件上传中……</a>");
    }
    //修改为文件上传按钮
    if(value==0) {
        $("#ing").remove();
        $("#file").show();
    }
}
/**
  *函数功能：更新文件主体目录视图
  *输入参数：~
  *输出参数：~
  *返回值：~
  *调用关系：被所有的文件与文件夹操作函数调用调用
  */
function createPage() {
    //修改主体目录
    $("#showPage").append(
        function () {
            str = "";
            //遍历文件夹创建
            for (var i =0;i<now.dirs.length;i++){
                str+=" <li class=\"list-group-item px-0\">\n" +
                "\n" +
                "                            <div class=\"row align-items-center\">\n" +
                "                                <div class=\"col-auto\">\n" +
                "\n" +
                "                                    <!-- Avatar -->\n" +
                "                                    <a href=\"#!\" class=\"avatar avatar-lg\">\n" +
                "                          <span class=\"avatar-title rounded bg-white text-secondary\">\n" +
                "                            <span class=\"fe fe-folder\"></span>\n" +
                "                          </span>\n" +
                "                                    </a>\n" +
                "\n" +
                "                                </div>\n" +
                "                                <div id='nameclass"+i+"' class=\"col ml--2\">\n" +
                "\n" +
                "                                    <!-- Title -->\n" +
                "                                    <h4  id='name"+i+" 'class=\"card-title mb-1 name\">\n" +
                "                                        <a href=\"#!\" onclick=\"openDir("+i+")\">"+
                    now.dirs[i].name+
                    "</a>\n" +
                    "                                    </h4>\n" +
                    "\n" +
                    "                                </div>\n" +
                    "\n" +
                    "                                <div class=\"col-auto\">\n" +
                    "\n" +
                    "                                    <!-- Dropdown -->\n" +
                    "                                    <div class=\"dropdown\">\n" +
                    "                                        <a href=\"#!\" class=\"dropdown-ellipses dropdown-toggle\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
                    "                                            <i class=\"fe fe-more-vertical\"></i>\n" +
                    "                                        </a>\n" +
                    "                                        <div id='dropdown"+i+"' class=\"dropdown-menu dropdown-menu-right\">\n" +
                    "                                            <a href=\"#!\" onclick=\"renameDir("+i+")\" class=\"dropdown-item\">\n" +
                    "                                               重命名\n" +
                    "                                            </a>\n" +
                    "                                            <a href=\"#!\" onclick=\"deleteDir("+i+")\" class=\"dropdown-item\">\n" +
                    "                                                删除\n" +
                    "                                            </a>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "\n" +
                    "                                </div>\n" +
                    "                            </div> <!-- / .row -->\n" +
                    "\n" +
                    "                        </li>"


            }
            //遍历文件创建
            for (var k =0;k<now.files.length;k++){
                str+=" <li class=\"list-group-item px-0\">\n" +
                    "\n" +
                    "                            <div class=\"row align-items-center\">\n" +
                    "                                <div class=\"col-auto\">\n" +
                    "\n" +
                    "                                    <!-- Avatar -->\n" +
                    "                                    <a href=\"#!\" class=\"avatar avatar-lg\">\n" +
                    "                          <span class=\"avatar-title rounded bg-white text-secondary\">\n" +
                    "                            <span class=\"fe  fe-file\"></span>\n" +
                    "                          </span>\n" +
                    "                                    </a>\n" +
                    "\n" +
                    "                                </div>\n" +
                    "                                <div id='filenameclass"+k+"' class=\"col ml--2\">\n" +
                    "\n" +
                    "                                    <!-- Title -->\n" +
                    "                                    <h4 class=\"card-title mb-1 name\">\n" +
                    "                                       <a href=\"download.do?file="+now.files[k].addr+now.files[k].final+ "&filrs="+ email +"&ofile="+ now.files[k].name +"\" onclick=\"return downFile("+k+")\">" +
                    now.files[k].name+
                    "</a>\n" +
                    "                                    </h4>\n" +
                    "\n" +
                    "                                </div>\n" +
                    "\n" +
                    "                                <div class=\"col-auto\">\n" +
                    "\n" +
                    "                                    <!-- Dropdown -->\n" +
                    "                                    <div class=\"dropdown\">\n" +
                    "                                        <a href=\"#!\" class=\"dropdown-ellipses dropdown-toggle\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
                    "                                            <i class=\"fe fe-more-vertical\"></i>\n" +
                    "                                        </a>\n" +
                    "                                        <div id='filedropdown"+k+"' class=\"dropdown-menu dropdown-menu-right\">\n" +
                    "                                            <a href=\"#!\"  onclick=\"renameFile("+k+")\" class=\"dropdown-item\">\n" +
                    "                                               重命名\n" +
                    "                                            </a>\n" +
                    "                                            <a href=\"#!\" onclick='deleteFile("+k+")'class=\"dropdown-item\">\n" +
                    "                                                删除\n" +
                    "                                            </a>\n" +
                    "                                            <a href=\"#!\" id='move"+k+"' onclick='moveFile("+k+")'class=\"dropdown-item\">\n" +
                    "                                                移动\n" +
                    "                                            </a>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "\n" +
                    "                                </div>\n" +
                    "                            </div> <!-- / .row -->\n" +
                    "\n" +
                    "                        </li>"


            }
            return str;
        }
    );
	//如果有文件要移动，关闭文件移动按钮，打开文件夹粘贴按钮
    if(movefile!=null){
        for( var i =0;i<now.dirs.length;i++){
            $("#dropdown"+i.toString()).append("<a href='#!' onclick='pasteDir("+i+")' class='dropdown-item'>粘贴</a>");
        }
        for(var k =0;k<now.files.length;k++){
            $("#move"+k.toString()).remove();
        }
    }
    //创建返回上一级按钮
    if(levernum>=1){
        var n=levernum-1;
        $("#showPage").append("<a href='#!' onclick='rebreadcrumb("+n+")'>&laquo;返回上一级</a>");
    }
    //更新文件夹回调目录
    $("#breadcrumb").empty();
    for(var i=0;i<levernum+1;i++){
        var str=level[i].name;
        if(i==0&&i==levernum)$("#breadcrumb").append("<li id='level"+i+"' class='breadcremb-item'>"+str+"</li>")
        if(i!=0&&i==levernum)$("#breadcrumb").append("<li id='level"+i+"' class='breadcremb-item'>&raquo;"+str+"</li>")
        if(i==0&&i!=levernum)$("#breadcrumb").append("<li id='level"+i+"' class='breadcremb-item'><a href='#!' onclick='rebreadcrumb("+i+")'>"+str+"</a></li>")
        if(i!=0&&i!=levernum)$("#breadcrumb").append("<li id='level"+i+"' class='breadcremb-item'><a href='#!' onclick='rebreadcrumb("+i+")'>&raquo;"+str+"</a></li>")
    }
};
/**
  *函数功能：规范文件大小size，文件大小换成'M'单位，保留两位
  *输入参数：size，字节为单位，长度不固定
  *输出参数：~
  *返回值：size，M为单位，保留小数点后三位
  *调用关系：文件创建与上传函数creatfile调用
  */
function sizefan(value){
    var size=value/1024/1024;
    return size.toFixed(3);
}
/**
  *函数功能：注销登陆
  *输入参数：~
  *输出参数：~
  *返回值：~
  *调用关系：被注销登陆按钮调用
  */
function logout() {
    $.ajax({
        url:"out.do",
        type: 'POST',
        data: {"filepathData":JSON.stringify(dir),//将用户json保存至服务器
        "student_Id":email},
        async: false,
        success:function (data) {
            console.log("chengg"+data.toString())

        },
        error:function (data) {
            console.log("shib"+data.toString())

        }

    });
}