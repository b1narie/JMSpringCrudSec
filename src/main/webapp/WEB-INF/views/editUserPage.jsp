<%--
  Created by IntelliJ IDEA.
  User: mrx
  Date: 21.11.2019
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit user</title>
</head>
<body>
<div align="center">
    <sf:form action="/admin/edit" method="post">
<%--    <form action="/admin/edit" method="post">--%>
        <table border="1" cellpadding="5">
            <tr>
                <th>Id: </th>
                <td><input type="number" name="id" value="<c:out value="${user.id}"/>" readonly></td>
            </tr>
            <tr>
                <th>First name: </th>
                <td><input type="text" name="firstName" value="<c:out value="${user.firstName}"/>"></td>
            </tr>
            <tr>
                <th>Last name: </th>
                <td><input type="text" name="lastName" value="<c:out value="${user.lastName}"/>"></td>
            </tr>
            <tr>
                <th>Address: </th>
                <td><input type="text" name="address" value="<c:out value="${user.address}"/>"></td>
            </tr>
            <tr>
                <th>Login: </th>
                <td><input type="text" name="login" value="<c:out value="${user.login}"/>"></td>
            </tr>
            <tr>
                <th>New password: </th>
                <td><input type="text" name="password"/></td>
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
                <td><input type="submit" value="save"></td>
            </tr>
        </table>
<%--    </form>--%>
    </sf:form>
</div>
</body>
</html>