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


@WebServlet("/managerGetStationToAddAttendants")
public class managerGetStationToAddAttendants extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Station> station = new ArrayList<>();
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		managerService ms = new managerService();
		station = ms.getStations(user.getUser_id());
		
		request.setAttribute("station", station);
		RequestDispatcher dis = request.getRequestDispatcher("manager_add_attendant.jsp");
		dis.forward(request, response);
		
	}

}
