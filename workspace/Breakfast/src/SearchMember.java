

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;

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
 * Servlet implementation class SearchMember
 */
@WebServlet("/callMember")
public class SearchMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMember() {
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
		
	    try{
	    	//資料傳入
	    	HttpSession session = request.getSession();
	    	Member member =(Member) session.getAttribute("member");
	    	//Member member = new Member();
	    	//member.setMemberId(1L);
	    	//建立儲存物件
	    	MemberPassword memberPassword = new MemberPassword(member);
	    	
	    	//連結資料庫
	        Context initContext = new InitialContext();       
	        DataSource ds = (DataSource)initContext.lookup("java:comp/env/jdbc/mariadb");
	        
	        sql = "SELECT * FROM member AS m "+
	        		 "INNER JOIN city AS c ON m.city_id=c.city_id "+
	        		 "INNER JOIN district AS d ON m.city_id=d.city_id AND m.district_sn=d.district_sn "+
	        		 "where member_id = ?;";
	        
	        Connection connection = ds.getConnection();
	        PreparedStatement stmt =connection.prepareStatement(sql);
	        //設定參數
			stmt.setLong(1,member.getMemberId());	        
	        ResultSet rs = stmt.executeQuery();
	        rs.next();
	        
	        memberPassword.setMemberName(rs.getString("member_name"));
	        memberPassword.setMemberPassword(rs.getString("member_password"));
	        memberPassword.setMemberGender(rs.getString("member_gender"));
	        memberPassword.setMemberBirthday(rs.getString("member_birthday"));
	        memberPassword.setMemberTel(rs.getString("member_tel"));
	        memberPassword.setMemberPhone(rs.getString("member_phone"));
	        memberPassword.setCity(rs.getString("city_name"));
	        memberPassword.setDistrict(rs.getString("district_name"));
	        memberPassword.setAddress(rs.getString("address"));
	        
	        
//	        out.print("<p>"+ memberPassword.getMemberPassword() +"</p>");
//	        out.print("<p>"+ memberPassword.getMemberGender() +"</p>");
//	        out.print("<p>"+ memberPassword.getMemberBirthday() +"</p>");
//	        out.print("<p>"+ memberPassword.getMemberTel() +"</p>");
//	        out.print("<p>"+ memberPassword.getMemberPhone() +"</p>");
//	        out.print("<p>"+ memberPassword.getCity() +"</p>");
//	        out.print("<p>"+ memberPassword.getDistrict() +"</p>");
//	        out.print("<p>"+ memberPassword.getAddress() +"</p>");
	        
	        request.setAttribute("memberPassword", memberPassword);
	        request.getRequestDispatcher("member.jsp").forward(request, response);
	        
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
