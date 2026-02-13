package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Fuel;
import service.adminService;


@WebServlet("/admin_update_fuelType")
public class admin_update_fuelType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		String f_type = request.getParameter("f_type");
		double f_price = Double.parseDouble(request.getParameter("f_price"));
		
		Fuel fuel = new Fuel(f_id, f_type, f_price);
		
		adminService adms = new adminService();
		isTrue = adms.updateFuel(fuel);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Data Updated Successfully');"+"window.location.href='admin_get_fuelTypes';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Data NOT Updated...Try Again!!!');"+"window.location.href='admin_get_fuelTypes';</script>");
		}
		
	}

}
