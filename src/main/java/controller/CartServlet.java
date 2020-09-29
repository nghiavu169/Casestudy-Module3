package controller;

import dao.WatchDAO;
import entities.ItemsLine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            doGet_DisplayCart(request, response);
        } else {
            if (action.equalsIgnoreCase("buy")) {
                doGet_Buy(request, response);
            } else if (action.equalsIgnoreCase("remove")) {
                doGet_Remove(request, response);
            }
        }
    }

    protected void doGet_DisplayCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    protected void doGet_Remove(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ItemsLine> cart = (List<ItemsLine>) session.getAttribute("cart");
        int index = isExisting(Integer.parseInt(request.getParameter("id")), cart);
        cart.remove(index);
        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
    }

    protected void doGet_Buy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            List<ItemsLine> cart = new ArrayList<>();
            cart.add(new ItemsLine(WatchDAO.findWatchByID(Integer.parseInt(request.getParameter("id"))), "1"));
            session.setAttribute("cart", cart);
        } else {
            List<ItemsLine> cart = (List<ItemsLine>) session.getAttribute("cart");
            int index = isExisting(Integer.parseInt(request.getParameter("id")), cart);
            if (index == -1) {
                cart.add(new ItemsLine(WatchDAO.findWatchByID(Integer.parseInt(request.getParameter("id"))), "1"));
            } else {
                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        response.sendRedirect("cart");
    }

    private int isExisting(int id, List<ItemsLine> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getWatch().getId()==id) {
                return i;
            }
        }
        return -1;
    }
}
