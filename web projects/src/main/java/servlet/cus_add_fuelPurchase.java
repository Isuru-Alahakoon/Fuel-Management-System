package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Fuel;
import model.FuelStock;
import model.Fuel_purchase;
import service.customerService;


@WebServlet("/cus_add_fuelPurchase")
public class cus_add_fuelPurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int station = Integer.parseInt(request.getParameter("station"));
		int fuelid = Integer.parseInt(request.getParameter("f_type"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		double amount = Double.parseDouble(request.getParameter("amount"));
		String pay_method = request.getParameter("pay_method");
		
		customerService cs = new customerService();
		List<Fuel> fuels = cs.getFuelType(fuelid);
		List<FuelStock> fs = cs.getFuelAmount(fuelid,station);
		
		double price = (fuels.get(0).getFuel_price() * amount) + 40.0;//for store the price automatically
		double final_amount = fs.get(0).getFuel_amount() - amount;//for update fuel stock after purchase
		
		System.out.println(price);
		System.out.println(final_amount);
		System.out.println(fuelid);
		System.out.println(station);
		
		Fuel_purchase fp = new Fuel_purchase(station, fuelid, userid, amount, price, pay_method);
		
		isTrue = cs.addFuelPurchase(fp);
		cs.updateFuelStock(station, final_amount, fuelid);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Order Successfull');"+"window.location.href='customer_get_vehicle';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Order Failed...try again!!!');"+"window.location.href='customer_get_vehicle';</script>");
		}
		
	}

}
