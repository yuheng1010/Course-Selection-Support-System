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
 * Servlet implementation class SimServlet
 */
@WebServlet("/Sim")
public class SimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SimServlet() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		User u=new User();
		u=(User) session.getAttribute("user");
		String user=Integer.toString(u.getID());
		String cid = request.getParameter("simcid");
		SimSchDAO ss=new SimSchDAO();
		try {
			ss.addSim(user, cid);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<String>ps=new ArrayList<String>();
		try {
			ps=ss.printSim(Integer.toString(u.getID()));
//			session.setAttribute("psim", ps);
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		doGet(request, response);
	}
	
}
