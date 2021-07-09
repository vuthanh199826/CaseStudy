package service;

import model.User;
import service.connection.ConnectionJDBC;

import java.sql.*;

public class UserDAO implements IUserDAO{
    private Connection connection = ConnectionJDBC.getConnection();

    public UserDAO(){};

    @Override
    public boolean login(String username, String password) throws SQLException {
        User user = null;
//        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("Select * from user where username = ? and password = ?");
        preparedStatement.setString(1, username);
        preparedStatement.setString(2,password);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            String name = resultSet.getString("name");
            String address = resultSet.getString("address");
            int phone = resultSet.getInt("phone");
            user = new User(username,password,name,address,phone);
        }
        if(user==null){
            return false;
        }else {
            return true;
        }
    }
}
