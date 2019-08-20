<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a blog page with a list of posts.">
    <title>中北大学阅读汇平台</title>

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
    <link rel="stylesheet" href="<%=basePath%>css/pure/pure.css">
    <style>
        #ul1{
            width:500px;
            list-style:none;
            margin-left:1000px;
            margin-top:50px;
        }
        li{
            width:120px;
            float:left;
        }
        .dd{
            text-decoration:none;
            display:block;
            width:100px;
            height:20px;
            color:black;
            text-align:center;
            font-size:20px;
        }
        .dd:hover {
            color:#FF00FF;
        }
        .nav{
            width:100%;
            height:400px;
            background-image:url(<%=basePath%>img/tp2.gif);
            position: relative;
            background-position: 100%;
        }
        .zhuti{
            width:500px;
            height:200px;
            background-color:white;
            position: absolute;
            top: 100px;
            right: 50px;
            opacity:0.7;


        }
        .fk{
            margin: -40px 100px 0;
            height:160px;
            position: relative;
            box-shadow: rgba(224, 224, 224, 0.5) 0px 8px 20px 0px;
            font-size: 40px;
            line-height: 160px;
            text-align: center;
            color: rgb(49, 71, 94);
            background-color: #ffffff;
        }
        .footer{
            /*width:1500px;*/
            height:100px;
            background-color: rgb(247, 247, 247);
            line-height: 100px;
        }
        .footer a{
            text-decoration: none;
            color: #888888;
        }
        .footer a:hover{
            color: #f40000;
        }

        .head {
            box-sizing: border-box;
            height: 100px;
            width: 100%;
            padding-left: 400px;
            padding-right: 30%;
            position: relative;
        }

        .log {
            width: 400px;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }

        #ul1 {
            width: 30%;
            height: 100px;
            line-height: 100px;
            position: absolute;
            right: 0;
            top: 0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: space-around;
        }

        li {
            list-style: none;
        }


        .log-form {
            width: 360px;
            margin: auto;
        }
        .form-div{
            box-sizing: border-box;
            width: 360px;
            position: relative;
            top: 30px;
            width: 100%;
            height: 40px;
            padding-right: 60px;
        }
        .form-input{
            box-sizing: border-box;
            width: 300px;
            height: 40px;
            margin: 0;
            padding-left: 5px;
        }
        .form-btn{
            position: absolute;
            right: 0;
            top: 0;
            box-sizing: border-box;
            margin: 0;
            width: 60px;
            height: 40px;
        }
        .pure-g-dd{
            /*border: 1px solid #888888;*/
            box-shadow: rgba(224, 224, 224, 0.5) 0px 8px 20px 0px;
            background-color: #efefef;
        }
        h1{
            width: 100%;
            text-align: center;
            margin: 20px 0;
        }
        .pure-g{
            margin: 0 100px 0 20px;
            height: 464px;
            overflow: hidden;
        }
        .pure-g2{
            margin-bottom: 50px;
        }
    </style>
    <script>
        function aaaaaaaaa(){
            if(${sessionScope.user.type != 3}){
                alert("对不起，您没有权限进入后台管理系统，请先申请成为管理员")
            }
        }
    </script>
</head>
<body>
<div>
    <div class="head">
    <div class="log">
        <img src="<%=basePath%>img/tp1.gif">
    </div>
        <div class="log-box">
            <form action="<%=basePath%>select/select" method="post" class="log-form">
                <div class="form-div">
                    <input name="selectWords" type="text" placeholder="请输入书名或作者进行查找" class="form-input">
                    <button type="submit" class="form-btn">查找</button>
                </div>
            </form>
        </div>
    <ul id="ul1">
        <li>
            <a href="<%=basePath%>comment/selectTeacherComment" target="mainFrame" class="dd">名师领读</a>
        </li>
        <li>
            <a href="<%=basePath%>comment/selectStudentComment" target="mainFrame" class="dd">思想碰撞</a>
        </li>
        <li>
            <a href="<%=basePath%>comment/selectByUserId?userId=${sessionScope.user.userid}" target="mainFrame" class="dd">我的书评</a>
        </li>
    </ul>
    </div>

    <div class="nav">
        <div class="zhuti" style="font-size:60px">
            校园阅读汇<br>
            <span style="font-size:35px">READING
        COLLECTION</span>
        </div>
    </div>
    <div class="fk">
        书籍是人类进步的阶梯
    </div>
   <h1>本周新书</h1>
    <div class="pure-g">
        <c:forEach items="${newbook}" var="book">
            <div class="pure-u-1-4">
                <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">
                    <ul>
                        <dd class="pure-g-dd" title="${book.bookname} BY ${book.author}"><img src="<%=basePath%>img/${book.pictureurl}" style="display:block;width:150px;height:200px;margin:5px auto;background-size: 100%;" alt="">
                        </dd>
                    </ul>
                </a>
            </div>
        </c:forEach>
    </div>

        <h1>最热书籍</h1>
        <div class="pure-g pure-g2">
            <c:forEach items="${hotbook}" var="book">
                <div class="pure-u-1-4">
                    <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">
                        <ul>
                            <dd class="pure-g-dd" title="${book.bookname} BY ${book.author}"><img src="<%=basePath%>img/${book.pictureurl}" style="display:block;width:150px;height:200px;margin:5px auto;background-size: 100%;">
                            </dd>
                        </ul>
                    </a>
                </div>
            </c:forEach>
        </div>


    <div class="footer">
        <div align="center">
<%--            <a href="javascript:void(0);" onclick="js_method()"></a>--%>
        <a href="<%=basePath%>admin/admin" onclick="aaaaaaaaa()">进入后台管理系统</a>
            ${msg}
        </div>
    </div>

</div>
</body>
</html>