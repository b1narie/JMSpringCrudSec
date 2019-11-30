<%--
  Created by IntelliJ IDEA.
  User: mrx
  Date: 21.11.2019
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List of all users.</title>
</head>
<body>
<div align="center">
    <table border="1px" cellpadding="5">
        <caption><h2>List of all users</h2></caption>
        <tr>
            <th>id</th>
            <th>firstName</th>
            <th>lastName</th>
            <th>address</th>
            <th>login</th>
            <th>password</th>
            <th>role</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.firstName}"/></td>
                <td><c:out value="${user.lastName}"/></td>
                <td><c:out value="${user.address}"/></td>
                <td><c:out value="${user.login}"/></td>
                <td><c:out value="${user.password}"/></td>
                <td>
                    <c:forEach var="role" items="${user.roles}">
                        ${role.role}
                    </c:forEach>
                </td>
                <form method="get" action="/admin/edit/${user.id}">
                    <td>
                        <button type="submit">Edit</button>
                    </td>
                </form>
                <form method="get" action="/admin/delete/${user.id}">
                    <td>
                        <button type="submit">Delete</button>
                    </td>
                </form>
            </tr>
        </c:forEach>
    </table>
    <h2><a href="/admin/add">Add user</a></h2>
    <a href="/logout">Logout</a>
</div>
</body>
</html>
