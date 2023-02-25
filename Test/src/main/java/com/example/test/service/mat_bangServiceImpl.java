package com.example.test.service;

import com.example.test.model.mat_bang;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class mat_bangServiceImpl implements mat_bangService{
    private static final String INSERT_MAT_BANG_SQL = "INSERT INTO mat_bang" + "  (ma_mat_bang, trang_thai, dien_tich, tang, loai_bang_mat, mo_ta, gia, ngay_bat_dau, ngay_ket_thuc) VALUES " +
            " (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_MAT_BANG = "select * from mat_bang;";
    private static final String DELETE_MAT_BANG_SQL = "delete from mat_bang where ma_mat_bang = ?;";
    private static final String FIND_MAT_BANG_BY_TANG = "select * from mat_bang where tang = ? or loai_bang_mat = ? or gia = ?;";

    @Override
    public void insertMat_bang(mat_bang mat_bang) throws SQLException {
        System.out.println(INSERT_MAT_BANG_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MAT_BANG_SQL)) {
            preparedStatement.setString(1, mat_bang.getMa_mat_bang());
            preparedStatement.setString(2, mat_bang.getTrang_thai());
            preparedStatement.setInt(3, mat_bang.getDien_tich());
            preparedStatement.setString(4, mat_bang.getTang());
            preparedStatement.setString(5, mat_bang.getLoai_bang_mat());
            preparedStatement.setString(6, mat_bang.getMo_ta());
            preparedStatement.setInt(7, mat_bang.getGia());
            preparedStatement.setDate(8, mat_bang.getNgay_bat_dau());
            preparedStatement.setDate(9, mat_bang.getNgay_ket_thuc());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public mat_bang selectMat_bang(int id) {
        return null;
    }
    public List<mat_bang> sortMatBang() {
        List<mat_bang> mat_bang =  selectAllMat_bang();
        Collections.sort(mat_bang);
        return mat_bang;
    }


    @Override
    public List<mat_bang> selectAllMat_bang() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<mat_bang> list_mat_bang = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = DBConnection.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MAT_BANG);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            //int customerId, String name, Date birthDay, boolean gender, String id, String tel, String email, int typeCustomer, String address
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String ma_mat_bang = rs.getString("ma_mat_bang");
                String trang_thai = rs.getString("trang_thai");
                int dien_tich =  rs.getInt("dien_tich");
                String tang = rs.getString("tang");
                String loai_bang_mat = rs.getString("loai_bang_mat");
                String mo_ta = rs.getString("mo_ta");
                int gia =  rs.getInt("gia");
                Date ngay_bat_dau = rs.getDate("ngay_bat_dau");
                Date ngay_ket_thuc = rs.getDate("ngay_ket_thuc");
                list_mat_bang.add(new mat_bang(ma_mat_bang, trang_thai, dien_tich, tang, loai_bang_mat, mo_ta, gia, ngay_bat_dau,ngay_ket_thuc));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return list_mat_bang;
    }

    @Override
    public boolean deleteMat_bang(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_MAT_BANG_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateMat_bang(mat_bang mat_bang) throws SQLException {
        return false;
    }
    public List<mat_bang> findUsersByTang(String tempTang, String tempLoai, int tempGia){
        List<mat_bang> listHopDong = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_MAT_BANG_BY_TANG);) {
            preparedStatement.setString(1, tempTang);
            preparedStatement.setString(2, tempLoai);
            preparedStatement.setInt(3, tempGia);

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String ma_mat_bang = rs.getString("ma_mat_bang");
                String trang_thai = rs.getString("trang_thai");
                int dien_tich =  rs.getInt("dien_tich");
                String tang = rs.getString("tang");
                String loai_bang_mat = rs.getString("loai_bang_mat");
                String mo_ta = rs.getString("mo_ta");
                int gia =  rs.getInt("gia");
                Date ngay_bat_dau = rs.getDate("ngay_bat_dau");
                Date ngay_ket_thuc = rs.getDate("ngay_ket_thuc");
                listHopDong.add(new mat_bang(ma_mat_bang, trang_thai, dien_tich, tang, loai_bang_mat, mo_ta, gia, ngay_bat_dau,ngay_ket_thuc));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listHopDong;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}
