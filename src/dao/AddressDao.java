package dao;

import entity.Address;
import util.JdbcUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddressDao {
    public void add(Address address){
        try {
            Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("insert into address (name,zip) values(?,?);");
            pstmt.setString(1,address.getName());
            pstmt.setString(2,address.getZip());
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public void delete(int id){
        try {
            Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("delete from address where id=?;");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Address address){
        try {
            Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("UPDATE address set name=?,zip=? where id=?;");
            pstmt.setString(1,address.getName());
            pstmt.setString(2,address.getZip());
            pstmt.setInt(3,address.getId());
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Address> findAll(){
        List<Address> list = new ArrayList<Address>();
        try {
            Connection conn = JdbcUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("select * from address ;");
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                Address address = new Address();
                address.setId(rs.getInt(1));
                address.setName(rs.getString(2));
                address.setZip(rs.getString(3));
                list.add(address);
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return list;
    }
}
