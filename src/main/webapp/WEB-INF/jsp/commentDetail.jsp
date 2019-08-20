<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="<%=basePath%>layui\css\layui.css">
    <script src="<%=basePath%>layui\layui.js" charset="utf-8"></script>
    <title>Insert title here</title>
    <style>
        table {
            border-collapse:collapse;
        }
        table tr th{
            border:0px solid #0066cc;
            color:#F8F8F8;
        }
        table tr td{
            border-bottom:3px dotted #c9c9c9;
            text-align:center;
            height:50px;
            color:#660033;
        }
        .tr1  {
            background-color:#180000;
        }
        .th1  {
            width:120px;
            text-align:center;
        }
        .but1{
            text-decoration:none;
            width:100px;
            height:50px;
            border:solid 1px red;
            background-color:red;
            color:#F8F8F8;
            border-radius:30px;
        }
        .but2{
            text-decoration:none;
            width:130px;
            height:30px;
            border:solid 1px red;
            background-color:red;
            color:#F8F8F8;
            border-radius:30px;
        }
        .layui-form-label{
            width:150px;
            height:30px;
        }

    </style>
    <script>
        $('#delete').click(function(){
            window.location.href="<%=basePath%>comment/updateComment?commentid=${comment.commentid}&status=2"
        })
    </script>
</head>
<body>
<form class="layui-form" action="<%=basePath%>comment/selectCommentBySearch">
    <br><br>
    <fieldset class="layui-elem-field">
        <legend>书评详情</legend>
        <br><br>
        <div class="layui-form">

            <div class="layui-inline">
                <label class="layui-form-label">评论书籍：</label>
                <div class="layui-input-inline">
                    <input style="border:none;" readonly="true" name="teacherName" class="layui-input" type="text" value="${book.bookname}">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">书籍作者：</label>
                <div class="layui-input-inline">
                    <input style="border:none;" readonly="true" name="teacherName" class="layui-input" type="text" value="${book.author}">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">书评状态：</label>
                <div class="layui-input-inline">
                    <c:if test="${comment.status==1}">
                        <input style="border:none;" readonly="true" name="teacherName" class="layui-input" type="text" value="已发布">
                    </c:if>
                    <c:if test="${comment.status==2}">
                        <input style="border:none;" readonly="true" name="teacherName" class="layui-input" type="text" value="已删除">
                    </c:if>
                    <c:if test="${comment.status==3}">
                        <input style="border:none;" readonly="true" name="teacherName" class="layui-input" type="text" value="书籍失效">
                    </c:if>
                </div>
            </div>

            <br>
            <div class="layui-inline">
                <label class="layui-form-label">书评作者：</label>
                <div class="layui-input-inline">
                    <input style="border:none;" readonly="true"  name="teacherName" class="layui-input" type="text" value="${user.username}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户角色：</label>
                <div class="layui-input-inline">
                    <c:choose>
                        <c:when test="${user.type==2}">
                            <input style="border:none;" readonly="true" name="teacherName" class="layui-input" type="text" value="学生">
                        </c:when>
                        <c:otherwise>
                            <input style="border:none;" readonly="true" name="teacherName" class="layui-input" type="text" value="教师">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">评论时间：</label>
                <div class="layui-input-inline">
                    <input style="border:none;" readonly="true" name="teacherName" class="layui-input" type="text" value="<fmt:formatDate value="${comment.createtime}" type="date" pattern="yyyy-MM-dd HH:mm"/>">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">书评标题：</label>
                <div class="layui-input-block">
                    <input style="border:none;width: 80%;" readonly="true" name="teacherName" class="layui-input" type="text" value="${comment.topic}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">书评详情：</label>
                <div class="layui-input-block">
            <textarea style="border:none; width: 80%;" readonly="true" class="layui-textarea" name="activityContent">
                ${comment.content}
            </textarea>
                </div>
            </div>
        </div>
    </fieldset>
    <br> <br> <br>
    <div class="layui-form-item">
        <button class="layui-btn" type="submit" lay-filter="demo2" lay-submit="">回到列表</button>
    <%--</div>
    <div class="layui-form-item">--%>
        <button id="delete" class="layui-btn" type="submit" lay-filter="demo2" lay-submit="">
            <a class="layui-btn" href="<%=basePath%>comment/updateComment?commentid=${comment.commentid}&status=2">删除</a>
        </button>
    </div>


</form>

</div>
</body>
</html>
