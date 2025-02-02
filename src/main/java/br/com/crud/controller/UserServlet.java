package br.com.crud.controller;

import br.com.crud.dao.UserDAO;
import br.com.crud.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    try {
                        User user = userDAO.getUserByEmail(request.getParameter("email_input"));
                        if (user != null) {
                            request.setAttribute("error", "Usuário já cadastrado com este e-mail!");
                            RequestDispatcher dispatcher = request.getRequestDispatcher("userForm.jsp");
                            dispatcher.forward(request, response);
                            break;
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    insertUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<User> listUser = userDAO.listAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listUsers.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("userForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.getUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("userForm.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String name = request.getParameter("name_input");
        String email = request.getParameter("email_input");
        String phone = request.getParameter("phone_input");
        String birthDateStr = request.getParameter("birthdate_input");
        String address = request.getParameter("address_input");

        Date birthDate = parseDate(birthDateStr);

        User newUser = new User();
        newUser.setName(name);
        newUser.setEmail(email);
        newUser.setPhone(phone);
        newUser.setBirthDate(birthDate);
        newUser.setAddress(address);

        userDAO.insertUser(newUser);
        response.sendRedirect("user?action=list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name_input");
        String email = request.getParameter("email_input");
        String phone = request.getParameter("phone_input");
        String birthDateStr = request.getParameter("birthdate_input");
        String address = request.getParameter("address_input");

        Date birthDate = parseDate(birthDateStr);

        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setBirthDate(birthDate);
        user.setAddress(address);

        userDAO.updateUser(user);
        response.sendRedirect("user?action=list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        User user = new User();
        user.setId(id);
        userDAO.deleteUser(user);
        response.sendRedirect("user?action=list");
    }

    private Date parseDate(String dateStr) {
        if (dateStr == null) {
            return null;
        }
        try {
            return new Date(new SimpleDateFormat("yyyy-MM-dd").parse(dateStr).getTime());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
