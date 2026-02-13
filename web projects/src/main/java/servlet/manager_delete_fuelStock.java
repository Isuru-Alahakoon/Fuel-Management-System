package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.managerService;


@WebServlet("/manager_delete_fuelStock")
public class manager_delete_fuelStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int stock_id = Integer.parseInt(request.getParameter("fs_id"));
		
		managerService ms = new managerService();
		ms.deleteFuelStock(stock_id);
		
		RequestDispatcher dis = request.getRequestDispatcher("manager_get_fuelStock");
		dis.forward(request, response);
		
	}

}
