package util;
import java.sql.*;

public class JdbcUtil {
    static{
        try {
            Class.forName("com.mysql.jbdc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost/addr", "root", "0523");
    }
}
