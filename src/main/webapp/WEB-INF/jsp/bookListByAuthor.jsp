<%--<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=basePath%>css/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
    function to_page(page) {
        alert(page);
    $("#pageNum").val(page);
    $("#formSearch").submit();
    }
    </script>
</head>
<body>
<form  id="formSearch" action="<%=basePath%>book/selectAllBook">
<c:forEach items="${booklist}" var="book">
    ${book.bookname} ${book.author} ${book.press}<br>
</c:forEach> <br/>
    <br/>
    <br/>
    <div class="pure-g">
        <c:forEach items="${booklist}" var="book">
            <div class="pure-u-1-5">
                <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">
                    <ul>
                        <dd><img src="<%=basePath%>img/${book.pictureurl}" style="width:150px;height:200px" alt=""><br>
                                ${book.bookname} BY ${book.author}<br></dd>
                    </ul>
                </a>
            </div>
        </c:forEach>
    </div>
</form>
</body>
</html>--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
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
    <link rel="stylesheet" href="<%=basePath%>css/layouts/blog.css">
    <!--<![endif]-->
</head>
<body>

<div id="layout" class="pure-g">

    <div class="sidebar pure-u-1 pure-u-md-1-4">
        <div class="header">
            <h1 class="brand-title">${author}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h1>
<br>
            <nav class="nav">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a class="pure-button" href="<%=basePath%>login/tomain">返回首页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="content pure-u-1 pure-u-md-3-4">
        <div>
            <!-- A wrapper for all the blog posts -->
            <div class="posts">
                <h1 class="content-subhead">读一本书 ，遇见一个自己..</h1>

                <div class="pure-g">
                    <c:forEach items="${booklist}" var="book">
                        <div class="pure-u-1-5">
                            <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">
                                <ul>
                                    <dd><img src="<%=basePath%>img/${book.pictureurl}" style="width:150px;height:200px" alt=""><br>
                                            ${book.bookname} BY ${book.author}<br></dd>
                                </ul>
                            </a>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>

</div>




</body>
</html>
