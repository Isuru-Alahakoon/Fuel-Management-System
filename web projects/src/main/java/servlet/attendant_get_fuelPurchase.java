package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Fuel_purchase;
import model.User;
import service.attendantService;


@WebServlet("/attendant_get_fuelPurchase")
public class attendant_get_fuelPurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Fuel_purchase> fp = new ArrayList<>();
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		attendantService as = new attendantService();
		fp = as.getFuelPurchase(user.getUser_id());
		
		request.setAttribute("fp", fp);
		RequestDispatcher dis = request.getRequestDispatcher("attendant_fuelPurchase.jsp");
		dis.forward(request, response);
		
	}

}
