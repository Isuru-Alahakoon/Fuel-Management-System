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

import model.Fuel;
import service.adminService;


@WebServlet("/manager_get_fuelTypes")
public class manager_get_fuelTypes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Fuel> fuels = new ArrayList<>();
		
		adminService adms = new adminService();
		fuels = adms.getFuels();
		
		request.setAttribute("fuels", fuels);
		RequestDispatcher dis = request.getRequestDispatcher("manager_add_fuelStock.jsp");
		dis.forward(request, response);
	}

}
