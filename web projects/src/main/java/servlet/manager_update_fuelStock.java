package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FuelStock;
import service.managerService;


@WebServlet("/manager_update_fuelStock")
public class manager_update_fuelStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int stock_id = Integer.parseInt(request.getParameter("stockid"));
		int fuel_id = Integer.parseInt(request.getParameter("fuel_id"));
		double amount = Double.parseDouble(request.getParameter("amount"));
		
		FuelStock fuel_stock = new FuelStock(stock_id,fuel_id, amount);
		
		managerService ms = new managerService();
		isTrue = ms.updateFuelStock(fuel_stock);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Successfully Updated');"+"window.location.href='manager_get_fuelStock';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Update Failed...try again!!!');"+"window.location.href='manager_get_fuelStock';</script>");
		}
		
	}

}
