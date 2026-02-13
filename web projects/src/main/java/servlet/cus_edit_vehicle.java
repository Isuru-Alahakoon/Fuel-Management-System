package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Vehicle;
import service.customerService;


@WebServlet("/cus_edit_vehicle")
public class cus_edit_vehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int vehicleID = Integer.parseInt(request.getParameter("vehicleID"));
		String brand = request.getParameter("brand");
		String make = request.getParameter("make");
		String chasis_no = request.getParameter("chasis_no");
		String v_type = request.getParameter("v_type");
		
		Vehicle vehicle = new Vehicle(vehicleID, brand, make, chasis_no, v_type);
		
		customerService cs = new customerService();
		isTrue = cs.cusUpdateVehicle(vehicle);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Vehicle Updated Successfully...');"+"window.location.href='customer_get_vehicle';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Vehicle NOT Updated...');"+"window.location.href='customer_get_vehicle';</script>");
		}
	}

}
