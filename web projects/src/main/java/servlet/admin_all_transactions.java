package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Fuel_purchase;
import model.Service_purchase;
import service.adminService;


@WebServlet("/admin_all_transactions")
public class admin_all_transactions extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		adminService adms = new adminService();
		
		int st_id = Integer.parseInt(request.getParameter("station_id"));
		String purchase = request.getParameter("purchase");
		
		
		if(purchase.equals("service"))
		{
			
			List<Service_purchase> services = adms.getService(st_id);
			request.setAttribute("services", services);
			request.setAttribute("purchase", purchase);
			RequestDispatcher dis = request.getRequestDispatcher("admin_all_transactions.jsp");
			dis.forward(request, response);
		}
		else if(purchase.equals("fuel"))
		{
			List<Fuel_purchase> fuels = adms.getFuelPurchase(st_id);
			request.setAttribute("fuels", fuels);
			request.setAttribute("purchase", purchase);
			RequestDispatcher dis = request.getRequestDispatcher("admin_all_transactions.jsp");
			dis.forward(request, response);
		}
		
	}

}
