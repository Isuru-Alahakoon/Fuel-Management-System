package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.Vehicle;
import service.customerService;


@WebServlet("/customer_get_vehicle")
public class customer_get_vehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger(customer_get_vehicle.class.getName());


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Vehicle> vehicle = new ArrayList<>();
		
		customerService cs = new customerService();
		
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		
		
		if(user == null)
		{
			logger.warning("No user found in session. Redirecting to login.");
			response.getWriter().println("<script>alert('Please Sign In...');"+"window.location.href='login.jsp';</script>");
		}
		else
		{
			int userID = user.getUser_id();
			
			vehicle = cs.get_vehicle_details(userID);
			
			if (vehicle == null || vehicle.isEmpty()) {
				logger.warning("No vehicles found for user ID: " + userID);
			} else {
				logger.info("found " + vehicle.size() + " vehicle(s) for user ID: " + userID);
			}
			
			request.setAttribute("vehicle", vehicle);
			RequestDispatcher dis = request.getRequestDispatcher("cusProfile.jsp");
			dis.forward(request, response);
		}

	}

}
