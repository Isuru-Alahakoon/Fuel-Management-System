package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FuelStock;
import service.managerService;


@WebServlet("/manager_add_fuelStock")
public class manager_add_fuelStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		HttpSession session = request.getSession(false);
		int st_id = (int)session.getAttribute("stationID");
		
		int fuel_id = Integer.parseInt(request.getParameter("fuel_type"));
		String amount = request.getParameter("amount");
		
		
        if (amount == null || amount.isEmpty()) {
        	response.getWriter().println("<script>alert('Fuel amount cannot be Empty');"+"window.location.href='manager_get_fuelStock';</script>");
        	return;
        }
        
        double fuelAmount = Double.parseDouble(request.getParameter("amount"));
        
        if (fuelAmount <= 0) {
        	response.getWriter().println("<script>alert('Fuel amount cannot be zero or less than zero');"+"window.location.href='manager_get_fuelStock';</script>");
        	return;
        }
		
		FuelStock fs = new FuelStock(0, st_id, fuel_id, fuelAmount);
		
		managerService ms = new managerService();
		isTrue = ms.addFuelStock(fs);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Fuel Stock record successfully Added');"+"window.location.href='manager_get_fuelStock';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('record NOT added...try again!!!');"+"window.location.href='manager_get_fuelStock';</script>");
		}
		
	}

}
