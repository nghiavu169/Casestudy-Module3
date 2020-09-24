package dao;

import entities.Watch;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WatchDAO implements Serializable {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/product?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

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
             CallableStatement cs = connection.prepareCall("{call get_all_watch()}")) {
            System.out.println(cs);
            ResultSet resultSet = cs.executeQuery();

            while (resultSet.next()) {
                int id, brand_id;
                String name, price, img, description;

                id = resultSet.getInt("id");
                brand_id = resultSet.getInt("brand_id");
                name = resultSet.getString("name");
                price = resultSet.getString("price");
                img = resultSet.getString("img");
                description = resultSet.getString("description");
                list.add(new Watch(id, brand_id, name, price, img, description));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
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
}


