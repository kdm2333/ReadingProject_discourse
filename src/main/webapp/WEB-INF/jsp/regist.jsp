<%--<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a blog page with a list of posts.">
    <title>Blog &ndash; Layout Examples &ndash; Pure</title>

    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-" crossorigin="anonymous">

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-old-ie-min.css">
    <![endif]-->
    <!--[if gt IE 8]><!-->
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-min.css">
    <!--<![endif]-->


    <!--[if lte IE 8]>
    <link rel="stylesheet" href="../css/layouts/blog-old-ie.css">
    <![endif]-->
    <!--[if gt IE 8]><!-->
    <link rel="stylesheet" href="<%=basePath%>css/pure/pure-min.css">
    <!--<![endif]-->
    <style>
        body{
            background: url(<%=basePath%>img/common/login.jpg) no-repeat;
            font-family: "Microsoft YaHei";
            overflow-y:hidden;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        form {
            margin: 150px auto;
            width: 300px;
        }
    </style>
</head>
<body>
<form action="<%=basePath%>login/regist" class="pure-form pure-g" method="post">
    <fieldset class="pure-group pure-u-1">

        ${msg}<br>
        姓 名：<input name="username"  class="pure-input-1" placeholder="用户名"type="text"><br>
        账 号：<input name="userid"  class="pure-input-1" placeholder="用户名"type="text"><br>
        密码：<input name="password" class="pure-input-1" placeholder="用户名" type="passWord"><br>
        类型：<input type="checkbox"  class="pure-input-1" placeholder="用户名" name="type" VALUE="2">学生
        <input type="checkbox" name="type" class="pure-input-1" placeholder="用户名" value="1">老师


    </fieldset>
    <div class="pure-group pure-input-1">
        <button type="submit" class="pure-button pure-input-1 pure-button-primary">注册</button>
    </div>
</form>
</body>
</html>--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8">

    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">

    <style type="text/css">

        .container{

            width: 420px;

            height: 500px;

            min-height: 320px;

            max-height:380px;

            position: absolute;

            top: 0;

            left: 0;

            bottom: 0;

            right: 0;

            margin: auto;

            padding: 20px;

            z-index: 130;

            border-radius: 8px;

            background-color: #fff;

            box-shadow: 0 3px 18px rgba(100, 0, 0, .5);

            font-size: 16px;

        }

        .close{

            background-color: white;

            border: none;

            font-size: 18px;

            margin-left: 410px;

            margin-top: -10px;

        }



        .layui-input{

            border-radius: 5px;

            width: 300px;

            height: 40px;

            font-size: 15px;

        }

        .layui-form-item{

            margin-left: -20px;

        }

        #logoid{

            margin-top: -16px;

            padding-left:150px;

            padding-bottom: 15px;

        }

        .layui-btn{

            margin-left: -50px;

            border-radius: 5px;

            width: 350px;

            height: 40px;

            font-size: 15px;

        }

        .verity{

            width: 120px;

        }

        .font-set{

            font-size: 13px;

            text-decoration: none;

            margin-left: 120px;

        }

        a:hover{

            text-decoration: underline;

        }
        body{
            background: url(<%=basePath%>img/common/login.jpg) no-repeat;
            font-family: "Microsoft YaHei";
            overflow-y:hidden;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        h1{
            width: 100%;
            text-align: center;
            margin: 20px 0;
            color: #0C0C0C;
        }


    </style>

</head>

<body>

<form class="layui-form" action="<%=basePath%>login/regist" method="post">

    <div class="container">
        <h1 >中北大学阅读汇平台</h1>

        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-block">
                <input type="text" name="userid" required  lay-verify="required" placeholder="请输入学号" autocomplete="off" class="layui-input">
            </div>

        </div>

        <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密 &nbsp;&nbsp;码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户类型</label>
            <div class="layui-input-block">
                <input name="type" title="学生" type="radio" checked="" value="2">
                <input name="type" title="老师" type="radio" value="1">
            </div>
            <div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">注册</button>
                    </div>
                </div>

            </div>

        </div>

        <div>${msg}</div>
    </div>
</form>
</body>

<script src="<%=basePath%>layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;




        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });




    });
</script>
</html>
</html>