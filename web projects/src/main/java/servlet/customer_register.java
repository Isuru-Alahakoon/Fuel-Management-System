package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import service.customerService;


@WebServlet("/customer_register")
public class customer_register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nic = request.getParameter("nic");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		String user_type = request.getParameter("user_type");
		
		User user = new User(0, nic, name, email, password, mobile, user_type);
		
		customerService cs = new customerService();
		String result = cs.Cus_register(user);
		
		if("success".equals(result))
		{
			response.getWriter().println("<script>alert('Successfully Registered');"+"window.location.href='login.jsp';</script>");
		}
		else if("email_exists".equals(result))
		{
			response.getWriter().println("<script>alert('Email already Exists...');"+"window.location.href='register.jsp';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Registration failed...try again!!!');"+"window.location.href='register.jsp';</script>");
		}
		
	}

}
