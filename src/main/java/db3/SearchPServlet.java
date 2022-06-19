package db3;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchPServlet
 */
@WebServlet("/searchP")
public class SearchPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private ArrayList<String> keywordlist = new ArrayList<String>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session2 = request.getSession(false);
		if(session2 != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("searchP.jsp");
            dispatcher.forward(request, response);
		}
		 session2.removeAttribute("keyword");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CourseDAO cDAO=new CourseDAO();
		ArrayList<Course>cResult=new ArrayList<>();
		ArrayList<String> keywordlist = new ArrayList<String>();
		String text = request.getParameter("Keyword");
		
//		System.out.println(text);
		if(text!=null) {
			String[] temp=text.split(" ");		
			for(int i=0;i<temp.length;i++) {
				keywordlist.add("'%"+temp[i].trim()+"%'");
			}
			System.out.println(keywordlist);
			for(String j:keywordlist) {
				System.out.println(j);
			}
			try {			
				cResult=cDAO.searchCourse(keywordlist);
			} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
	
			if (cResult != null) {
	            HttpSession session1 = request.getSession(false);
	            session1.setAttribute("cResult", cResult);
	        } else {
	            String message = "Invalid input";
	            request.setAttribute("message", message);
	        }
			doGet(request, response);
		}
		
		
	}
//	public ArrayList<String> getKeywordList(){
//		return keywordlist;
//	}

}
