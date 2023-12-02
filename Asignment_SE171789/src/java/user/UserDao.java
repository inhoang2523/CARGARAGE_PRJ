/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author user
 */
public class UserDao {


    private static final String LOGIN = "SELECT fullName, roleID, userID, password FROM tblUsers WHERE userID=? AND password=?";

    public User checkLogin(String userID, String password) throws SQLException {
        User user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new User(userID, fullName, roleID, "");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                rs.close();
            }
            if (conn != null) {
                rs.close();
            }
        }
        return user;
    }



    public boolean insertUser(String id, String name, String role, String password) throws Exception, SQLException {
        boolean kq = false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String s = "insert into [dbo].[tblUsers]([userID],[fullName],[roleID],[password])\n"
                    + "values(?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(s);

            pst.setString(1, id);
            pst.setString(2, name);
            pst.setString(3, role);
            pst.setString(4, password);

            kq = pst.executeUpdate() >0 ? true : false;
            cn.close();

        }
        return kq;
    }

    public static ArrayList<User> getUsers(String name) throws Exception {
        ArrayList<User> kq = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String s = "select [userID],[fullName],[roleID],[password]\n"
                    + "from [dbo].[tblUsers]\n"
                    + "where [fullname] like ?";

            //CO DUNG DAU ? NE DUNG PREPARE
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, "%" + name + "%");
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String id = table.getString("userID");
                    String fullname = table.getString("fullName");
                    String role = table.getString("roleID");
                    String password = "****";
                    User us = new User(id, fullname, role, password);
                    kq.add(us);
                }
            }
            cn.close();
        }
        return kq;
    }

    public boolean update(User updateUser) throws Exception {
        boolean checkUpdate = false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String ss = "UPDATE tblUsers SET fullName=?, roleID=? WHERE userID=?";
            PreparedStatement ptm = cn.prepareStatement(ss);
            ptm.setString(1, updateUser.getName());
            ptm.setString(2, updateUser.getRole());
            ptm.setString(3, updateUser.getId());
            checkUpdate = ptm.executeUpdate() > 0 ? true : false;
        }
        cn.close();
        return checkUpdate;
    }

    public boolean deleteUser(String id) throws Exception {
        boolean checkDelete = false;
        Connection cn = null;
        PreparedStatement ptm = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String d = "DELETE FROM tblUsers WHERE userID=?";
                ptm = cn.prepareStatement(d);
                ptm.setString(1, id);
                checkDelete = ptm.executeUpdate() > 0;
            }
        } finally {
            // Close the PreparedStatement and Connection
            if (ptm != null) {
                ptm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return checkDelete;
    }

    public boolean checkExisted(String userID) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String query = "SELECT userID FROM tblUsers WHERE userID=?";
                ptm = cn.prepareStatement(query);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }

        return check;
    }
}
