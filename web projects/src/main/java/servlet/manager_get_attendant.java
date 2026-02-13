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

import model.Attendant;
import model.Station;
import model.User;
import service.managerService;


@WebServlet("/manager_get_attendant")
public class manager_get_attendant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Attendant> attendant = new ArrayList<>();
		List<Station> station = new ArrayList<>();
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
		int st_id = Integer.parseInt(request.getParameter("st_id"));
		
		managerService ms = new managerService();
		station = ms.getStations(user.getUser_id());
		attendant = ms.GetAttendants(st_id);
		
		if(attendant.isEmpty() || attendant == null)
		{
			System.out.println(st_id);
			System.out.println("attendant List is NULL");
		}
		
		request.setAttribute("station", station);
		request.setAttribute("attendant", attendant);
		
		RequestDispatcher dis = request.getRequestDispatcher("manager_attendant_management.jsp");
		dis.forward(request, response);
	}

}
