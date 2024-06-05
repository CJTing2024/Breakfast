

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

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
 * Servlet implementation class CheckLogin
 */
@WebServlet("/doCheckLogin")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLogin() {
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
		
		String login_Email ="";
		login_Email =request.getParameter("login_Email");
		
		String login_Password ="";
		login_Password =request.getParameter("login_Password");
		
		
	    String sql= "SELECT * FROM member WHERE member_email = ?";	
	    try{ 	    	  
	        Context initContext = new InitialContext();       
	        DataSource ds = (DataSource)initContext.lookup("java:comp/env/jdbc/mariadb");
	        
	        Connection connection = ds.getConnection();
	        PreparedStatement stmt =connection.prepareStatement(sql);
	        //設定參數
	        stmt.setString(1,login_Email);
	        
	        ResultSet rs =stmt.executeQuery();
	        
	        if(rs.next()) {
	        	
	        	String memberPassword = rs.getString("member_password");
	        	
	        	if(login_Password.equals(memberPassword)) {
	        		
	        		//登入成功,建立Member物件
	        		//在session上傳送Member物件
	        		Member member = new Member();
	        		member.setMemberEmail(login_Email);
	        		member.setMemberId(rs.getLong("member_id"));
	        		member.setMemberName(rs.getString("member_name"));
	        		member.setMemberPoints(rs.getInt("member_points"));

	        		//搜尋餐卷
	        		HashMap<String,Integer> memberVoucher = new HashMap();
	        		
	        		sql= " select count(voucher_id) as voucher_number,voucher_class_name " +
	        				"from `voucher` inner join voucher_class using (voucher_class_id) " +
	        				"where member_id= ? AND CURDATE() <= exp_date AND ORDER_ID IS Null "+
	        				"group by voucher_class_id;";
	        		
	        		rs.close();
	        		stmt.close();
	        		
	        		stmt =connection.prepareStatement(sql);
	        		stmt.setLong(1,member.getMemberId());
	        		rs =stmt.executeQuery();
	        		
	        		while(rs.next()) {
	        			        			
	        			 memberVoucher.put(rs.getString("voucher_class_name"), rs.getInt("voucher_number"));
	        			 	        			
	        		}
	        		member.setVoucher(memberVoucher);
	        		
	        		
	        		//資訊放在session上
	        		HttpSession session = request.getSession();
	        		session.setAttribute("member", member);
	        		out.printf("登入成功");
	        	}else {
	        		out.printf("密碼錯誤");
	        	}
	        }else {
	        	out.printf("帳號錯誤");
	        }
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
