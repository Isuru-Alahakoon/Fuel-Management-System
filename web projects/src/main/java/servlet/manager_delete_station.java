package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.managerService;


@WebServlet("/manager_delete_station")
public class manager_delete_station extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int s_id = Integer.parseInt(request.getParameter("station_id"));
		
		managerService ms = new managerService();
		int nullId = ms.deleteStation(s_id);
		
		HttpSession nullIdSession = request.getSession();
		nullIdSession.setAttribute("nullId",nullId );
		
		response.getWriter().println("<script>window.location.href='manager_get_station';</script>");
		
	}

}
