<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    <%@include file='/WEB-INF/views/css/info_text.css' %>
    <%@include file='/WEB-INF/views/css/table_dark.css' %>
</style>
<html>
<head>
    <title>Register page</title>
</head>
<body>
<form method="post" id="register" action="${pageContext.request.contextPath}/register"></form>
<h1 class="table_dark">Please register:</h1>
<table class="table_dark">
    <tr>
        <th>Login</th>
        <th>Password</th>
        <th>Name</th>
        <th>License number</th>
    </tr>
    <tr>
        <td>
            <input type="text" name="login" form="register" required>
        </td>
        <td>
            <input type="password" name="password" form="register" required
                   value='<%= ( request.getParameter("password") != null
                         ? request.getParameter("password")
                         : "" )%>'>
        </td>
        <td>
            <input type="text" name="name" form="register" required
                   value='<%= ( request.getParameter("name") != null
                         ? request.getParameter("name")
                         : "" )%>'>
        </td>
        <td>
            <input type="text" name="license_number" form="register" required
                   value='<%= ( request.getParameter("license_number") != null
                         ? request.getParameter("license_number")
                         : "" )%>'>
        </td>
    </tr>
</table>
<p><button type="submit" form="register">Register</button></p>
<p class="error_message">${errorMsg}</p>
</body>
</html>
