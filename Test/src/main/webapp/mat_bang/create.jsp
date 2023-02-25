
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a class="btn btn-outline-primary" href="matBang">List mat bang</a>

<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Mat Bang</h2>
            </caption>
            <tr>
                <th>Ma mat bang:</th>
                <td>
                    <input type="text" name="id" id="id" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Dien tich:</th>
                <td>
                    <input type="text" name="dienTich" id="dienTich" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Trang thai:</th>
                <td>
                    <select name="tenTrangThai">
                        <option value="Trong">Trong</option>
                        <option value="Ha Tang">Ha Tang</option>
                        <option value="Day Du">Day Du</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Tang:</th>
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
                <th>Mo ta chi tiet:</th>
                <td>
                    <input type="text" name="moTa" id="moTa" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Gia cho thue:</th>
                <td>
                    <input type="text" name="gia" id="gia" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Ngay bat dau:</th>
                <td>
                    <input type="date" name="SDay" id="SDay" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Ngay ket thuc:</th>
                <td>
                    <input type="date" name="FDay" id="FDay" size="15"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save" onclick="return validate()"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
