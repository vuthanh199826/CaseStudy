package service;

import model.User;

import service.connection.ConnectionJDBC;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {

    private Connection connection = ConnectionJDBC.getConnection();

    @Override
    public List<User> findAll() {
        List<User> list = new ArrayList<>();
        String sql = "select * from user ";
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setUsername(resultSet.getString("userName"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setAddress(resultSet.getString("address"));
                user.setPhone(resultSet.getInt("phone"));
                user.setRole(resultSet.getString("role"));
                list.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public User findByName(String name) {
        String sql = "select * from user where userName like ?";
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + name + "%");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setUsername(resultSet.getString("userName"));
                user.setPassword(resultSet.getString("address"));
                user.setName(resultSet.getString("name"));
                user.setAddress(resultSet.getString("address"));
                user.setPhone(resultSet.getInt("phone"));
                user.setRole(resultSet.getString("role"));
                return user;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public User findUserByUserName(String name, String password) {
        String sql = "select * from user where userName like ? and password like ?";
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setUsername(resultSet.getString("userName"));
                user.setPassword(resultSet.getString("address"));
                user.setName(resultSet.getString("name"));
                user.setAddress(resultSet.getString("address"));
                user.setPhone(resultSet.getInt("phone"));
                user.setRole(resultSet.getString("role"));
                return user;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> findListByName(String name) {
        List<User> list = new ArrayList<>();
        String sql = "select * from user where userName like ?";
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + name + "%");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setUsername(resultSet.getString("userName"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setAddress(resultSet.getString("address"));
                user.setPhone(resultSet.getInt("phone"));
                user.setRole(resultSet.getString("role"));
                list.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;

    }

    @Override
    public void save(User user) throws SQLException {
        String sql = "insert into user(userName,password,name,address,phone) values (?,?,?,?,?)";
        PreparedStatement preparedStatement = null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setString(4, user.getAddress());
            preparedStatement.setInt(5, user.getPhone());
            preparedStatement.executeUpdate();


    }

    @Override
    public void edit(String name, User user) {
        String sql = "update user set password = ?,name = ?,address = ?,phone = ? where userName like ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getAddress());
            preparedStatement.setInt(4, user.getPhone());
            preparedStatement.setString(5, "%" + name + "%");
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(String name) {
        String sql = "delete from user where userName like ?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + name + "%");
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    //    public class UserDAO implements IUserDAO{
//        private String jdbcURL = "jdbc:mysql://localhost:3306/case03?useSSL=false";
//        private String jdbcUsername = "root";
//        private String jdbcPassword = "123456";
//        protected Connection getConnection() {
//            Connection connection = null;
//            try {
//                Class.forName("com.mysql.jdbc.Driver");
//                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
//            } catch (SQLException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            } catch (ClassNotFoundException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//            return connection;
//        }
//        public UserDAO(){};
    @Override
    public boolean login(String username, String password) throws SQLException {
        User user = null;
        PreparedStatement preparedStatement = connection.prepareStatement("Select * from user where username = ? and password = ?");
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String name = resultSet.getString("name");
            String address = resultSet.getString("address");
            int phone = resultSet.getInt("phone");
            user = new User(username, password, name, address, phone);
        }
        if (user == null) {
            return false;
        } else {
            return true;
        }
    }




}

