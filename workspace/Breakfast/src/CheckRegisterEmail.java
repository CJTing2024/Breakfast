

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class CheckRegisterEmail
 */
@WebServlet("/doCheckRegister")
public class CheckRegisterEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckRegisterEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		//資料傳入
		//檢查Email是否被使用過
		String register_Email ="";
		register_Email =request.getParameter("register_Email");	
			
	    String sql= "SELECT member_email FROM member WHERE member_email = ?";	
	    try{ 	    	  
	        Context initContext = new InitialContext();       
	        DataSource ds = (DataSource)initContext.lookup("java:comp/env/jdbc/mariadb");
	        
	        Connection connection = ds.getConnection();
	        PreparedStatement stmt =connection.prepareStatement(sql);
	        //設定參數
	        stmt.setString(1,register_Email);
	        
	        ResultSet rs =stmt.executeQuery();
	        
	        if(rs.next()) {
	        	out.print("isUsedEmail");        	
	        }
        }catch(Exception e) {}
        	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
