package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FuelStock;
import service.attendantService;


@WebServlet("/attendant_update_fuelStock")
public class attendant_update_fuelStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int stockid = Integer.parseInt(request.getParameter("stockid"));
		int fuelid = Integer.parseInt(request.getParameter("fuelid"));
		double amount = Double.parseDouble(request.getParameter("amount"));
		
		FuelStock fs = new FuelStock(stockid,fuelid ,amount);
		
		attendantService as = new attendantService();
		isTrue = as.updateFuelStock(fs);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Update Successfull');"+"window.location.href='attendant_get_fuelStock';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Update Failed!!!');"+"window.location.href='attendant_get_fuelStock';</script>");
		}
		
	}

}
