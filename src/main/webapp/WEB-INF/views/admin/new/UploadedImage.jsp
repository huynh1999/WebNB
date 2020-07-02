<%@include file="/common/taglib.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: Huynh
  Date: 5/26/2020
  Time: 1:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:forEach var="item" items="${list}">
        <div style="display: inline-block;vertical-align: top;width: 22%">
            <img style="height: 200px;width: 99%" src="${item.link}">
            <p>${item.link}</p>
        </div>

    </c:forEach>
</body>
</html>
