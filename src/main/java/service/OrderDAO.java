package service;

import model.Order;
import service.connection.ConnectJDBC;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO implements IOrderDAO{
//    private String jdbcURL = "jdbc:mysql://localhost:3306/case03?useSSL=false";
//    private String jdbcUsername = "root";
//    private String jdbcPassword = "123456";
//
//    protected Connection getConnection() {
//        Connection connection = null;
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (ClassNotFoundException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//        return connection;
//    }
private Connection connection = ConnectJDBC.getConnection();


    public OrderDAO(){};

    public void insert(Order order) throws SQLException {
//        Connection connection =  getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("insert into case03.order values (?,?,?,?,?,?)");
        preparedStatement.setInt(1,order.getId());
        preparedStatement.setInt(2,order.getIdPost());
        preparedStatement.setInt(3,order.getNgaybatdau());
        preparedStatement.setInt(4,order.getNgayketthuc());
        preparedStatement.setString(5,order.getUsername());
        preparedStatement.setString(6, order.getStatus());
        preparedStatement.executeUpdate();
    }

    @Override
    public List<Order> allOrder(String userName) throws SQLException {
        List<Order> orders = new ArrayList<>();
//        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from case03.order join post on case03.order.idpost = post.id where post.userName = ? ");
        preparedStatement.setString(1,userName);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            int id = resultSet.getInt("id");
            int idPost = resultSet.getInt("idpost");
            int ngaybatdau = resultSet.getInt("ngaybatdau");
            int ngayketthuc = resultSet.getInt("ngayketthuc");
            String username = resultSet.getString("username");
            String status = resultSet.getString("status");
            orders.add(new Order(id,idPost,ngaybatdau,ngayketthuc,username,status));
        }
        return orders;
    }

    @Override
    public void applyOrder(int id) throws SQLException {
//        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("update case03.order set case03.order.status = ? where case03.order.id = ?");
        preparedStatement.setString(1,"accepted");
        preparedStatement.setInt(2, id);
        preparedStatement.executeUpdate();
    }
}
