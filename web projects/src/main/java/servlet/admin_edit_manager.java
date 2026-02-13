package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import service.adminService;


@WebServlet("/admin_edit_manager")
public class admin_edit_manager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int managerID = Integer.parseInt(request.getParameter("managerID"));
		String nic = request.getParameter("nic");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		
		User user = new User(managerID, nic, name, email, pass, mobile);
		
		adminService adms = new adminService();
		isTrue = adms.updateManager(user);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Updated Successfully');"+"window.location.href='admin_get_managers';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Update Failed...try Again');"+"window.location.href='admin_get_managers';</script>");
		}
	}

}
