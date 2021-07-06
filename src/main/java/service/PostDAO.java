package service;

import model.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO implements IPostDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/case03?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public PostDAO() {
    }

    ;


    @Override
    public List<Post> getAllPost() throws SQLException {
        List<Post> posts = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from post");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String userName = resultSet.getString("userName");
            String tittle = resultSet.getString("title");
            int price = resultSet.getInt("price");
            String address = resultSet.getString("address");
            String img = resultSet.getString("img");
            String describe = resultSet.getString("describe");
            boolean status = resultSet.getBoolean("status");
            posts.add(new Post(id, userName, tittle, price, address, img, describe, status));
        }
        return posts;
    }

    @Override
    public void insert(Post post) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("insert into post values (?,?,?,?,?,?,?,?)");
        preparedStatement.setInt(1, post.getId());
        preparedStatement.setString(2, post.getUserName());
        preparedStatement.setString(3, post.getTitle());
        preparedStatement.setInt(4, post.getPrice());
        preparedStatement.setString(5, post.getAddress());
        preparedStatement.setString(6, post.getImg());
        preparedStatement.setString(7, post.getDescribe());
        preparedStatement.setBoolean(8, post.isStatus());
        preparedStatement.executeUpdate();

    }

    @Override
    public List<Post> getMyPost(String username) throws SQLException {
        List<Post> posts = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from post where username = ?");
        preparedStatement.setString(1, username);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String title = resultSet.getString("title");
            int price = resultSet.getInt("price");
            String address = resultSet.getString("address");
            String img = resultSet.getString("img");
            String describe = resultSet.getString("describe");
            boolean status = resultSet.getBoolean("status");
            posts.add(new Post(id, username, title, price, address, img, describe, status));
        }
        return posts;
    }

    @Override
    public Post selectPost(int id) throws SQLException {
        Post post = null;
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("select* from post where id = ?");
        preparedStatement.setInt(1,id);
        ResultSet resultSet =  preparedStatement.executeQuery();
        while (resultSet.next()){
            String username = resultSet.getString("username");
            String title = resultSet.getString("title");
            int price = resultSet.getInt("price");
            String address = resultSet.getString("address");
            String img = resultSet.getString("img");
            String describe = resultSet.getString("describe");
            boolean status = resultSet.getBoolean("status");
            post = new Post (id, username, title, price, address, img, describe, status);
        }
        return post;
    }


}
