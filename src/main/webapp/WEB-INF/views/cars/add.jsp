<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    <%@include file='/WEB-INF/views/css/table_dark.css' %>
</style>
<html>
<head>
    <title>Add car</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<form method="post" id="car" action="${pageContext.request.contextPath}/cars/add"></form>
<h1 class="table_dark">Add car:</h1>
<table class="table_dark">
    <tr>
        <th>Model</th>
        <th>Manufacturer</th>
        <th>Add</th>
    </tr>
    <tr>
        <td>
            <input type="text" name="model" form="car" required
                   value='<%= ( request.getParameter("model") != null
                         ? request.getParameter("model")
                         : "" )%>'>
        </td>
        <td>
            <select name="manufacturer" form="car" required>
                <option value="" selected disabled hidden>-- Please choose --</option>
                <c:forEach var="manufacturer" items="${manufacturers}">
                    <option value="${manufacturer.id}">
                        id=${manufacturer.id}: ${manufacturer.name} (${manufacturer.country})
                    </option>
                </c:forEach>
            </select>
        </td>
        <td>
            <input type="submit" name="add" form="car">
        </td>
    </tr>
</table>
</body>
</html>
