<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: mrx
  Date: 22.11.2019
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add user</title>
</head>
<body>
<div align="center">
    <sf:form action="/admin/add" method="post">
<%--    <form action="/admin/add" method="post">--%>
        <table border="1" cellpadding="5">
            <tr>
                <th>First name: </th>
                <td><input type="text" name="firstName"></td>
            </tr>
            <tr>
                <th>Last name: </th>
                <td><input type="text" name="lastName"></td>
            </tr>
            <tr>
                <th>Address: </th>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <th>Login: </th>
                <td><input type="text" name="login"></td>
            </tr>
            <tr>
                <th>Password: </th>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <th>Role: </th>
                <td>
                    <select name="role">
                        <option>admin</option>
                        <option>user</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="add"></td>
            </tr>
        </table>
<%--    </form>--%>
    </sf:form>
</div>
</body>
</html>
