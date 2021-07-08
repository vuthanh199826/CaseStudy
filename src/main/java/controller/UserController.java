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
import java.io.IOException;
import java.util.List;

@WebServlet(
        name = "UserController",
        value = "/user"
)
public class UserController extends HttpServlet {
    private static IUserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(req, resp);
                break;
            case "update":
                showFormUpdate(req, resp);
                break;
            case "delete":
                delete(req, resp);
                break;
            default:
                showAll(req, resp);
                break;
        }
    }
    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/fromAdmin/update.jsp");
        String userName = request.getParameter("username");
        User user = userDAO.findByName(userName);
        request.setAttribute("updateUser", user);
        dispatcher.forward(request, response);
    }



    private void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/fromAdmin/signUp.jsp");
        List<User> list = userDAO.findAll();
        req.setAttribute("list", list);
        dispatcher.forward(req, resp);
    }

    private void showAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/fromAdmin/listAdmin.jsp");
        List<User> list = userDAO.findAll();
        req.setAttribute("listUser", list);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(req, resp);
                break;
            case "update":
                update(req, resp);
                break;
            case "delete":
                delete(req, resp);
                break;
            default:
                showAll(req, resp);
                break;
        }
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        int phone = Integer.parseInt(req.getParameter("phone"));
        String role = req.getParameter("role");
        User user = new User();
        user.setUsername(userName);
        user.setPassword(password);
        user.setName(name);
        user.setAddress(address);
        user.setPhone(phone);
        user.setRole(role);
        userDAO.edit(userName,user);
        showAll(req, resp);
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        user.setUsername(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));
        user.setName(req.getParameter("name"));
        user.setAddress(req.getParameter("address"));
        user.setPhone(Integer.parseInt(req.getParameter("phone")));
        user.setRole(req.getParameter("role"));
//        User user = new User(userName,password,name,address,phone,role);
        userDAO.save(user);
        showAll(req, resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        userDAO.delete(userName);
        req.setAttribute("message", "Xóa Thành Công");
        showAll(req, resp);
    }
}
