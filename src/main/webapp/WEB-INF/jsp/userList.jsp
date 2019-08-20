<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            alert(page);
            $("#pageNum").val(page);
            $("#formSearch").submit();
        }
    </script>
    <style >
        .layui-form-label{
            width:120px
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
    <script>
        layui.use('laydate', function(){
            var laydate = layui.laydate;
        laydate.render({
            elem: '#test11'
            ,format: 'yyyy年MM月dd日'
        });
        });

        function test(){
            alert("该用户不可设为管理员");
        };
    </script>

</head>
<body>
<div class="container-fluid">
    <form  id="formSearch" action="<%=basePath%>user/selectAllUser" method="post">
        <input name="pageNum" id="pageNum" type="hidden" value=" ${search.pageNum }" >

        ${msg}<br>
        <div class="layui-inline">
            <label class="layui-form-label">用户编号：</label>
            <div class="layui-input-inline">
                <input  name="userid" value="${search.userid}" class="layui-input" type="text" placeholder="请输入用户编号">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户姓名：</label>
            <div class="layui-input-inline">
                <input name="username" class="layui-input" value="${search.username}"  type="text" placeholder="请输入用户姓名">
            </div>
        </div>

        <div class="layui-inline">
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp用户类型：
            <div class="layui-input-inline">
                <select name="type" >
                    <option <c:if test="${search.type==0}" >selected="selected"</c:if> value="">全部</option>
                    <option <c:if test="${search.type==1}" >selected="selected"</c:if> value="1">老师</option>
                    <option <c:if test="${search.type==2}" >selected="selected"</c:if> value="2">学生</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">加入时间：</label>
            <div class="layui-input-inline">
                <input name="createtime" class="layui-input" value="<fmt:formatDate value="${search.createtime}" type="date" pattern="yyyy年MM月dd日"/>" id="test11" type="text"  placeholder="加入时间位于日期之后">
            </div>
        </div>
        &nbsp&nbsp&nbsp&nbsp&nbsp
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
                <th>用户编号</th>
                <th>用户姓名</th>
                <th>用户类型</th>
                <th>加入时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <br>
            <tbody>
            <c:forEach items="${page.list}" var="user">
                <tr>
                    <td>${user.userid}</td>
                    <td>${user.username}</td>
                    <td>
                        <c:if test="${user.type==4}">超级管理员</c:if>
                        <c:if test="${user.type==1}">老师</c:if>
                        <c:if test="${user.type==2}" >学生</c:if>
                        <c:if test="${user.type==3}" >管理员</c:if>
                    </td>

                    <td><fmt:formatDate value="${user.createtime}" type="date" pattern="yyyy年MM月dd日"/></td>

                    <td>
                        <c:choose>
                            <c:when test="${sessionScope.user.type==3&&user.type==1}">
                                <a class="but1" href="<%=basePath%>user/powerManage?userId=${user.userid}&type=3">设为管理员</a>
                            </c:when>
                            <c:otherwise>
                               <a class="but1" disabled="true" onclick="test()" href="javascript:;">设为管理员</a>


                            </c:otherwise>
                        </c:choose>


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
