<%--
  Created by IntelliJ IDEA.
  User: Huy Hoang
  Date: 7/7/2021
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>${sessionScope.get("userLogin").name}</h1>
</body>
</html>
