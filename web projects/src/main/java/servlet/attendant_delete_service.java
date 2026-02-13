package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.attendantService;


@WebServlet("/attendant_delete_service")
public class attendant_delete_service extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sp_id = Integer.parseInt(request.getParameter("sp_id"));
		
		attendantService as = new attendantService();
		as.deleteService(sp_id);;
		
		RequestDispatcher dis = request.getRequestDispatcher("attendant_get_servicePurchase");
		dis.forward(request, response);
		
	}

}
