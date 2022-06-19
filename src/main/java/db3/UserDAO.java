package db3;

import java.sql.*;

public class UserDAO {
 
    public User checkLogin(int ID, String password) throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://127.0.0.1/crud?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
        String dbUser = "root";
        String dbPassword = "giby2022";
        Connection connection = null;
        try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	        connection.createStatement();

        }catch(SQLException ex) {
        	ex.printStackTrace();
        }
        String sql = "SELECT * FROM user WHERE UserID = ? and Password = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, ID);
        statement.setString(2, password);
 
        ResultSet result = statement.executeQuery();
        
        User user = null;
 
        if (result.next()) {
            user = new User();
            user.setName(result.getString("Name"));
            user.setPsw(password);
            user.setID(ID);
            user.setDep(result.getString("Dept"));
        }
 
        connection.close();
 
        return user;
    }
}
