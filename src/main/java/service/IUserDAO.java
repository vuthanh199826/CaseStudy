package service;

import java.sql.SQLException;

public interface IUserDAO {
    boolean login(String username, String password) throws SQLException;
}
