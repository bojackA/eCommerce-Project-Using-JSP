package signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Contacts")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String fname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone = request.getParameter("pnum");
		String message = request.getParameter("msg");
		
		RequestDispatcher dispatcher = null;
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab","root","cmpunk2000");
			PreparedStatement pst = con.prepareStatement("insert into contact(name,email,pnumber,message) values(?,?,?,?)");
			pst.setString(1,fname);
			pst.setString(2,email);
			pst.setString(3,phone);
			pst.setString(4,message);
			
			int rowcount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("index.jsp");
			if(rowcount > 0) {
				
				response.sendRedirect("index.jsp");
			
				
				
			}else {
				response.sendRedirect("index.jsp");
			}
			dispatcher.forward(request, response);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
