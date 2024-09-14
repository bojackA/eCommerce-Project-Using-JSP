package signup;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/sign")

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		RequestDispatcher dispatcher = null;
		
		
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab","root","cmpunk2000");
			PreparedStatement pst = con.prepareStatement("insert into users(name,email,password) values(?,?,?)");
			pst.setString(1,name);
			pst.setString(2,email);
			pst.setString(3,pass);
			
			int rowcount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("registration.jsp");
			if(rowcount > 0) {
				
				request.setAttribute("status", "success");
				 response.sendRedirect("user.jsp");
			
				
				
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}

	}
}
