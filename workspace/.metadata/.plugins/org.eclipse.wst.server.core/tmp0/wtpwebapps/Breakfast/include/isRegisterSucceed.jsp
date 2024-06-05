<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ting.Member" %>
<%
	//Boolean isRegisterSucceed =Boolean.valueOf(String.valueOf(request.getAttribute("isRegisterSucceed")));
	if(session.getAttribute("isRegisterSucceed")!= null){
		
		session.removeAttribute("isRegisterSucceed");
	%>
		<script type="text/javascript">
			alert("恭喜被註冊成功");

		</script>			
	<%
	}
	Member member = (Member) session.getAttribute("member");
	
	if(member != null){
		%>
		<script type="text/javascript">
			document.getElementById("ting-login-in").style.display=" contents";  
			document.getElementsByClassName("btnLogin-popup")[0].style.display="none"; 			
		</script>			
	<%
	}
	
%>