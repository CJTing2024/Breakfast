

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class Register
 */
@WebServlet("/doRegister")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		//資料傳入
		String register_Username =request.getParameter("register_Username");
		String register_Email =request.getParameter("register_Email");
		String register_Password =request.getParameter("register_Password");		
		
	    String sql= "INSERT INTO member (member_id, member_name, member_email, member_password) VALUES(?,?,?,?);";	
	    try{ 	    	  
	        Context initContext = new InitialContext();       
	        DataSource ds = (DataSource)initContext.lookup("java:comp/env/jdbc/mariadb");
	        
	        Connection connection = ds.getConnection();
	        PreparedStatement stmt =connection.prepareStatement(sql);
	        //設定參數
	        stmt.setNull(1,Types.BIGINT);
			stmt.setString(2,register_Username);
			stmt.setString(3,register_Email);
			stmt.setString(4,register_Password);
	        
	        stmt.executeQuery();
	        
	        HttpSession session = request.getSession();
	        session.setAttribute("isRegisterSucceed", "true");
	        response.sendRedirect("index.jsp");

        }catch(Exception e) {
        	out.println(e);
        }
	    
	    
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
