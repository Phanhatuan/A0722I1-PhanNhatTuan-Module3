package com.example.test.controller;

import com.example.test.model.mat_bang;
import com.example.test.service.mat_bangServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

@WebServlet(name = "mat_bangServlet", urlPatterns = "/matBang")
public class mat_bangServlet  extends HttpServlet {
    mat_bangServiceImpl mat_bangServiceImpl = new mat_bangServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case"sort":
                    sortMatBang(request, response);
                    break;
                case "search":
                    searchUser(request, response);
                    break;
                case "delete":
                    deleteMatBang(request, response);
                    break;
                default:
                    listMat_bang(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertMatBang(request, response);
                    break;
                case "search":
                    searchUser(request, response);
                    break;

                case"sort":
                    sortMatBang(request, response);
                    break;
            }
        } catch (SQLException | ParseException ex) {
            throw new ServletException(ex);
        }
    }
    private void searchUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String tang = request.getParameter("tang");
        String tenLoaiVanPhong = request.getParameter("tenLoaiVanPhong");
        int gia = Integer.parseInt(request.getParameter("gia"));
        List<mat_bang> listMat_bang = mat_bangServiceImpl.findUsersByTang(tang,tenLoaiVanPhong,gia);
        request.setAttribute("listMat_bang", listMat_bang);
        RequestDispatcher dispatcher = request.getRequestDispatcher("mat_bang/list.jsp");
        dispatcher.forward(request, response);
    }
    private void sortMatBang(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<mat_bang> listMat_bang = mat_bangServiceImpl.sortMatBang();
        request.setAttribute("listMat_bang", listMat_bang);

        RequestDispatcher dispatcher = request.getRequestDispatcher("mat_bang/list.jsp");
        dispatcher.forward(request, response);
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("mat_bang/create.jsp");
        dispatcher.forward(request, response);
    }
    private void listMat_bang(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<mat_bang> listMat_bang = mat_bangServiceImpl.selectAllMat_bang();
        request.setAttribute("listMat_bang", listMat_bang);
        RequestDispatcher dispatcher = request.getRequestDispatcher("mat_bang/list.jsp");
        dispatcher.forward(request, response);
    }
    private void insertMatBang(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ParseException {
        String id = request.getParameter("id");
        int dien_tich = Integer.parseInt(request.getParameter("dienTich"));
        String trang_thai = request.getParameter("tenTrangThai");
        String tang = request.getParameter("tang");
        String loai_mat_bang = request.getParameter("tenLoaiVanPhong");
        String mo_ta = request.getParameter("moTa");
        int gia = Integer.parseInt(request.getParameter("gia"));
        String sDate = request.getParameter("SDay");
        Date SDay  = Date.valueOf(sDate);
        String fDate = request.getParameter("FDay");
        Date FDay  = Date.valueOf(fDate);

        mat_bang new_mat_bang = new mat_bang(id,trang_thai,dien_tich,tang,loai_mat_bang,mo_ta,gia,SDay,FDay);
        mat_bangServiceImpl.insertMat_bang(new_mat_bang);
        RequestDispatcher dispatcher = request.getRequestDispatcher("mat_bang/create.jsp");
        dispatcher.forward(request, response);
    }
    private void deleteMatBang(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        mat_bangServiceImpl.deleteMat_bang(id);
        List<mat_bang> listMat_bang = mat_bangServiceImpl.selectAllMat_bang();

        request.setAttribute("listMat_bang", listMat_bang);
        RequestDispatcher dispatcher = request.getRequestDispatcher("mat_bang/list.jsp");
        dispatcher.forward(request, response);
    }

}
