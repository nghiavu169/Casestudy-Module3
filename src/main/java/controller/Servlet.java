package controller;

import dao.WatchDAO;
import entities.Admin;
import entities.ShoppingCart;
import entities.Watch;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@javax.servlet.annotation.WebServlet("/watches")
public class Servlet extends HttpServlet {
    private WatchDAO watchDAO = new WatchDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String quantity = "";
        if (session.getAttribute("cart") != null) {
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            quantity = cart.getNumbersOfItemsInCart() + "";
        }
        request.setAttribute("quantity", quantity);
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createWatch(request, response);
                break;
            case "search":
                searchWatch(request, response);
                break;
            case "login":
                loginForm(request, response);
                break;
            case "edit":
                updateWatch(request, response);
                break;
            default:

        }
    }

    private void updateWatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int brandID = Integer.parseInt(request.getParameter("brandID"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        this.watchDAO.updateWatchStore(id, name, brandID, price, image, description);

        List<Watch> list = this.watchDAO.selectAll();
        request.setAttribute("watchList", list);

        RequestDispatcher res = request.getRequestDispatcher("admin.jsp");
        res.forward(request, response);
    }

    private void createWatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int brandID = Integer.parseInt(request.getParameter("brandID"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        Watch watch = new Watch(name, brandID, price, image, description);
        this.watchDAO.insertWatch(watch);

        List<Watch> list = this.watchDAO.selectAll();
        request.setAttribute("watchList", list);

        RequestDispatcher res = request.getRequestDispatcher("admin.jsp");
        res.forward(request, response);
    }


    private void loginForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username);
        Admin admin = this.watchDAO.selectAdmin();
        List<Watch> list = this.watchDAO.selectAll();
        request.setAttribute("watchList", list);
        if (username.equals(admin.getUsername()) && password.equals(admin.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("name", username);
            response.sendRedirect("/admin");
        } else {
            response.sendRedirect("/watches");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String quantity = "";
        if (session.getAttribute("cart") != null) {
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            quantity = cart.getNumbersOfItemsInCart() + "";
        }
        request.setAttribute("quantity", quantity);
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteWatch(request, response);
                break;
            case "showDetails":
                showWatchDetails(request, response);
                break;
            case "brand":
                brandWatch(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            default:
                showListProductIndex(request, response);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("name");
        response.sendRedirect("/watches");
    }

    private void showWatchDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Watch watch = this.watchDAO.findWatchByID(id);
        request.setAttribute("watch", watch);
        RequestDispatcher res = request.getRequestDispatcher("details.jsp");
        res.forward(request, response);
    }

    private void brandWatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Watch> watchList = watchDAO.getWatchesbyBrand(request.getParameter("type"));
        request.setAttribute("watchList", watchList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }


    private void searchWatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Watch> listWatch = watchDAO.searchBy(request.getParameter("name"));
        request.setAttribute("watchList", listWatch);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void showListProductIndex(HttpServletRequest request, HttpServletResponse response) {

        List<Watch> watchList = watchDAO.selectAll();
        request.setAttribute("watchList", watchList);
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
        request.setAttribute("watchList", watchList);
        RequestDispatcher res = request.getRequestDispatcher("admin.jsp");
        try {
            res.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

}