package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import service.customerService;
import service.managerService;


@WebServlet("/manager_register")
public class manager_register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nic = request.getParameter("nic");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		String user_type = request.getParameter("user_type");
		
		User user = new User(0, nic, name, email, password, mobile, user_type);
		
		managerService ms = new managerService();
		String result = ms.register_manager(user);
		
		if("success".equals(result))
		{
			response.getWriter().println("<script>alert('Successfully Registered');"+"window.location.href='login.jsp';</script>");
		}
		else if("email_exists".equals(result))
		{
			response.getWriter().println("<script>alert('Email already Exists!!!');"+"window.location.href='register.jsp';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Registration failed...try again!!!');"+"window.location.href='register.jsp';</script>");
		}
	}

}
