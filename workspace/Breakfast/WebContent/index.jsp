<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ting.Member" %>
<% Member member = (Member) session.getAttribute("member");	%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./css/style.css" rel="stylesheet">
    <link href="./css/login_in.css" rel="stylesheet">
    <title>早午餐店</title>
</head>
<body>

    <header>
        <h1>神風餐廳-brunch  </h1>
    </header>
    
    <nav>
        <a href="#">首頁</a>
        <a href="activity.html">特別活動</a>
        <a href="menu.html">美味菜單</a>
        <a href="branchmap.html">門市據點</a>
        <a href="feedback.html">聯絡我們</a>
        <div class="ting-login-in" id="ting-login-in">
        	<a href="./member.jsp">
        		<% if(member != null)
        			 out.print(member.getMemberName());%>
        	</a><span> 會員</span>
            <a href='./logout.jsp'>登出</a>    

        </div>       
        <button class="btnLogin-popup">登入 Login</button>
    </nav>


    <div class="container">
        <div class="menu-item">
            <h2>霸氣早晨炫風早餐</h2>
            <p>新鮮蔬菜、火腿和起司，夾在酥脆的麵包中。</p>
            <p>價格：$5.99</p>
        </div>


        <div class="menu-item">
            <h2>咖啡火箭能量燃早</h2>
            <p>煎蛋、培根、香腸、烤土豆和吐司。</p>
            <p>價格：$8.99</p>
        </div>
    </div>
    <footer>
        <p>&copy; 2023 神風早午餐店. All rights reserved.</p>
    </footer>

    <!--登入介面-->
    <div class="wrapper">
        <span class="icon-close">
            <ion-icon name="close"></ion-icon>
        </span>

        <div class="form-box login">
            <h2>Login登入</h2>
            <form id="login_Form" action="/Breakfast/doLogin"  method="post">
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail-outline"></ion-icon></span>
                    <input type="email" required name="login_Email" id="login_Email">
                    <label>信箱Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                    <input type="password" required required name="login_Password" id="login_Password">
                    <label>密碼Password</label>
                </div>
                <div class="remember-forget">
                    <label ><input type="checkbox">記住帳號</label>
                    <a href="#">Forget Password?</a>
                </div>
                <button type="button" class="btn" onclick="checkLogin()">登入 Login</button>              
                <div class="login-register">
                    <p>申請帳號
                    <a 
                    href="#"
                    class="register-link">Register</a>
                    </p>
                    
                </div>
            </form>
        </div>
        <div class="form-box register">
            <h2>Registration註冊</h2>
            <form id="register_Form" action="/Breakfast/doRegister"  method="post">
                <div class="input-box">
                    <span class="icon"><ion-icon name="person-add-outline"></ion-icon></span>
                    <input type="text" required name="register_Username" id="register_Username">
                    <label>暱稱Username</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail-outline"></ion-icon></span>
                    <input type="email" required name="register_Email" id="register_Email">
                    <label>信箱Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                    <input type="password" required name="register_Password" id="register_Password">
                    <label>密碼Password</label>
                </div>
                <div class="remember-forget">
                    <label ><input type="checkbox">I agree to the terms & conditions</label>
                     
                </div>
                <button type="button" class="btn" onclick="checkRegister()">註冊 Register</button>
                <div class="login-register">
                    <p>已有帳號
                    <a 
                    href="#"
                    class="login-link">Login</a>
                    </p>
                    
                </div>

            </form>
        </div>
    </div>
    <jsp:include page="./include/isRegisterSucceed.jsp" flush="true"></jsp:include>
    <script src="./js/email.js"></script> 
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <!--登入介面-->
    
</body>
</html>