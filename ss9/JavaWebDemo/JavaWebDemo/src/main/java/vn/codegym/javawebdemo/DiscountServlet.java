package vn.codegym.javawebdemo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("myLogin.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDes = request.getParameter("productDescription");
        Double priceList = Double.parseDouble(request.getParameter("listPrice"));
        Double dis = Double.parseDouble(request.getParameter("discountPercent"));
        Double discountAmount = priceList * dis * 0.01;
        Double discountPrice = priceList - discountAmount;
        request.setAttribute("productDes", productDes);
        request.setAttribute("priceList", priceList);
        request.setAttribute("dis", dis);
        request.setAttribute("discountPrice", discountPrice);

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
