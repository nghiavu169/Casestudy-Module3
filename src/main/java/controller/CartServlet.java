package controller;

import entities.ItemsLine;
import entities.ShoppingCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }switch (action){
            case "buy":
                doGet_Buy(request, response);
                break;
            case "decrease":
                doGet_DecreaseItem(request, response);
                break;
            case "delete":
                doGet_Delete(request,response);
                break;
            default:
                doGet_DisplayCart(request, response);
        }
    }

    private void doGet_Delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        int id = Integer.parseInt(request.getParameter("id"));

        ItemsLine itemsLine = cart.getItemsById(id);
        cart.getList().remove(itemsLine);
        response.sendRedirect("ShoppingCart.jsp");
    }

    protected void doGet_DisplayCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ShoppingCart.jsp");
    }

    protected void doGet_DecreaseItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        int id = Integer.parseInt(request.getParameter("id"));

        ItemsLine itemsLine = cart.getItemsById(id);
        itemsLine.setQuantity(itemsLine.getQuantity() - 1);
        if (itemsLine.getQuantity() == 0){
            cart.getList().remove(itemsLine);
        }
        response.sendRedirect("ShoppingCart.jsp");

    }

    protected void doGet_Buy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("id"));
       ShoppingCart cart;
       HttpSession session = request.getSession();
       if (session.getAttribute("cart") == null){
           cart = new ShoppingCart();
           session.setAttribute("cart",cart);
       }else {
           cart = (ShoppingCart) session.getAttribute("cart");
       }
       ItemsLine itemsLine = cart.getItemsById(id);
       itemsLine.setQuantity(itemsLine.getQuantity() + 1);
       response.sendRedirect("ShoppingCart.jsp");
    }

}
