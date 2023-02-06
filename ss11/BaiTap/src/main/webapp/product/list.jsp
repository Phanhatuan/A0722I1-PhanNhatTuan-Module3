<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/Product?action=create">Create new Product</a>
    <button>ddd</button>
    <button onclick="">them moi</button>
</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Cost</td>
        <td>Description</td>
        <td>Producer</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="products">
        <tr>
            <td><a href="/Product?action=view&id=${products.getId()}">${products.getName()}</a></td>
            <td>${products.getCost()}</td>
            <td>${products.getDescription()}</td>
            <td>${products.getProducer()}</td>
            <td><a href="/Product?action=edit&id=${products.getId()}">edit</a></td>
            <td><a href="/Product?action=delete&id=${products.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
