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
    private WatchDAO watchDAO = new WatchDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }switch (action){
            case "create":
                createWatch(request,response);
                break;
            case "search":
                searchWatch(request,response);
            case "login":
                loginForm(request,response);
                break;
            case "edit":
                updateWatch(request,response);
                break;
<<<<<<< HEAD
            default:
=======
            case "search":
                searchWatch(request, response);
>>>>>>> 7fe7afa29e00a20b7eecd7ee4d9b186a4112d1cb
                break;
        }
    }

<<<<<<< HEAD
    private void updateWatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int brandID = Integer.parseInt(request.getParameter("brandID"));
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        this.watchDAO.updateWatchStore(id,name,brandID,price,image,description);

        Watch watch = this.watchDAO.findWatchByID(id);
        request.setAttribute("watch",watch);
=======
    private void updateWatch(HttpServletRequest request, HttpServletResponse response) {
>>>>>>> 7fe7afa29e00a20b7eecd7ee4d9b186a4112d1cb

        RequestDispatcher res = request.getRequestDispatcher("admin.jsp");
        res.forward(request, response);
    }

    private void createWatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int brandID = Integer.parseInt(request.getParameter("brandID"));
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        Watch watch = new Watch(name,brandID,price,image,description);
        this.watchDAO.insertWatch(watch);

        List<Watch> list = this.watchDAO.selectAll();
        request.setAttribute("watchList",list);

        RequestDispatcher res = request.getRequestDispatcher("admin.jsp");
        res.forward(request, response);
    }


    private void loginForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username);
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
//            case "edit":
//                updateWatchFrom(request,response);
//                break;
            default:
                showListProductIndex(request,response);
        }
    }

<<<<<<< HEAD
//    private void updateWatchFrom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//
//        res.forward(request, response);
//    }

=======
>>>>>>> 7fe7afa29e00a20b7eecd7ee4d9b186a4112d1cb
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