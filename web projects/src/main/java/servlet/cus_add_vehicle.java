package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Vehicle;
import service.customerService;


@WebServlet("/cus_add_vehicle")
public class cus_add_vehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int userID = Integer.parseInt(request.getParameter("userID"));
		String brand = request.getParameter("brand");
		String make = request.getParameter("make");
		String chasis_no = request.getParameter("chasis_no");
		String type = request.getParameter("v_type");
		
		Vehicle vehicle = new Vehicle(0, userID, brand, make, chasis_no, type);
		
		customerService cs = new customerService();
		isTrue = cs.addvehicle(vehicle);
		
		if(isTrue = true)
		{
			response.getWriter().println("<script>alert('vehicle added successfully...');"+"window.location.href='customer_get_vehicle';</script>");
		}else
		{
			response.getWriter().println("<script>alert('vehicle NOT added !!!');"+"window.location.href='customer_get_vehicle';</script>");
		}
		
	}

}
