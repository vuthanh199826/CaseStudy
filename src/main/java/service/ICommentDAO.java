package service;

import model.Comment;

import java.sql.SQLException;
import java.util.List;

public interface ICommentDAO {
    void insert(Comment comment) throws SQLException;
    List<Comment> commentOfPost(int idPost) throws SQLException;
    void delete(int id) throws SQLException;
}
