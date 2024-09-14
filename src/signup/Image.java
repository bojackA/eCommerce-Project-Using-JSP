package signup;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Img")
public class Image extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		byte[] img = null;
		ServletOutputStream sos = null;
		String SqlQuery = "select img from services";
		try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab ", "root", "cmpunk2000");
		PreparedStatement ps = con.prepareStatement(SqlQuery);
		ResultSet r = ps.executeQuery();
		if(r.next()){
			img = r.getBytes(1);
			
		}
		sos = response.getOutputStream();
		sos.write(img);
		
		}catch(Exception e){
			e.printStackTrace();
		}

	}
}
	

