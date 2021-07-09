package controller;

import model.Post;

import model.Validate;
import service.CommentDAO;
import service.PostDAO;


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
    private CommentDAO commentDAO;
    Validate validate = new Validate();

    public void init() {
        postDAO = new PostDAO();
        commentDAO = new CommentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "test":
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("cmt.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "create":
                showFormCreate(request, response);
                break;
            case "mypost":
                try {
                    showFormMyPost(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                try {
                    deletePost(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                try {
                    showFormEdit(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "search":
                try {
                    search(request, response);
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
            case "edit":
                try {
                    update(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "search":
                try {
                    searchPlus(request, response);
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

    void listPost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Post> posts = postDAO.getAllPost();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        request.setAttribute("posts", posts);
        requestDispatcher.forward(request, response);
    }

    void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Post post = postDAO.selectPost(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        request.setAttribute("post", post);
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

    void addNewPost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String title = request.getParameter("title");
        if(!checkNull(title)){
            if (!checkNull(request.getParameter("price")) && validate.validate(request.getParameter("price"),Validate.NUMBER_REGEX)){
                int price = Integer.parseInt(request.getParameter("price"));
                String address = request.getParameter("address");
                if (!checkNull(address)){
                    String img = request.getParameter("img");
                    if(!checkNull(img)){
                        String describe = request.getParameter("describe");
                        if (!checkNull(describe)){
                            boolean status = Boolean.parseBoolean(request.getParameter("status"));
                            Post post = new Post(user, title, price, address, img, describe, status);
                            postDAO.insert(post);
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
                            requestDispatcher.forward(request,response);
                        }else {
//                            describe
                        }
                    }else {
//                        img
                    }
                }else {
//                    address
                }
            }else {
//                price
            }
        }else {
//            title null
        }
    }

    boolean checkNull(String str){
        return str.equals("");
    }

    void deletePost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        commentDAO.deleteCommentOfPost(id);
        postDAO.delete(id);
        showFormMyPost(request, response);
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
        showFormMyPost(request, response);
    }

    void search(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String type = request.getParameter("type");
        List<Post> posts = new ArrayList<>();
        if (type.equals("price")) {
            int first = Integer.parseInt(request.getParameter("first"));
            int second = Integer.parseInt(request.getParameter("second"));
            posts = postDAO.searchMyPostByPrice(first, second);
        } else if (type.equals("address")) {
            String address = request.getParameter("address");
            posts = postDAO.searchMyPostByAddress(address, user);
        }
        System.out.println(posts.size());
        request.setAttribute("mypost", posts);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("mypost.jsp");
        requestDispatcher.forward(request, response);
    }

    void searchPlus(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Post> posts ;
        String address = request.getParameter("address");
        int first;
        int second;
        if (request.getParameter("first").equals("") || request.getParameter("second").equals("")) {
            first = 0;
            second = 0;
        } else {
            first = Integer.parseInt(request.getParameter("first"));
            second = Integer.parseInt(request.getParameter("second"));
        }
        posts = postDAO.searchPlus(address, first, second);
        request.setAttribute("posts", posts);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request, response);
    }
}
