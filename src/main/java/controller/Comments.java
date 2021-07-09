package controller;

import model.Comment;
import model.Post;
import model.User;
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
        HttpSession session = request.getSession();
        User username = (User) session.getAttribute("userLogin");
        String user = username.getUsername();
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showComment":
                try {
                    showComment(request,response,user);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                try {
                    delete(request,response);
                    showComment(request,response,user);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;

        }
    }

    void showComment(HttpServletRequest request, HttpServletResponse response,String user) throws SQLException, ServletException, IOException {
        int idPost = Integer.parseInt(request.getParameter("idPost"));
        List<Comment> comments = commentDAO.commentOfPost(idPost);
        Post post = postDAO.selectPost(idPost);
        request.setAttribute("comments",comments);
        request.setAttribute("post", post);
        request.setAttribute("user",user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cmt.jsp");
//        listPost(request,response);
        requestDispatcher.forward(request,response);
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
            case "createComment":
                try {
                    createComment(request,response,user);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
        }
    }


    void createComment(HttpServletRequest request, HttpServletResponse response,String user) throws SQLException, ServletException, IOException {
        int idPost = Integer.parseInt(request.getParameter("idPost"));
        String username = user;
        String detail = request.getParameter("detail");
        Comment comment = new Comment(idPost,username,detail);
        if (detail.equals("")){
        }else {
            commentDAO.insert(comment);
        }
        showComment(request,response,user);
    }

    void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt( request.getParameter("id"));
        commentDAO.delete(id);
    }
}
