package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Fuel;
import service.adminService;


@WebServlet("/admin_add_fuel")
public class admin_add_fuel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		String fuel_type = request.getParameter("f_type");
		double f_price = Double.parseDouble(request.getParameter("f_price"));
		
		Fuel fuel = new Fuel(0, fuel_type, f_price);
		
		adminService adms = new adminService();
		isTrue = adms.InsertFuel(fuel);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Fuel Type Added Successfully');"+"window.location.href='admin_get_fuelTypes';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Fuel Type NOT Added...try again!!!');"+"window.location.href='admin_get_fuelTypes';</script>");
		}
		
	}

}
