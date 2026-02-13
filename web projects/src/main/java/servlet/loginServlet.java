package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import service.publicServices;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = publicServices.login(email, password);
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		;
		
		if(user != null)
		{
			
			
			String user_type = user.getUser_type();
			RequestDispatcher dis = null;
			
			if(user_type.equals("admin"))
			{
				dis = request.getRequestDispatcher("adminDashboard.jsp");
				
			}
			
			else if(user_type.equals("customer"))
			{
				dis = request.getRequestDispatcher("index.jsp");
				
			}
			
			else if(user_type.equals("manager"))
			{
				dis = request.getRequestDispatcher("managerDashboard.jsp");
				
			}
			
			else if(user_type.equals("attendant"))
			{
				dis = request.getRequestDispatcher("attendant_dashboard.jsp");
				
			}
			
			dis.forward(request, response);
		}
		else
		{
			response.getWriter().println("<script>alert('Invalid email or password!!!'); "+" window.location.href='login.jsp';</script>");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	
	
}
