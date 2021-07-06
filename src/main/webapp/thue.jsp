<%--
  Created by IntelliJ IDEA.
  User: THANH
  Date: 7/6/2021
  Time: 0:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <form action="" method="post">
        ID<input type="text" name="idOrder"><br/>
        Ngay thue <input type="text" name="ngaybatdau"><br/>
        Ngay tra <input type="text" name="ngayketthuc"><br/>
        id<input type="text" value="<%=request.getParameter("id")%>"<br/>
        <button type="submit">submit</button>
    </form>
</div>
</body>
</html>
