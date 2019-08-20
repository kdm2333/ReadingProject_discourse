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
        body{
            background: url(<%=basePath%>img/common/login.jpg) no-repeat;
            font-family: "Microsoft YaHei";
            overflow-y:hidden;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .container{

            width: 420px;

            height: 320px;

            min-height: 320px;

            max-height: 320px;

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
        h1{
            width: 100%;
            text-align: center;
            margin: 20px 0;
            color: #0C0C0C;
        }

    </style>

</head>

<body>

<form class="layui-form" action="<%=basePath%>login/login" method="post">

    <div class="container">
        <h1 >中北大学阅读汇平台</h1>
        <br>

        <div class="layui-form-item">

            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="userId" required lay-verify="required" placeholder="请输入账号" class="layui-input">
            </div>

        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密 &nbsp;&nbsp;码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" class="layui-input">
            </div>
        </div>

        <div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                </div>
            <div>
                <br>
            </div>

             &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <a href="<%=basePath%>login/toRegist" class="font-set">去注册</a>


            </div>
        </div>

    </div>

</form>
</body>
</html>