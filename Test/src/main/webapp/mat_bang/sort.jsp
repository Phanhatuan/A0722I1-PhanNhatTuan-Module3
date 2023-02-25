<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="" id="tableStudent" border="1" cellpadding="5">
    <caption><h2>List mặt bằng</h2></caption>

    <thead>
    <tr>
        <th>Mã mặt bằng</th>
        <th>Trạng thái</th>
        <th>Diện tích</th>
        <th>Tầng</th>
        <th>Loại mặt bằng</th>
        <th>Mô tả</th>
        <th>Giá</th>
        <th>Ngày bắt đầu</th>
        <th>Ngày kết thúc</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="mat_bang" items="${listMat_bang}">
        <tr>
            <td><c:out value="${mat_bang.ma_mat_bang}"/></td>
            <td><c:out value="${mat_bang.trang_thai}"/></td>
            <td><c:out value="${mat_bang.dien_tich}"/></td>
            <td><c:out value="${mat_bang.tang}"/></td>
            <td><c:out value="${mat_bang.loai_bang_mat}"/></td>
            <td><c:out value="${mat_bang.mo_ta}"/></td>
            <td><c:out value="${mat_bang.gia}"/></td>
            <td><c:out value="${mat_bang.ngay_bat_dau}"/></td>
            <td><c:out value="${mat_bang.ngay_ket_thuc}"/></td>
            <td>
                <a class="btn btn-danger" href="#" role="button" data-toggle="modal" data-target="#modalDelete" onclick="onDelete(${mat_bang.ma_mat_bang})">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
