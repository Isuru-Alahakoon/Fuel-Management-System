package servlet;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FuelStock;
import model.Station;
import model.User;
import service.managerService;


@WebServlet("/manager_get_fuelStock")
public class manager_get_fuelStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger(manager_get_fuelStock.class.getName());

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int stationID = 0;
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		if (user == null) {
            logger.warning("No user found in session. Redirecting to login.");
            response.sendRedirect("login.jsp");
            return;
        }
		
		managerService ms = new managerService();
		List<Station> stations = ms.getStations(user.getUser_id());
		
		if(stations.isEmpty() || stations == null)
		{
			logger.warning("No stations found for manager with ID: " + user.getUser_id());
			response.getWriter().println("<script>alert('Please add your station...');"+"window.location.href='manager_get_station';</script>");
//			System.out.println("Manager station list is NULL");
		}
		else
		{
			stationID = stations.get(0).getStation_id();
			session.setAttribute("stationID", stationID);
			List<FuelStock> fs = ms.getFuelStock(stationID);
			
			if(fs.isEmpty() || fs == null)
			{
				logger.warning("No fuel stock records found for station ID: " + stationID);
			}
			else
			{
				logger.info("Fuel stock list retrieved successfully for station ID: " + stationID + " - Size: " + fs.size());
			}
			
			request.setAttribute("fs", fs);
			RequestDispatcher dis = request.getRequestDispatcher("manager_fuelStock_management.jsp");
			dis.forward(request, response);
		}
	}
}
