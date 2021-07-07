package controller;

import model.Order;
import model.Post;
import service.OrderDAO;
import service.PostDAO;
import service.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "controller.Servlet", value = "/Servlet")
public class Servlet extends HttpServlet {
    private String user = null;

    private static final long serialVersionUID = 1L;
    private PostDAO postDAO;
    private UserDAO userDAO;
    private OrderDAO orderDAO;

    public void init() {
        postDAO = new PostDAO();
        userDAO = new UserDAO();
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "login":
                try {
                    login(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "logout":
                showFormLogin(request, response);
                break;
            case "thue":
                showFormThue(request, response);
                break;
            case "order":
                try {
                    showFormOrder(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "mypost":
                try {
                    showFormMyPost(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "update":
                try {
                    showFormEdit(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                try {
                    deletePost(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "apply":
                try {
                    applyOrder(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            default:
                try {
                    listPost(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    addNewPost(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "thue":
                try {
                    thue(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "update":
                try {
                    update(request , response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;


        }
    }

    void listPost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Post> posts = postDAO.getAllPost();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        request.setAttribute("posts", posts);
        requestDispatcher.forward(request, response);
    }

    void login(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean status = userDAO.login(username, password);
        System.out.println(user);
        if (status) {
            user = request.getParameter("username");
            System.out.println(user);
            listPost(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(request, response);
    }

    void showFormMyPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Post> posts = postDAO.getMyPost(user);
        System.out.println(user);
        System.out.println(posts);
        System.out.println(user);
        System.out.println(posts.size());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("mypost.jsp");
        request.setAttribute("mypost", posts);
        requestDispatcher.forward(request, response);
    }

    void showFormOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("order.jsp");
        List<Order> orders = orderDAO.allOrder(user);
        request.setAttribute("orders" ,orders);
        requestDispatcher.forward(request, response);
    }


    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Post post = postDAO.selectPost(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        request.setAttribute("post", post);
        requestDispatcher.forward(request, response);
    }

    void showFormLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request, response);
    }

    void showFormThue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("thue.jsp");
        requestDispatcher.forward(request, response);
    }

    void addNewPost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int price = Integer.parseInt(request.getParameter("price"));
        String address = request.getParameter("address");
        String img = request.getParameter("img");
        String describe = request.getParameter("describe");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        Post post = new Post(id, user, title, price, address, img, describe, status);
        postDAO.insert(post);
        listPost(request, response);
    }

    void thue(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int idOrder = Integer.parseInt(request.getParameter("idOrder"));
        int idPost = Integer.parseInt(request.getParameter("id"));
        int ngaybatdau = Integer.parseInt(request.getParameter("ngaybatdau"));
        int ngayketthuc = Integer.parseInt(request.getParameter("ngayketthuc"));
        String status = request.getParameter("status");
        String username = user;
        orderDAO.insert(idOrder,idPost,ngaybatdau,ngayketthuc,username,status);
        listPost(request,response);
    }
    void update(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int price = Integer.parseInt(request.getParameter("price"));
        String address = request.getParameter("address");
        String img = request.getParameter("img");
        String describe = request.getParameter("describe");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        Post post = new Post(id, user, title,price,address,img,describe,status);
        System.out.println(post);
        postDAO.update(post);
    }

    void deletePost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        postDAO.delete(id);
        showFormMyPost(request,response);
    }

    void applyOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int idPost = Integer.parseInt( request.getParameter("idPost"));

        int id = Integer.parseInt(request.getParameter("id"));

        postDAO.apply(idPost);
        orderDAO.applyOrder(id);
        showFormOrder(request,response);
    }



}
