<%@ page import="java.util.List" %>
<%@ page import="com.example.on_tap.model.nhan_vien" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>List</title>
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/datatables/css/dataTables.bootstrap4.css">
</head>
<body>

<table class="table pt-5" id="tableStudent">
    <caption><h2>List of Contracts</h2></caption>
    <a class="btn btn-outline-primary" href="/quanLy/hopDong/createHopDong.jsp">Create contract</a>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name of contract</th>
        <th>Date of contract</th>
        <th>Employee name</th>
        <th>Customer name</th>
        <th>Customer Category</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="hop_dong" items="${listHop_dong}">
        <tr>
            <td><c:out value="${hop_dong.ma_hop_dong}"/></td>
            <td><c:out value="${hop_dong.ten_hop_dong}"/></td>
            <td><c:out value="${hop_dong.ngay_lam_hop_dong}"/></td>
            <c:forEach var="c" items="${listNhan_vien}">
                <c:if test="${hop_dong.id_nhan_vien == c.id_nhan_vien}">
                    <td>${c.ten_nhan_vien}
                    </td>
                </c:if>
            </c:forEach>
            <c:forEach var="c" items="${listKhach_hang}">
                <c:if test="${hop_dong.id_khach_hang == c.id_khach_hang}">
                    <td>${c.ten_khach_hang}
                    </td>
                </c:if>
            </c:forEach>
            <td><c:out value="${hop_dong.id_loai_khach_hang}"/></td>
            <td>
                <a class="btn btn-outline-primary" href="#">Edit</a>
                <a class="btn btn-danger" href="#">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="/static/js/jquery-3.5.1.min.js"></script>
<script src="/static/js/bootstrap.js"></script>
<script src="/static/datatables/js/jquery.dataTables.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            'searching': false,
            'pageLength' : 5
        })
    })

    function onDelete(id) {
        console.log(id);
        document.getElementById("idDelete").value = id;
    }
</script>
</body>
</html>