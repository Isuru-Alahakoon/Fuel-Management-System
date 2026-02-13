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

import model.Station;
import service.adminService;


@WebServlet("/admin_get_stations")
public class admin_get_stations extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Station> stations = new ArrayList<>();
		
		adminService adms = new adminService();
		stations = adms.getStations();
		
		request.setAttribute("stations", stations);
		RequestDispatcher dis = request.getRequestDispatcher("admin_select_transactions.jsp");
		dis.forward(request, response);
		
	}

}
