package db3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SimSchDAO {
	private String url = "jdbc:mysql://127.0.0.1/crud?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	private String acc = "root";
	private String psw = "giby2022";
	private String name;
	private String session;
/*	public SimSchDAO(String name,String session) {
		this.name=name;
		this.session=session;
	}*/
	public void addSim(String userID,String cid) throws ClassNotFoundException, SQLException {
		Connection connection = null;
		String sql="INSERT INTO simulateschedule VALUES("+userID+","+cid+",1111);";
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(url, acc, psw);
		connection.createStatement();
		PreparedStatement stat2= connection.prepareStatement(sql);
		stat2.execute();
		connection.close();
		System.out.println("sim sucess!!!!!!!!!!");

	}
	public void delSim(String userID,String cid) throws SQLException, ClassNotFoundException {
		Connection connection = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(url, acc, psw);
		
		String sql="SET SQL_SAFE_UPDATES=0;";
		PreparedStatement stat2= connection.prepareStatement(sql);
		stat2.execute();
		sql="DELETE FROM simulateschedule WHERE UserID="+userID+" AND CourseID="+cid+" AND Semester=1111";
	
		connection.createStatement();
		stat2= connection.prepareStatement(sql);
		stat2.execute();
		connection.close();
		System.out.println("Del sim sucess!!!!!!!!!!");
	}
	public ArrayList<String> printSim(String userID) throws SQLException, ClassNotFoundException {
		Connection connection = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(url, acc, psw);
		connection.createStatement();
		ArrayList<String>sim=new ArrayList<String>();
		String sql="SELECT course.Name, simulateschedule.CourseID,course.Session FROM simulateschedule LEFT JOIN course ON simulateschedule.CourseID=course.CourseID WHERE simulateschedule.UserID="+userID+" GROUP BY CourseID;";
		PreparedStatement stat= connection.prepareStatement(sql);
		ResultSet result=stat.executeQuery();
		while(result.next()) {
			sim.add(result.getString("Name"));
			sim.add(result.getString("Session"));
		}
		System.out.println(sim);
		return sim;
	}
	
}
