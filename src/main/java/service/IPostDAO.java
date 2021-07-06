package service;

import model.Post;

import java.sql.SQLException;
import java.util.List;

public interface IPostDAO {
    List<Post> getAllPost() throws SQLException;
    void insert(Post post) throws SQLException;
    List<Post> getMyPost(String username) throws SQLException;
    Post selectPost(int id) throws SQLException;
}
