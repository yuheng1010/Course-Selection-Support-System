package db3;
import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import db3.User;
import db3.UserDAO;
 
@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public UserLoginServlet() {
      super();
    }
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int ID = Integer.parseInt(request.getParameter("ID"));
        String password = request.getParameter("password");
         
        UserDAO userDao = new UserDAO();
         
        try {
	            User user = userDao.checkLogin(ID, password);
	            String destPage = "login.jsp";
	            
	            
	            if (user != null) {
//	            	System.out.println("plz conn");
	                HttpSession session = request.getSession();
	                session.setAttribute("user", user);
//	                System.out.println(user.getPassword());   
	                destPage = "home.jsp";
	            } else {
	                String message = "Invalid email/password";
	                request.setAttribute("message", message);
	            }
	             
	            
	            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
	            //System.out.println(dispatcher);
	            dispatcher.forward(request, response);
	             
	        } catch (SQLException | ClassNotFoundException ex) {
	            throw new ServletException(ex);
        }
    }
}