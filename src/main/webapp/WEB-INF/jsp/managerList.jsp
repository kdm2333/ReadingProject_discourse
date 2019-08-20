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
    </script>

</head>
<body>
<div class="container-fluid">
    <form  id="formSearch" action="<%=basePath%>user/selectAllManager">
        <input name="pageNum" id="pageNum" type="hidden" value=" ${search.pageNum }" >

        ${msg}<br>
        <div class="layui-inline">
            <label class="layui-form-label">教师编号：</label>
            <div class="layui-input-inline">
                <input  name="userid" value="${search.userid}" class="layui-input" type="text" placeholder="请输入编号">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">教师姓名：</label>
            <div class="layui-input-inline">
                <input name="username" class="layui-input" value="${search.username}"  type="text" placeholder="请输入姓名">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">加入时间：</label>
            <div class="layui-input-inline">
                <input name="createtime" class="layui-input" id="test11" type="text" value="${search.createtime}" placeholder="加入时间位于日期之后">
            </div>
        </div>
        &nbsp&nbsp&nbsp&nbsp&nbsp
        <div class="layui-inline">
            <div class="layui-input-inline">
                <button class="but1" type="submit"  lay-submit="">查找</button>

            </div>
        </div>
        <%--<div class="layui-inline">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input name="submit" class="layui-input" type="submit" value=" 查找 ">
            </div>

            &lt;%&ndash;<input type="submit" value="查找" class="but2">&ndash;%&gt;
        </div>--%>
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
                <th>教师编号</th>
                <th>教师姓名</th>
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
                    <td><fmt:formatDate value="${user.createtime}" type="date" pattern="yyyy年MM月dd日"/></td>

                    <td>
                        <c:choose>
                            <c:when test="${sessionScope.user.type==0}">
                                <a class="but1" href="<%=basePath%>user/powerManage?userId=${user.userid}&type=1">取消管理资格</a>
                            </c:when>
                            <c:otherwise>
                                您暂无操作权限
                            </c:otherwise>
                        </c:choose>
                        <%--<c:if test="${sessionScope.user.type==0}">

                            <a href="<%=basePath%>user/powerManage?userId=${user.userid}&type=1">取消管理资格</a>
                            &lt;%&ndash;  <button type="button" class="btn btn-danger">暂停使用</button>&ndash;%&gt;
                        </c:if>--%>
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
