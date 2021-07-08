package controller;

import model.Post;
import service.CommentDAO;
import service.OrderDAO;
import service.PostDAO;
import service.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controller.Posts", urlPatterns = "/Posts")
public class Posts extends HttpServlet {

    private String user = "thanh";

    private static final long serialVersionUID = 1L;
    private PostDAO postDAO;
//    private UserDAO userDAO;
//    private OrderDAO orderDAO;
//    private CommentDAO commentDAO;

    public void init() {
        postDAO = new PostDAO();
//        userDAO = new UserDAO();
//        orderDAO = new OrderDAO();
//        commentDAO = new CommentDAO();
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
            case "mypost":
                try {
                    showFormMyPost(request,response);
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
            case "edit":
                try {
                    showFormEdit(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "search":
                try {
                    search(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            default:
                try {
                    listPost(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
        }
    }

    void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(request, response);
    }

    void listPost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Post> posts = postDAO.getAllPost();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        request.setAttribute("posts", posts);
        requestDispatcher.forward(request, response);
    }
    void deletePost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        postDAO.delete(id);
        showFormMyPost(request, response);
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

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Post post = postDAO.selectPost(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        request.setAttribute("post", post);
        requestDispatcher.forward(request, response);
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
                    addNewPost(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                try {
                    update(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "search":

                break;
            default:
                try {
                    listPost(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

        }
    }

    void addNewPost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int price = Integer.parseInt(request.getParameter("price"));
        String address = request.getParameter("address");
        String img = request.getParameter("img");
        String describe = request.getParameter("describe");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        Post post = new Post( user, title, price, address, img, describe, status);
        System.out.println(post);
        postDAO.insert(post);
        listPost(request, response);
    }

    void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int price = Integer.parseInt(request.getParameter("price"));
        String address = request.getParameter("address");
        String img = request.getParameter("img");
        String describe = request.getParameter("describe");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        Post post = new Post(id, user, title, price, address, img, describe, status);
        postDAO.update(post);
        showFormMyPost(request,response);
    }
    void search (HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String type = request.getParameter("type");
        List<Post> posts = new ArrayList<>();
        if(type.equals("price")){
            int first = Integer.parseInt( request.getParameter("first"));
            int second = Integer.parseInt( request.getParameter("second"));
            posts = postDAO.searchMyPostByPrice(first,second);
        }else if(type.equals("address")){
            String address = request.getParameter("address");
            posts = postDAO.searchMyPostByAddress(address,user);
        }
        System.out.println(posts.size());
        request.setAttribute("mypost",posts);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("mypost.jsp");
        requestDispatcher.forward(request,response);
    }
}
