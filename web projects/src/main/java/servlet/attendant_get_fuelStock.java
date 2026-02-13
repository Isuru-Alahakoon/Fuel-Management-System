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

import model.FuelStock;
import model.User;
import service.attendantService;


@WebServlet("/attendant_get_fuelStock")
public class attendant_get_fuelStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		attendantService as = new attendantService();
		int st_id = as.getAttendantStationId(user.getUser_id());
		List<FuelStock> fs = as.getFuelStock(st_id);
		
		request.setAttribute("fs", fs);
		RequestDispatcher dis = request.getRequestDispatcher("attendant_allFuelStock.jsp");
		dis.forward(request, response);
		
	}

}
