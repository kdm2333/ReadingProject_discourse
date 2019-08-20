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
            <c:choose>
                <c:when test="${type==2}"><h1 class="brand-title">名师领读</h1></c:when>

                <c:when test="${type==1}"><h1 class="brand-title">思想碰撞</h1></c:when>
            </c:choose>

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

                <!-- A single blog post -->


                <c:forEach items="${userComment}" var="userComment">

                    <section class="post">
                        <header class="post-header">

                            <h2 class="post-title">${userComment.topic}</h2>

                            <p class="post-meta">
                                By <a href="<%=basePath%>comment/selectByUserId?userId=${userComment.userid}" class="post-author">${userComment.username}</a> under <a class="post-category post-category-design" href="<%=basePath%>comment/selectAllCommentByBook?bookid=${userComment.bookid}">${userComment.bookname}</a> <%--<a class="post-category post-category-pure" href="#">Pure</a>--%>
                            </p>
                        </header>

                        <div class="post-description">
                            <p>
                                    ${userComment.content}
                            </p>
                        </div>

                    </section>

                </c:forEach> <br/>
            </div>



            <%--<div class="footer">
                <div class="pure-menu pure-menu-horizontal">
                    <ul>
                        <li class="pure-menu-item"><a href="http://purecss.io/" class="pure-menu-link">About</a></li>
                        <li class="pure-menu-item"><a href="http://twitter.com/yuilibrary/" class="pure-menu-link">Twitter</a></li>
                        <li class="pure-menu-item"><a href="http://github.com/pure-css/pure/" class="pure-menu-link">GitHub</a></li>
                    </ul>
                </div>
            </div>--%>
        </div>
    </div>
</div>




</body>
</html>
