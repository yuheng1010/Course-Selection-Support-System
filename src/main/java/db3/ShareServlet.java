package db3;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ShareServlet
 */
@WebServlet("/share")
public class ShareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShareServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if (session != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("share.jsp");
			dispatcher.forward(request, response);
		}
		if (request.getParameter("CourseID") != null) {
			String cID = request.getParameter("CourseID");
			String freeD = request.getParameter("free_d");
			String gradeD = request.getParameter("grade_d");
			String feedb = request.getParameter("Feedback");
			User user = (User) session.getAttribute("user");
			String userID = Integer.toString(user.getID());
			CourseDAO cDAO = new CourseDAO();
			try {
				cDAO.addShareRecord(cID, freeD, gradeD, userID, feedb);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
