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

import model.Fuel;
import service.adminService;


@WebServlet("/admin_get_fuelTypes")
public class admin_get_fuelTypes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger logger = Logger.getLogger(admin_get_fuelTypes.class.getName());
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger.info("getting all fuel types (admin).");
		
		List<Fuel> fuels = new ArrayList<>();
		
		adminService adms = new adminService();
		fuels = adms.getFuels();
		
		if (fuels == null || fuels.isEmpty()) {
			logger.warning("No fuel types found");
		} else {
			logger.info("found " + fuels.size() + " fuel types from database");
		}
		
		request.setAttribute("fuels", fuels);
		RequestDispatcher dis = request.getRequestDispatcher("admin_all_fuels.jsp");
		dis.forward(request, response);
	}

}
