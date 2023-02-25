<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/datatables/css/dataTables.bootstrap4.css">
</head>
<body>
<form method="post" action="/matBang">
    <input type="hidden" name="action" value="search">
    <fieldset>
        <legend>Search mat bang theo tang:</legend>
        <table>
            <tr>
                <td>Tang: </td>
                <td>
                    <select name="tang">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Loai van phong:</th>
                <td>
                    <select name="tenLoaiVanPhong">
                        <option value="Van Phong chia se">Van Phong chia se</option>
                        <option value="Van Phong tron goi">Van Phong tron goi</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Gia cho thue:</th>
                <td>
                    <input type="text" name="gia" id="gia" size="45"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Search"></td>
            </tr>
        </table>
    </fieldset>
</form>
<table class="table pt-5" id="tableStudent">
    <caption><h2>List mặt bằng</h2></caption>
    <a class="btn btn-outline-primary" href="matBang?action=create">Create mat bang</a>
    <h2><a class="btn btn-outline-primary" href="matBang?action=sort">Sort theo dien tich</a></h2>
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
<!-- Modal -->
<div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal Confirm Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/matBang">
                <div class="modal-body">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="" id="idDelete">
                    <span>Ban co muon xoa </span> <span name="classID" id="classID"></span><span> khong?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
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
        document.getElementById("idDelete").value = id;
        document.getElementById("classID").innerText = id;
    }
</script>
</body>
</html>
