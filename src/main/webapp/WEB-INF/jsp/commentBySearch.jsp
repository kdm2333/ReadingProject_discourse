<%@ page language="java" contentType="text/html; charset=utf-8"
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

    <meta charset="utf-8">

    <link rel="stylesheet" href="<%=basePath%>css/layui/css/layui.css">
    <script src="<%=basePath%>css/layui/layui.js" charset="utf-8"></script>


    <title>Title</title>
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=basePath%>css/jquery-1.11.1.min.js"></script>
    <script type="text/javascript"
            src="<%=basePath%>css/bootstrap.js"></script>
    <script type="text/javascript">
        function to_page(page) {
           /* alert(page);*/
            $("#pageNum").val(page);
            $("#formSearch").submit();
        }
    </script>
    <style type="">
        .layui-form-label{
            width: 150px;
        }
        .but1{
            text-decoration:none;
            width:80px;
            height:30px;
            border:solid 1px #337ab7;
            background-color:#337ab7;
            color:#F8F8F8;
            border-radius:30px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <form  id="formSearch" action="<%=basePath%>comment/selectCommentBySearch">
        <input name="pageNum" id="pageNum" type="hidden" value=" ${search.pageNum }" >

        ${msg}<br>
        <div class="layui-inline">
            <label class="layui-form-label">书名：</label>
            <div class="layui-input-inline">
                <input  name="bookname" value="${search.bookname}" class="layui-input" type="text" placeholder="请输入书名">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">书籍编号：</label>
            <div class="layui-input-inline">
                <input name="bookid" class="layui-input" value="${search.bookid}"   type="text" placeholder="请输入书籍编号">
            </div>
        </div>

        <div class="layui-inline">
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp评论人类型：
            <div class="layui-input-inline">
                <select name="usertype" >
                    <option <c:if test="${search.usertype=='0'}" >selected="selected"</c:if> value="0">全部</option>
                    <option <c:if test="${search.usertype=='1'}" >selected="selected"</c:if> value="1">老师</option>
                    <option <c:if test="${search.usertype=='2'}" >selected="selected"</c:if> value="2">学生</option>
                </select>
            </div>
        </div>

        <div class="layui-inline">
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp评论状态：
            <div class="layui-input-inline">
                <select name="status"  id="">
                    <option <c:if test="${search.status=='0'}" >selected="selected"</c:if> value="0">全部</option>
                    <option <c:if test="${search.status=='1'}" >selected="selected"</c:if> value="1">有效</option>
                    <option <c:if test="${search.status=='2'}" >selected="selected"</c:if> value="2">无效</option>
                    <option <c:if test="${search.status=='3'}" >selected="selected"</c:if> value="3">已删除</option>
                </select>
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">评论人账号：</label>
            <div class="layui-input-inline">
                <input name="userid" class="layui-input" value="${search.userid}"  type="text" placeholder="请输入评论人账号">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">评论人姓名：</label>
            <div class="layui-input-inline">
                <input name="username" class="layui-input" value="${search.username}"  type="text" placeholder="请输入评论人姓名">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">标题：</label>
            <div class="layui-input-inline">
                <input name="topic" class="layui-input" value="${search.topic}"  type="text" placeholder="请输入标题">
            </div>
        </div>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button class="but1" type="submit"  lay-submit="">查找</button>
            </div>
        </div>
    </form>

    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>评论书籍</th>
                <th>评论人</th>
                <th>标题</th>
                <th>评论人类别</th>
                <th>评论状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.list}" var="comment">
                <tr>
                    <td>${comment.bookname}</td>
                    <td>${comment.username}</td>
                    <td>${comment.topic}</td>

                    <td>
                        <c:if test="${comment.usertype==1}">
                            学生
                        </c:if>
                        <c:if test="${comment.usertype==2}">
                            老师
                        </c:if>
                        <c:if test="${comment.usertype==3}">
                            老师
                        </c:if>
                    </td>
                    <td>

                        <c:if test="${comment.status==1}">
                            正常
                        </c:if>
                        <c:if test="${comment.status==2}">
                            已删除
                        </c:if>
                        <c:if test="${comment.status==3}">
                            书籍失效
                        </c:if>

                    </td>
                    <td>

                        <c:if test="${comment.status==1}">

                            <a class="but1" href="<%=basePath%>comment/selectCommentById?commentid=${comment.commentid}">详情</a>
                            <a class="but1" href="<%=basePath%>comment/updateComment?commentid=${comment.commentid}&status=2">删除</a>
                            <%--  <button type="button" class="btn btn-danger">暂停使用</button>--%>
                        </c:if>
                        <c:if test="${comment.status==2}">

                            <a class="but1" href="<%=basePath%>comment/selectCommentById?commentid=${comment.commentid}">详情</a>
                            <a class="but1" href="<%=basePath%>comment/updateComment?commentid=${comment.commentid}&status=1">恢复</a>
                            <%--  <button type="button" class="btn btn-danger">暂停使用</button>--%>
                        </c:if>
                        <c:if test="${comment.status==3}">

                            <a class="but1" href="<%=basePath%>book/selectBookById?bookId=${book.bookid}">详情</a>
                            <%--  <button type="button" class="btn btn-danger">暂停使用</button>--%>
                        </c:if>

                    </td>
                </tr>
            </c:forEach>

            </tbody>

        </table>
        <br><br>
        <div class="container-fluid">
            <table style="width: 100%;">
                <tr>
                    <td>当前第${page.pageNum }页，总共${page.pages }页，总共${page.total }条数据</td>
                    <td style="float: right;">
                        <nav>
                            <ul class="pagination" style="margin: 0;">
                                <c:choose>
                                    <c:when test="${!page.hasPreviousPage}">
                                        <li class="disabled"><a href="javascript:void(0);"
                                                                aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                        </a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="javascript:to_page(${page.pageNum -1 });"
                                               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                        </a></li>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach items="${page.navigatepageNums}" var="item">
                                    <c:choose>
                                        <c:when test="${page.pageNum==item }">
                                            <li class="active"><a
                                                    href="javascript:to_page(${item });"> ${item}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="javascript:to_page(${item });"> ${item}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${!page.hasNextPage}">
                                        <li class="disabled"><a href="javascript:void(0);"
                                                                aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                        </a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="javascript:to_page(${page.pageNum+1 });"
                                               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                        </a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</div>

</body>
</html>
