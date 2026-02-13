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
import service.managerService;


@WebServlet("/manager_get_station")
public class manager_get_station extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		List<Station> stations = new ArrayList<>();
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		int manager_id = user.getUser_id();
		
		managerService ms = new managerService();
		stations = ms.getStations(manager_id);
		
		request.setAttribute("stations", stations);
		RequestDispatcher dis = request.getRequestDispatcher("myStations.jsp");
		dis.forward(request, response);
	}

}
