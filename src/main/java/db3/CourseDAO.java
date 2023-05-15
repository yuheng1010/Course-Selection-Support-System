package db3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CourseDAO {
		//private ArrayList<Course>courses=new ArrayList<Course>();
		//private ArrayList<Course>share=new ArrayList<Course>();
		private String url = "jdbc:mysql://127.0.0.1/crud?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
		private String acc = "";
		private String psw = "";
		private String sql ="";
		private String sql2="";
	public ArrayList<Course> searchCourse(ArrayList<String>keyword) throws SQLException, ClassNotFoundException {
		ArrayList<Course>courses=new ArrayList<Course>();
		
		
		Connection connection = null;
		PreparedStatement stat=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, acc, psw);
			connection.createStatement();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}	
		for(String i:keyword) {
			sql+="INSERT INTO temp(CourseID) SELECT CourseID FROM course ";
			sql+="WHERE CourseID LIKE "+i;
			sql+=" OR Field LIKE "+i;
			sql+=" OR Session LIKE "+i;
			sql+=" OR Name LIKE "+i;
			sql+=" OR Credit LIKE "+i;
			sql+=" OR LimitedPerson LIKE "+i;
			sql+=" OR ProfessorID LIKE "+i;
			System.out.println(sql);
			stat= connection.prepareStatement(sql);
			stat.execute();
			sql="";
		}
		sql="SELECT * FROM course AS A WHERE A.CourseID IN (SELECT B.CourseID FROM temp AS B GROUP BY B.CourseID HAVING COUNT(*) >="+keyword.size()+" ORDER BY COUNT(CourseID))";
		PreparedStatement stat2= connection.prepareStatement(sql);
		ResultSet result = stat2.executeQuery();
		
		System.out.println("======");
		System.out.println(sql);
		while(result.next()) {
			System.out.println(result.getString("Name"));
			Course co=new Course(result.getInt("CourseID"),result.getString("Field"),result.getString("Session"),result.getString("Name"),result.getInt("Credit"),result.getString("LimitedPerson"),result.getInt("ProfessorID"));
			courses.add(co);
		}
		
		sql="TRUNCATE TABLE temp";
		stat= connection.prepareStatement(sql);
		stat.execute();

		connection.close();

		return courses;
	}

	public ArrayList<Course> searchShare(String cid) throws ClassNotFoundException, SQLException {
		ArrayList<Course>share=new ArrayList<Course>();
		Connection connection = null;
		PreparedStatement stat=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, acc, psw);
			connection.createStatement();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}	
		sql2="SELECT InputDate,GradeDegree,FreeDegree,CourseID,Feedback FROM Record WHERE CourseID="+cid;
		stat= connection.prepareStatement(sql2);
		ResultSet result=stat.executeQuery();
		while(result.next()) {
			Course co=new Course(result.getInt("CourseID"),result.getInt("FreeDegree"),result.getInt("GradeDegree"),result.getString("Feedback"),result.getString("InputDate"));
			System.out.println("Share test");
			System.out.println(result.getInt("CourseID"));
			share.add(co);
		}
		connection.close();
		return share;
	}

	public void addShareRecord(String cId,String freeD,String gradeD,String userid,String feedback) throws ClassNotFoundException, SQLException {
		Connection connection = null;
		PreparedStatement stat=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, acc, psw);
			connection.createStatement();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}	
		String sql3="SELECT COUNT(InputDate)+1 AS rowc FROM record";
		stat= connection.prepareStatement(sql3);
		ResultSet result=stat.executeQuery();
		//System.out.print("test2222222222222222");
		int no=0;
		while(result.next()) {
			no=result.getInt("rowc");
		}
		sql3="INSERT INTO record VALUES("+no+",now(),"+freeD+","+gradeD+",\""+feedback+"\","+userid+","+cId+")";
		stat= connection.prepareStatement(sql3);
		stat.execute();
	}
	
}
