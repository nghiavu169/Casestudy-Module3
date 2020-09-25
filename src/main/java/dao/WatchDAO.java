package dao;

import entities.Admin;
import entities.Watch;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WatchDAO implements Serializable {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/product?useSSL=false";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "123456";

    public WatchDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Watch> selectAll() {
        List<Watch> list = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement cs = connection.prepareStatement("select * from watch ")) {
            System.out.println(cs);
            ResultSet resultSet = cs.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int brand_id = resultSet.getInt("brand_id");
                String name = resultSet.getString("name");
                String price = resultSet.getString("price");
                String img = resultSet.getString("image");
                String description = resultSet.getString("description");
                list.add(new Watch(id, brand_id, name, price, img, description));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Admin selectAdmin(){
        Admin admin = null;
        try (Connection connection = getConnection();
             PreparedStatement cs = connection.prepareStatement("select * from admin ")) {
            System.out.println(cs);
            ResultSet resultSet = cs.executeQuery();

            while (resultSet.next()){
                String username = resultSet.getString("admin_name");
                String password = resultSet.getString("admin_password");
                admin = new Admin(username,password);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return admin;
    }

    public Boolean insertWatch(Watch watch) {
        boolean isInsert = false;
        try (Connection connection = getConnection();
             CallableStatement cs = connection.prepareCall("{call insertWatch(?,?,?,?,?);}")) {
            cs.setString(1, watch.getName());
            cs.setInt(2, watch.getBrand_id());
            cs.setString(3, watch.getPrice());
            cs.setString(4, watch.getImg());
            cs.setString(5, watch.getDescription());
            isInsert = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isInsert;
    }

    public boolean deleteWatch(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             CallableStatement cs = connection.prepareCall("{call delete_watch(?)}")) {
            cs.setInt(1, id);
            rowDeleted = cs.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public Watch findWatchByID(int id){
        Watch watch = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from watch where id = ?")){
            System.out.println(preparedStatement);
            preparedStatement.setInt(1,id);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                int idNew = rs.getInt("id");
                int brand_id = rs.getInt("brand_id");
                String name = rs.getString("name");
                String price = rs.getString("price");
                String img = rs.getString("image");
                String description = rs.getString("description");
                watch = new Watch(idNew,brand_id,name,price,img,description);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return watch;
    }

}


