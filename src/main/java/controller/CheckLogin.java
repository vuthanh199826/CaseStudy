package controller;

import model.User;
import service.IUserDAO;
import service.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(
        name = "CheckUser",value = "/check")
public class CheckLogin extends HttpServlet{
    private static IUserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String admin = "admin";
        User user = userDAO.findUserByUserName(userName, password);
        HttpSession session  = req.getSession();
        session.setAttribute("userLogin",user);
        if (user == null) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
            req.setAttribute("message","Ten Tai Khoan Hoac Mat Khau Khong Đung");
            requestDispatcher.forward(req,resp);
//            resp.sendRedirect("/index.jsp");
        } else if (user.getRole() == null) {
            resp.sendRedirect("");
        } else if (user.getRole().equalsIgnoreCase(admin)) {
            resp.sendRedirect("/user");
        }
    }
}
