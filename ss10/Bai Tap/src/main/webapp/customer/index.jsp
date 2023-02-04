<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>
<body>
<c:if test="${empty customerList}">
    <h1 style="color: red"> Customer list empty</h1>
</c:if>
<h1>Customer List</h1>
<table class="table">
    <thead>
    <tr>
        <th>Ten</th>
        <th>Ngay sinh</th>
        <th>Dia chi</th>
        <th>Anh</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${customerList}" var="customer">
            <tr>
                <td><c:out value="${customer.name}" /></td>
                <td><c:out value="${customer.birthDay}" /></td>
                <td><c:out value="${customer.address}" /></td>
                <td>
                    <img src="/static/img/${customer.img}" alt="" width="50px">
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>