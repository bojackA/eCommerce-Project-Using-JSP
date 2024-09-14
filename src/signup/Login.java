package signup;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    
		    PrintWriter out = response.getWriter();
		    String uname = request.getParameter("username");
		    String upass = request.getParameter("password");
		    try {
		      Class.forName("com.mysql.jdbc.Driver");
		      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab","root","cmpunk2000");
		      //for user
		      PreparedStatement stmt = 
		    		  con.prepareStatement("select * from users where name='"+uname+"' and password='"+upass+"'");
		      ResultSet rs = stmt.executeQuery();
		      //for admin
		      PreparedStatement stmtadmin = 
		    		  con.prepareStatement("select * from admins where name='"+uname+"' and password='"+upass+"'");
		      ResultSet rsadmin = stmtadmin.executeQuery();
		      
		      
		      
		      if(rs.next()) {
		        response.sendRedirect("Display.jsp");
		        HttpSession session = request.getSession();
		        session.setAttribute("uname", uname);
		        
		        
		      }else if(rsadmin.next()) {
			        response.sendRedirect("admin.jsp");}
			        
		      else {
		        out.println("Wrong id and password");
		      }
		      
		      
		      
		    } catch (ClassNotFoundException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    } catch (SQLException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    }
		    
		    
		    
		  }
		}



