package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Service_purchase;
import service.customerService;


@WebServlet("/cus_add_servicePurchase")
public class cus_add_servicePurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int st_id = Integer.parseInt(request.getParameter("station"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		int v_make = Integer.parseInt(request.getParameter("v_make"));
		String description = request.getParameter("description");
		String pay_method = request.getParameter("pay_method");
		
		Service_purchase service = new Service_purchase(st_id, userid, v_make, description, pay_method);
		
		customerService cs = new customerService();
		isTrue = cs.BookService(service);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Booking Successfull');"+"window.location.href='customer_get_vehicle';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Booking Unsuccessfull!!!');"+"window.location.href='customer_get_vehicle';</script>");
		}
		
	}

}
