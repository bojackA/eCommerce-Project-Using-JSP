
package signup;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadService")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class Services extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    
   // database connection settings
   private String dbURL = "jdbc:mysql://localhost:3306/lab";
   private String dbUser = "root";
   private String dbPass = "cmpunk2000";
    
   protected void doPost(HttpServletRequest request,
           HttpServletResponse response) throws ServletException, IOException {
       // gets values of text fields
       String firstName = request.getParameter("short");
       String lastName = request.getParameter("longdes");
       String price = request.getParameter("price");
        
       InputStream inputStream = null; // input stream of the upload file
        
    
       Part filePart = request.getPart("image");
       if (filePart != null) {
           // prints out some information for debugging
           System.out.println(filePart.getName());
           System.out.println(filePart.getSize());
           System.out.println(filePart.getContentType());
            
           // obtains input stream of the upload file
           inputStream = filePart.getInputStream();
       }
        
       Connection conn = null; // connection to the database
       String message = null;  // message will be sent back to client
        
       try {
           // connects to the database
           DriverManager.registerDriver(new com.mysql.jdbc.Driver());
           conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

           // constructs SQL statement
           String sql = "INSERT INTO services (short, longdes,price, img) values (?, ?, ?,?)";
           PreparedStatement statement = conn.prepareStatement(sql);
           statement.setString(1, firstName);
           statement.setString(2, lastName);
           statement.setString(3, price);
            
           if (inputStream != null) {
               // fetches input stream of the upload file for the blob column
               statement.setBlob(4, inputStream);
           }

           // sends the statement to the database server
           int row = statement.executeUpdate();
           if (row > 0) {
               message = "File uploaded and saved into database";
           }
       } catch (SQLException ex) {
           message = "ERROR: " + ex.getMessage();
           ex.printStackTrace();
       } finally {
           if (conn != null) {
               // closes the database connection
               try {
                   conn.close();
               } catch (SQLException ex) {
                   ex.printStackTrace();
               }
           }
           // sets the message in request scope
           request.setAttribute("Message", message);
            
           // forwards to the message page
           getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
       }
   }
}