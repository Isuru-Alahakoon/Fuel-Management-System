package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Station;
import service.managerService;


@WebServlet("/manager_add_station")
public class manager_add_station extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		boolean isTrue = false;
		
		int manager_id = Integer.parseInt(request.getParameter("manager_id"));
		String s_name = request.getParameter("s_name");
		String s_email = request.getParameter("s_email");
		long s_mobile = Long.parseLong(request.getParameter("s_mobile"));
		String s_address = request.getParameter("s_address");
		
		Station station = new Station(0, manager_id, s_name, s_email, s_mobile, s_address);
		
		HttpSession nullIdSession = request.getSession(false);
		Integer nullId = (Integer) nullIdSession.getAttribute("nullId");
		
		managerService ms = new managerService();
		isTrue = ms.manager_add_station(station,nullId);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Station added Successfully...');"+"window.location.href='manager_get_station';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Station NOT added !!!');"+"window.location.href='manager_get_station';</script>");
		}
	}

}
