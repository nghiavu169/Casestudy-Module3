package controller;

import dao.WatchDAO;
import entities.Brand;
import entities.Watch;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "WatchServlet",urlPatterns = "/category")
public class CategoryServlet extends HttpServlet {
    private WatchDAO watchDAO = new WatchDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<Brand> brandList = this.watchDAO.selectAllBrand();
            List<Watch> watchList = this.watchDAO.selectAll();
            request.setAttribute("brandList",brandList);
            System.out.println(brandList);
            request.setAttribute("watchList",watchList);

            RequestDispatcher res = request.getRequestDispatcher("watchCategory.jsp");
            res.forward(request, response);
        }
    }
