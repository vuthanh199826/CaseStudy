package service;

import model.Order;

import java.sql.SQLException;
import java.util.List;

public interface IOrderDAO {
    void insert(int id,int idPost,int ngaybatdau, int ngayketthuc, String username,String status) throws SQLException;
    List<Order> allOrder(String userName) throws SQLException;
    void applyOrder(int id) throws SQLException;
}
