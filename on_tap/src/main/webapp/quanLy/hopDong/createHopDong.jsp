<%--
  Created by IntelliJ IDEA.
  User: BOSS
  Date: 2/19/2023
  Time: 4:25 PM
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
                <h2>Add New Hop Dong</h2>
            </caption>
            <tr>
                <th>Id hop dong:</th>
                <td>
                    <input type="text" name="id" id="id" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Ten hop dong:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Ngay lam:</th>
                <td>
                    <input type="date" name="day" id="day" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Ten nhan vien:</th>
                <td><select name="tenNhanvien">
                    <c:forEach var="cls" items="${listNhan_vien}">
                        <option value="${cls.id_nhan_vien}">${cls.ten_nhan_vien}</option>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <th>Ten khach hang:</th>
               <td> <select name="tenKhachHang">
                    <c:forEach var="cls" items="${listKhach_hang}">
                        <option value="${cls.id_khach_hang}">${cls.ten_khach_hang}</option>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <th>Dia chi:</th>
                <td>
                    <input type="text" name="address" id="address" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Loai khach:</th>
                <td>
                    <select name="tenLoaikhach">
                            <option value="${diamond}">diamond</option>
                            <option value="${gold}">gold</option>
                    </select>
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
