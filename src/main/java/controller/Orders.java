package controller;

import model.Order;
import model.User;
import service.OrderDAO;
import service.PostDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "controller.Orders", urlPatterns = "/Orders")
public class Orders extends HttpServlet {



    private static final long serialVersionUID = 1L;
    private PostDAO postDAO;
//    private UserDAO userDAO;
    private OrderDAO orderDAO;
//    private CommentDAO commentDAO;

    public void init() {
        postDAO = new PostDAO();
//        userDAO = new UserDAO();
        orderDAO = new OrderDAO();
//        commentDAO = new CommentDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User username = (User) session.getAttribute("userLogin");
        String user = username.getUsername();
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "thue":
                showFormThue(request, response);
                break;
            case "order":
                try {
                    showFormOrder(request,response,user);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "apply":
                try {
                    applyOrder(request,response);
                    showFormOrder(request,response,user);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;


        }
    }
    void showFormThue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("thue.jsp");
        requestDispatcher.forward(request, response);
    }

    void showFormOrder(HttpServletRequest request, HttpServletResponse response,String user) throws ServletException, IOException, SQLException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("order.jsp");
        List<Order> orders = orderDAO.allOrder(user);
        request.setAttribute("orders", orders);
        requestDispatcher.forward(request, response);
    }

    void applyOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int idPost = Integer.parseInt(request.getParameter("idPost"));

        int id = Integer.parseInt(request.getParameter("id"));
        postDAO.apply(idPost);
        orderDAO.applyOrder(id);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User username = (User) session.getAttribute("userLogin");
        String user = username.getUsername();
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "thue":
                try {
                    thue(request,response,user);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
        }
    }

    void thue(HttpServletRequest request, HttpServletResponse response,String user) throws SQLException, ServletException, IOException {
//        int idOrder = Integer.parseInt(request.getParameter("idOrder"));
        int idPost = Integer.parseInt(request.getParameter("id"));
        int ngaybatdau = Integer.parseInt(request.getParameter("ngaybatdau"));
        int ngayketthuc = Integer.parseInt(request.getParameter("ngayketthuc"));
        String status = request.getParameter("status");
        String username = user;
        Order order = new Order(idPost, ngaybatdau, ngayketthuc, username, status);
        orderDAO.insert(order);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Posts");
        requestDispatcher.forward(request,response);
    }
}
