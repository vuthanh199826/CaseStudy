package service;

import model.Comment;
import service.connection.ConnectJDBC;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO implements ICommentDAO{

    private Connection connection = ConnectJDBC.getConnection();

    public CommentDAO() {
    }

    @Override
    public void insert(Comment comment) throws SQLException {
//        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("insert into comment (idPost, username, detail) values (?,?,?)");
        preparedStatement.setInt(1,comment.getIdPost());
        preparedStatement.setString(2,comment.getUsername());
        preparedStatement.setString(3,comment.getDetail());
        preparedStatement.executeUpdate();
    }

    @Override
    public List<Comment> commentOfPost(int idPost) throws SQLException {
        List<Comment> comments = new ArrayList<>();
//        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("select* from comment where idPost = ?");
        preparedStatement.setInt(1,idPost);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            int id = resultSet.getInt("id");
            String username = resultSet.getString("username");
            String detail = resultSet.getString("detail");
            comments.add(new Comment(id,idPost,username,detail));
        }
        return comments;
    }

    @Override
    public void delete(int id) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("delete from comment where id = ?");
        preparedStatement.setInt(1,id);
        preparedStatement.executeUpdate();
    }
}
