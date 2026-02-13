package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Attendant;
import model.User;
import service.managerService;


@WebServlet("/manager_add_attendant")
public class manager_add_attendant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		String nic = request.getParameter("nic");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String type = request.getParameter("type");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		int st_id = Integer.parseInt(request.getParameter("station"));
		
		User user = new User(0, nic, name, email, password, mobile, type);
		Attendant att = new Attendant(st_id);
		
		managerService ms = new managerService();
		isTrue = ms.addAttendants(att, user);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Successfully Added...');"+"window.location.href='manager_attendant_management';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Failed..try again!!!');"+"window.location.href='manager_attendant_management';</script>");
		}
	}

}
