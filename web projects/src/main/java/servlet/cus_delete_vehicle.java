package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.customerService;


@WebServlet("/cus_delete_vehicle")
public class cus_delete_vehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		boolean isTrue = false;
		
		int vehicleID = Integer.parseInt(request.getParameter("vehicle_id"));
		
		customerService cs = new customerService();
		isTrue = cs.deleteVehicle(vehicleID);
		
//		RequestDispatcher dis = request.getRequestDispatcher("customer_get_vehicle");
//		dis.forward(request, response);
		
		response.getWriter().println("<script>window.location.href='customer_get_vehicle';</script>");
		
	}

}
