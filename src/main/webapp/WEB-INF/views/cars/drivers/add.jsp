<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    <%@include file='/WEB-INF/views/css/table_dark.css' %>
</style>
<html>
<head>
    <title>Add driver to car</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<form method="post" id="car" action="${pageContext.request.contextPath}/cars/drivers/add"></form>
<h1 class="table_dark">Add driver to car:</h1>
<table class="table_dark">
    <tr>
        <th>Car</th>
        <th>Driver</th>
        <th>Add</th>
    </tr>
    <tr>
        <td>
            <select name="car" form="car" required>
                <option value="" selected disabled hidden>-- Please choose --</option>
                <c:forEach var="car" items="${cars}">
                    <option value="${car.id}">
                        id=${car.id}: ${car.manufacturer.name} ${car.model}
                    </option>
                </c:forEach>
            </select>
        </td>
        <td>
            <select name="driver" form="car" required>
                <option value="" selected disabled hidden>-- Please choose --</option>
                <c:forEach var="driver" items="${drivers}">
                    <option value="${driver.id}">
                        id=${driver.id}: ${driver.name} (${driver.licenseNumber})
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
