/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author user
 */
public class CarDao {

    public static ArrayList<Car> getCars(String name) throws Exception {
        ArrayList<Car> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select id,name,description,price,speed,status,image,origin,fuel\n"
                    + "from dbo.tblCars\n"
                    + "where status=1 and name like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + name + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    String nameCar = rs.getString("name");
                    String des = rs.getString("description");
                    float price = rs.getFloat("price");
                    int speed = rs.getInt("speed");
                    boolean status = rs.getBoolean("status");
                    String image = rs.getString("image");
                    String origin = rs.getString("origin");
                    String fuel = rs.getString("fuel");
                    Car c = new Car(id, nameCar, des, price, speed, status, image, origin, fuel);
                    list.add(c);
                }
            }
            cn.close();
        }
        return list;
    }

    public static Car getCar(String id) throws Exception {
        Car c = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select id,name,description,price,speed,status,image,origin,fuel\n"
                    + "from dbo.tblCars\n"
                    + "where status=1 and id = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
//                     String id=rs.getString("id");
                    String nameCar = rs.getString("name");
                    String des = rs.getString("description");
                    float price = rs.getFloat("price");
                    int speed = rs.getInt("speed");
                    boolean status = rs.getBoolean("status");
                    String image = rs.getString("image");
                    String origin = rs.getString("origin");
                    String fuel = rs.getString("fuel");
                    c = new Car(id, nameCar, des, price, speed, status, image, origin, fuel);

                }
            }
            cn.close();
        }
        return c;
    }

    public static ArrayList<Car> listCars(String name) throws Exception {
        ArrayList<Car> list = new ArrayList<>();// chua dap an
        Connection cn = DBUtils.makeConnection();
        int size = 0;
        if (cn != null) {
            String sql = "select top 4 id,name,description,price,speed,status,image,origin,fuel\n"
                    + "from dbo.tblCars\n"
                    + "where status=1 and name like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + name + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    String nameCar = rs.getString("name");
                    String des = rs.getString("description");
                    float price = rs.getFloat("price");
                    int speed = rs.getInt("speed");
                    boolean status = rs.getBoolean("status");
                    String image = rs.getString("image");
                    String origin = rs.getString("origin");
                    String fuel = rs.getString("fuel");
                    Car c = new Car(id, nameCar, des, price, speed, status, image, origin, fuel);
                    list.add(c);
                    size++;
                    if (size > 10) {
                        break;
                    }
                }
            }
            cn.close();
        }
        return list;
    }
    
}
