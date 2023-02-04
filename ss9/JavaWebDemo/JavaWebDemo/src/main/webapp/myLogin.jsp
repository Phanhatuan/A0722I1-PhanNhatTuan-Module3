<%--
  Created by IntelliJ IDEA.
  User: caube
  Date: 1/13/2023
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/discount" method="post">
    <label>Product Description: </label><br/>
    <input type="text" name="productDescription" placeholder="Apple" value=""/><br/>
    <label>List Price: </label><br/>
    <input type="text" name="listPrice" placeholder="0" value=""/><br/>
    <label>Discount Percent: </label><br/>
    <input type="text" name="discountPercent" placeholder="0%" value=""/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
</form>
</body>
</html>
