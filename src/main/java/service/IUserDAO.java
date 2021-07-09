package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    List<User> findAll();
    User findByName(String name);
    User findUserByUserName(String name,String password);
    List<User> findListByName(String name);
    void save(User user) throws SQLException;
    void edit(String name ,User user);
    void delete( String name);;
    boolean login(String username, String password) throws SQLException;

}
