<%--
  Created by IntelliJ IDEA.
  User: THANH
  Date: 7/6/2021
  Time: 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Post
                </h2>
            </caption>
            <c:if test="${post != null}">
                <input type="hidden" name="id" value="<c:out value='${post.id}' />"/>
            </c:if>
            <tr>
                <th>TITLE:</th>
                <td>
                    <input type="text" name="title" size="45"
                           value="<c:out value='${post.title}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>PRICE:</th>
                <td>
                    <input type="text" name="price" size="45"
                           value="<c:out value='${post.price}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Price:</th>
                <td>
                    <input type="text" name="address" size="15"
                           value="<c:out value='${post.address}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>IMG:</th>
                <td>
                    <input type="text" name="img" size="15"
                           value="<c:out value='${post.img}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Describe:</th>
                <td>
                    <input type="text" name="describe" size="15"
                           value="<c:out value='${post.describe}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Status:</th>
                <td>
                    <input type="text" name="describe" size="15"
                           value="<c:out value='${post.status}' />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
