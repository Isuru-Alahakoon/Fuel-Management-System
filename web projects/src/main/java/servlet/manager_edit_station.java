package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Station;
import service.managerService;


@WebServlet("/manager_edit_station")
public class manager_edit_station extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isTrue = false;
		
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		String s_name = request.getParameter("s_name");
		String s_email = request.getParameter("s_email");
		long s_moile = Long.parseLong(request.getParameter("s_mobile"));
		String s_address = request.getParameter("s_address");
		
		Station station = new Station(s_id, s_name, s_email, s_moile, s_address);
		
		managerService ms = new managerService();
		isTrue = ms.managerUpdateStation(station);
		
		if(isTrue == true)
		{
			response.getWriter().println("<script>alert('Station Updated Successfully...');"+"window.location.href='manager_get_station';</script>");
		}
		else
		{
			response.getWriter().println("<script>alert('Station NOT Updated...');"+"window.location.href='manager_get_station';</script>");
		}
	}

}
