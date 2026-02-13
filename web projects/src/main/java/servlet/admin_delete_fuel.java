package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.adminService;


@WebServlet("/admin_delete_fuel")
public class admin_delete_fuel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		
		adminService adms = new adminService();
		adms.DeleteFuelType(f_id);
		
		RequestDispatcher dis = request.getRequestDispatcher("admin_get_fuelTypes");
		dis.forward(request, response);
		
	}

}
