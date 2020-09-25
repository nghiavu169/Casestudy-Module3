package controller;

import dao.FakeData;
import dao.WatchDAO;
import entities.Admin;
import entities.Watch;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
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
            case "login":
                loginForm(request,response);
                break;
        }
    }

    private void loginForm(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Admin admin = this.watchDAO.selectAdmin();
        List<Watch> list = this.watchDAO.selectAll();
        request.setAttribute("watchList",list);
        if (username.equals(admin.getUsername()) && password.equals(admin.getPassword())){
            RequestDispatcher res = request.getRequestDispatcher("admin.jsp");
            try {
                res.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }switch (action){
            case "delete":
                deleteWatch(request,response);
                break;
            default:
                showListProductIndex(request,response);
        }
    }

    private void searchWatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Watch> listWatch = watchDAO.searchBy(request.getParameter("name"));
        request.setAttribute("watchList", listWatch);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
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

    private void deleteWatch(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            watchDAO.deleteWatch(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        List<Watch> watchList = this.watchDAO.selectAll();
        request.setAttribute("watchList",watchList);
        RequestDispatcher res = request.getRequestDispatcher("admin.jsp");
        try {
            res.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}