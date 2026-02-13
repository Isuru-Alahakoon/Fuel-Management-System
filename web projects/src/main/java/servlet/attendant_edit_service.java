package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Service_purchase;
import service.attendantService;


@WebServlet("/attendant_edit_service")
public class attendant_edit_service extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int s_purchase_id = Integer.parseInt(request.getParameter("s_purchase_id"));
		String description = request.getParameter("description");
		double price = Double.parseDouble(request.getParameter("price"));
		String payMethod = request.getParameter("payMethod");
		String status = request.getParameter("status");
		String dateTime = request.getParameter("dateTime");
		
		Service_purchase service = new Service_purchase(s_purchase_id, description, price, payMethod, status, dateTime);
		
		attendantService as = new attendantService();
		isTrue = as.updateService(service);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Successfully Updated');"+"window.location.href='attendant_get_servicePurchase';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Update Failed...try again!!!');"+"window.location.href='attendant_get_servicePurchase';</script>");
		}
		
	}

}
