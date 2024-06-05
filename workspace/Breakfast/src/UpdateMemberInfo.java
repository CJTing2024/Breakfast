

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
import com.ting.Member;

/**
 * Servlet implementation class UpdateMemberInfo
 */
@WebServlet("/doUpdateMemberInfo")
public class UpdateMemberInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberInfo() {
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
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String local_tel = request.getParameter("local_tel");
		String tel = request.getParameter("tel");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String address = request.getParameter("address");
		
		
		
		String sql;
		int genderNo;
		int cityId;
		int districtSN;
		//將性別轉為代表的數字
		if("male".equals(gender))
			 genderNo=1;
		else if("female".equals(gender))
			genderNo=0;
		else {
			out.print("性別錯誤");
			return;
		}
		
		//轉化city_id 和 district_sn
		 try{ 	
			 
			 	//JDNI資料庫
		        Context initContext = new InitialContext();       
		        DataSource ds = (DataSource)initContext.lookup("java:comp/env/jdbc/mariadb");		        
		        Connection connection = ds.getConnection();
		        
		        //找city_id
		        sql ="SELECT city_id FROM city WHERE city_name = ?";
		        PreparedStatement stmt =connection.prepareStatement(sql);
		        //設定參數
		        stmt.setString(1,city);
		         
		        ResultSet rs =stmt.executeQuery();
		        if(rs.next()) {
		        	cityId = rs.getInt("city_id");
		        }else {
		        	throw new Exception("找不到此城市");
		        }
		        
		        //找district_sn
		        sql ="SELECT district_sn FROM district WHERE city_id = ? AND district_name = ?";
		        stmt =connection.prepareStatement(sql);
		        //設定參數
		        stmt.setInt(1,cityId);
		        stmt.setString(2,district);
		        
		        rs =stmt.executeQuery();
		        if(rs.next()) {
		        	districtSN = rs.getInt("district_sn");
		        }else {
		        	throw new Exception("找不到此地區");
		        }
		        
		        //新增資料
		        sql= "Update member SET member_name = ?, member_gender = ?, member_birthday = ?, "+
						 "member_email = ?, member_tel = ?, member_phone = ?, "+
						 "city_id = ?, district_sn = ?, address=? "+
						 "WHERE member_id = ? ;";
		        stmt =connection.prepareStatement(sql);
		        
		        //找memberId
		        HttpSession session = request.getSession();
		    	Member member =(Member) session.getAttribute("member");
		        
		        //設定參數
		        stmt.setString(1,name);
		        stmt.setInt(2, genderNo);
		        stmt.setString(3,birthday);
		        stmt.setString(4,email);
		        stmt.setString(5,local_tel);
		        stmt.setString(6,tel);
		        stmt.setInt(7,cityId);
		        stmt.setInt(8,districtSN);
		        stmt.setString(9,address);
		        stmt.setLong(10, member.getMemberId());
		        
		        
		        stmt.executeQuery();
		        request.getRequestDispatcher("/callMember").forward(request, response);
		        
		        
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
