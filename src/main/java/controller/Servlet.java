package controller;

import dao.FakeData;
import dao.WatchDAO;
import entities.Watch;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@javax.servlet.annotation.WebServlet("/watches")
public class Servlet extends HttpServlet {
    private FakeData fakeData = new FakeData();
    private WatchDAO watchDAO = new WatchDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }switch (action){
            case "search":
                searchWatch(request,response);
                break;
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }switch (action){
            default:
                showListProductIndex(request,response);
        }
    }

    private void searchWatch(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name_product");
        List<Watch> watch = this.fakeData.findByName(name);
        RequestDispatcher res;
        if (watch == null){
            res = request.getRequestDispatcher("error-404.jsp");
        }else {
            request.setAttribute("watchList",watch);
            res = request.getRequestDispatcher("index.jsp");
        }
        try {
            res.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListProductIndex(HttpServletRequest request, HttpServletResponse response) {
        List<Watch> watchList = watchDAO.selectAll();
        request.setAttribute("watchList",watchList);
        RequestDispatcher res = request.getRequestDispatcher("index.jsp");
        try {
            res.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
