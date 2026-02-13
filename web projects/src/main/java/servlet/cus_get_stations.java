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

import model.Station;
import model.User;
import model.Vehicle;
import service.customerService;


@WebServlet("/cus_get_stations")
public class cus_get_stations extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Station> stations = new ArrayList<>();
		List<Vehicle> vehicles = new ArrayList<>();
		
		customerService cs = new customerService();
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		if(user == null)
		{
			response.getWriter().println("<script>alert('Please Sign In...');"+"window.location.href='login.jsp';</script>");
		}
		else
		{
			System.out.println(stations);
			
			stations = cs.getStations();
			vehicles = cs.get_vehicle_details(user.getUser_id());
			
			request.setAttribute("stations", stations);
			request.setAttribute("vehicles", vehicles);
			RequestDispatcher dis = request.getRequestDispatcher("cus_add_servicePurchase.jsp");
			dis.forward(request, response);
		}
		
	}

}
