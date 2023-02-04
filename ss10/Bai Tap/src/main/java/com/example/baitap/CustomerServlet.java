package com.example.baitap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", value = "/customer")

public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList;
    static{
        customerList = new ArrayList<>();
        customerList.add(new Customer("Nguyen Van A", "1/1/2002" , "DN", "pic1.jpg"));
        customerList.add(new Customer("Nguyen Van B", "2/1/2002" , "SG", "pic1.jpg"));
        customerList.add(new Customer("Nguyen Van C", "3/1/2002" , "HN", "pic1.jpg"));
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("/customer/index.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}
