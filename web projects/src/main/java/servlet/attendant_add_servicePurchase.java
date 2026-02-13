package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Service_purchase;
import service.attendantService;


@WebServlet("/attendant_add_servicePurchase")
public class attendant_add_servicePurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int st_id = Integer.parseInt(request.getParameter("st_id"));
		String cus_name = request.getParameter("cus_name");
		String cus_mobile = request.getParameter("cus_mobile");
		String description = request.getParameter("description");
		double price = Double.parseDouble(request.getParameter("price"));
		String pay_method = request.getParameter("pay_method");
		String status = request.getParameter("status");
		String date_time = request.getParameter("date_time");
		
		
		if(cus_mobile.charAt(0) != '0')
		{
			response.getWriter().println("<script>alert('Mobile number must starts with Zero');"+"window.location.href='attendant_get_servicePurchase';</script>");
			return;
		}
		
		long mobile = Long.parseLong(request.getParameter("cus_mobile"));
		
		Service_purchase service = new Service_purchase(0, st_id, cus_name, mobile, description, price, pay_method, status, date_time);
		
		attendantService as = new attendantService();
		isTrue = as.addServicePurchase(service);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Customer details Added successfully...');"+"window.location.href='attendant_get_servicePurchase';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Customer details NOT Added...');"+"window.location.href='attendant_get_servicePurchase';</script>");
		}
	}

}
