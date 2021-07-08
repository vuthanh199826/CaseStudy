package controller;

import model.Comment;
import model.Post;
import service.CommentDAO;
import service.OrderDAO;
import service.PostDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "controller.Comments", urlPatterns = "/Comments")
public class Comments extends HttpServlet {


    private String user = "thanh";

    private static final long serialVersionUID = 1L;
    private PostDAO postDAO;
    //    private UserDAO userDAO;
//    private OrderDAO orderDAO;
    private CommentDAO commentDAO;

    public void init() {
      postDAO = new PostDAO();
//        userDAO = new UserDAO();
//        orderDAO = new OrderDAO();
        commentDAO = new CommentDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showComment":
                try {
                    showComment(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                try {
                    delete(request,response);
                    showComment(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;

        }
    }

    void showComment(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int idPost = Integer.parseInt(request.getParameter("idPost"));
        List<Comment> comments = commentDAO.commentOfPost(idPost);
        List<Post> posts = postDAO.getAllPost();
        request.setAttribute("comments",comments);
        request.setAttribute("posts", posts);
        request.setAttribute("user",user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
//        listPost(request,response);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createComment":
                try {
                    createComment(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
        }
    }


    void createComment(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int idPost = Integer.parseInt(request.getParameter("idPost"));
        String username = user;
        String detail = request.getParameter("detail");
        Comment comment = new Comment(idPost,username,detail);
        if (detail.equals("")){
        }else {
            commentDAO.insert(comment);
        }
        showComment(request,response);
    }

    void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt( request.getParameter("id"));
        commentDAO.delete(id);
    }
}
