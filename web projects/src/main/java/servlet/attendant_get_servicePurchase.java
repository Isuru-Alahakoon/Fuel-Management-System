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

import model.Service_purchase;
import model.User;
import service.attendantService;


@WebServlet("/attendant_get_servicePurchase")
public class attendant_get_servicePurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger logger = Logger.getLogger(attendant_get_servicePurchase.class.getName());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Service_purchase> service = new ArrayList<>();
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		if (session == null || session.getAttribute("user") == null) {
            logger.warning("User session not found. Redirecting to login.");
            response.sendRedirect("login.jsp");
            return;
        }
		
		attendantService as = new attendantService();
		service = as.getServicePurchase(user.getUser_id());
		
		if (service.isEmpty() || service == null) {
	        
			int stationId = as.getAttendantStationId(user.getUser_id());
	        session.setAttribute("station_id", stationId);
	        logger.warning("No service purchases found. Attempting to fetch station ID separately.");
	    }
		else
		{
			logger.info("found " + service.size() + " service purchase(s).");
			int stationId = service.get(0).getStation_id();
	        session.setAttribute("station_id", stationId);
	        logger.info("Station ID set in session: " + stationId);
		}
		
//		System.out.println("user id : " + user.getUser_id());
		
		request.setAttribute("service", service);
		RequestDispatcher dis = request.getRequestDispatcher("attendant_servicePurchases.jsp");
		dis.forward(request, response);
	}
}
