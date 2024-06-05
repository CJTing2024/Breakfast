

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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import com.ting.*;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/doChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
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
		String sql;
		//資料傳入
		String new_Password =request.getParameter("new_Password");
		String member_Id =request.getParameter("member_Id");
		
		try{ 	    	  
	        Context initContext = new InitialContext();       
	        DataSource ds = (DataSource)initContext.lookup("java:comp/env/jdbc/mariadb");
	        
	        sql="UPDATE member SET member_password=? WHERE member_id=?;";
	        
	        Connection connection = ds.getConnection();
	        PreparedStatement stmt =connection.prepareStatement(sql);
	        //設定參數
	        stmt.setString(1,new_Password);
	        stmt.setString(2,member_Id);
	        stmt.executeQuery();
	        out.print("UpdateOK");
	        
	        HttpSession session = request.getSession();
	        Member member = (Member) session.getAttribute("member");
	        if(member != null)
	        	session.removeAttribute("member");
	     
        }catch(Exception e) {
        	out.print(e);
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
