<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ting.*" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./css/member.css" rel="stylesheet">
    <title>會員資料瀏覽</title>
    <style>
   	.change_Password{   
	    display: none;
	    background-color: aqua;
	    width: 300px;
	    position: absolute;
	    z-index: 1;
	    left: 50%;
	    top: 50%;
	    transform: translate(-50%,-50%);
	    padding: 30px;
	    border-radius: 20px;
	    font-size: 1.2rem;
	}
	.change_Password .icon-close{ 
	    position: absolute;
	    top: 0;
	    right: 0;
	    width: 45px;
	    height: 45px;
	    background-color: #162938;
	    font-size: 2em;
	    color: #fff;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    border-bottom-left-radius: 20px;
	    z-index: 1;
	    cursor:pointer;
	    border-top-right-radius: 20px;
	}
    </style>
   
    <script type="text/javascript">
	    //顯示修改介面
	    function changeAlterMember(){
	    	const ting_member_info = document.querySelector('#ting_member_info');
	    	const ting_member_alterinfo = document.querySelector('#ting_member_alterinfo');
	    	ting_member_info.style.display="none"
	    	ting_member_alterinfo.style.display="block"
	    }
	    function changeMember(){
	    	const ting_member_info = document.querySelector('#ting_member_info');
	    	const ting_member_alterinfo = document.querySelector('#ting_member_alterinfo');
	    	ting_member_alterinfo.style.display="none"
	    	ting_member_info.style.display="block"
	    }
	    function confirmModify(){
	    	const alter_member_form = document.querySelector('#alter_member_form');
	    	alter_member_form.submit();
	    }
	    
    </script>
  
</head>

<body>
	<%
	Member member = (Member) session.getAttribute("member");	
	if(member == null){
		%>
		<script type="text/javascript">
			alert("請先登入會員");
			location.href="./index.jsp";
		</script>			
	<%
	}else{
		request.setCharacterEncoding("utf-8");
		MemberPassword memberPassword = (MemberPassword) request.getAttribute("memberPassword");
		if( memberPassword == null){ %>
			<jsp:forward page="/callMember"/>
		<%}else{%>
			

    <header>
        <h1>會員資料</h1>
    </header>

    <nav>
        <a href="index.html">首頁</a>
        <a href="#">特別活動</a>
        <a href="menu.html">美味菜單</a>
        <a href="branchmap.html">門市據點</a>
        <a href="feedback.html">聯絡我們</a>
    </nav>
	<div class="change_Password">
        <span class="icon-close">
            <ion-icon name="close"></ion-icon>
        </span>
        <form action="#">
            <h2>更改密碼</h2>
            <div>
                <label for="old_Password">舊密碼:</label>
                <input type="password" name="old_Password" id="old_Password">
            </div>
            <br>
            <div>
                <label for="new_Password">新密碼:</label>
                <input type="password" name="new_Password" id="new_Password">
            </div>
            <br>
            <div>
                <label for="re_Password">再次輸入密碼:</label>
                <input type="password" name="re_Password" id="re_Password">
            </div>
            <br>
            <button type="button" class="btn" onclick="alterPassword()">確定</button>
        </form>
    </div>
    <div class="container_ting">
        <aside class="aside_ting">
            <div class="side_bar_title_ting">
                早餐殿
            </div>
            <div class="side_bar_ul_ting">
                <ul>
                    <li><a href="">會員資料</a></li>
                    <li><a href="">我的優惠卷</a></li>
                    <li><a href="">過往消費紀錄</a></li>
                </ul>
            </div>
        </aside>
        <main class="main_ting">
            <h1>會員資料</h1>
            <div class="main_div_ting">
                <article id="ting_member_info">
                    <form action="#" method="post">
                        <p>帳號:<span>&nbsp;<%= memberPassword.getMemberId()%></span></p>
                        <br>
                        <label for="name"><p>姓名: <span>&nbsp;<%= memberPassword.getMemberName()%></span></p></label>
                        <br>              
                        <label for="gender"><p>性別: <span>&nbsp;
                        <br>
                        <% if("1".equals(memberPassword.getMemberGender())){
                        		out.print("男");
                        	}else if("0".equals(memberPassword.getMemberGender())){
                        		out.print("女");
                        	}%></span></p></label>
                        <label for="birthday"><p>生日: <span>&nbsp;<%= memberPassword.getMemberBirthday()%></span></p></label>
                        <br>
                        <label for="email"><p>Email: <span>&nbsp;<%= memberPassword.getMemberEmail()%></span></p></label>
                        <br>
                        <label for="local_tel"><p>市話: <span>&nbsp;<%= memberPassword.getMemberTel()%></span></p></label>                       
                        <br>
                        <label for="tel"><p>手機: <span>&nbsp;<%= memberPassword.getMemberPhone()%></span></p></label>
                        <br>
                        <p>地址:<span>&nbsp;<%= memberPassword.getCity()+memberPassword.getDistrict()+memberPassword.getAddress()%></span></p>
						<br>
                        <input type="button" value="修改會員資料" id="modify_member_info" onclick="changeAlterMember()">
                        
                        <input type="button" value="修改密碼" id="modify_member_passwd" onclick="changePasswd()">
                    </form>
                </article>
                <article id="ting_member_alterinfo">
                    <form action="/Breakfast/doUpdateMemberInfo" method="post" id="alter_member_form">
                        <p>帳號:<span>&nbsp;<%= memberPassword.getMemberId()%></span></p>
                        <p>密碼:<span>&nbsp;**********************</span></p>

                        <label for="name"><p>姓名:</p></label>
                        <p><input type="text" name="name" id="name" value="<%= memberPassword.getMemberName()%>" placeholder="請輸入姓名"></p>
                        
                        <label for="gender"><p>性別:</p></label>
                         	
                                         
                        <p>
                            <input type="radio" name="gender" value="male" <% if("1".equals(memberPassword.getMemberGender()))
                            													out.print("checked");%>> 男
                           
                            <input type="radio" name="gender" value="female" <% if("0".equals(memberPassword.getMemberGender()))
                            														out.print("checked");%>> 女                            
                        </p>

                        <label for="birthday">生日:</label>
                        <input type="date" name="birthday" id="birthday" value="<%=memberPassword.getMemberBirthday()%>">

                        <label for="email"><p>Email:</p></label>
                        <p><input type="email" name="email" id="email" value="<%= memberPassword.getMemberEmail()%>" readonly="readonly"></p>
                        
                        <label for="local_tel"><p>市話:</p></label>
                        <p><input type="tel" name="local_tel" id="local_tel" value="<%= memberPassword.getMemberTel()%>"></p>
                        
                        <label for="tel"><p>手機:</p></label>
                        <p><input type="tel" name="tel" id="tel" value="<%= memberPassword.getMemberPhone()%>"></p>
                        
                        <fieldset class="fieldset_ting">                        	
                      
                            	<script>
                           			window.addEventListener("load", (event) => {
                            			var i=null;
                            			var select_city = document.getElementById("city");
                            			var select_district = document.getElementById("district");
                            			for (i=0; i< select_city.options.length; i++)
                            			{
                            			    if (select_city.options[i].value === "<%= memberPassword.getCity()%>") 
                            			    {
                            			    	select_city.selectedIndex = i;
                            			    	console.log(i);
                            			    	datas[i-1].districts.forEach(data =>{
                            			    		addOption(dist,data.name,data.name);
                            			    	})
                            			    	for (j=0; j< select_district.options.length; j++){
                            			    		if (select_district.options[j].value === "<%= memberPassword.getDistrict()%>") 
                                    			    {
                                    			    	select_district.selectedIndex = j;
                                    			    	return;
                                    			    }
                            			    	}                             			    		
                            			    }
                            			}
                            		});
                            	
                            	</script>                            
    
                            <legend>地址</legend>
                            <label for="city">縣市：</label>
                            <select name="city" id="city">
                                <option value="">請選擇縣市</option>
                            </select>
                            <label for="district">鄉鎮[市]區：</label>
                            <select name="district" id="district">
                                <option value="">請選擇地區</option>
                            </select>
                            
                            <label for="adress"><p>路(街)名或鄉里名稱：</p></label>
                            <p><input type="text" name="address" id="address" value="<%=memberPassword.getAddress()%>"></p>
                        </fieldset>
                        <br>
                        <input type="button" value="取消修改" id="cancel_modify_member_info" onclick="changeMember()">
                        
                        <input type="button" value="確認修改" id="confirm_modify" onclick="confirmModify()">
                    </form>
                </article>
                
                <article class="atricle_points_ting">
                    <section class="points_ting">
                        <h2>點數</h2>
                        <p class="points_p_ting"><%= memberPassword.getMemberPoints()%>點</p>
                        <p><a href="./activity.html">兌換頁面</a></p>
                    </section>
                </article>
            </div>
        </main>


    </div>

    <footer>
        <p>&copy; 2023 神風早午餐店. All rights reserved.</p>
    </footer>
    <!--內容開始-->


    <!--登入介面-->
    <div class="wrapper">
        <span class="icon-close">
            <ion-icon name="close"></ion-icon>
        </span>

        <div class="form-box login">
            <h2>Login登入</h2>
            <form action="#">
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail-outline"></ion-icon></span>
                    <input type="email" required>
                    <label>信箱Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                    <input type="password" required>
                    <label>密碼Password</label>
                </div>
                <div class="remember-forget">
                    <label><input type="checkbox">記住帳號</label>
                    <a href="#">Forget Password?</a>
                </div>
                <button type="submit" class="btn">登入 Login</button>
                <div class="login-register">
                    <p>申請帳號
                        <a href="#" class="register-link">Register</a>
                    </p>

                </div>

            </form>
        </div>
        <div class="form-box register">
            <h2>Registration註冊</h2>
            <form action="#">
                <div class="input-box">
                    <span class="icon"><ion-icon name="person-add-outline"></ion-icon></span>
                    <input type="text" required>
                    <label>暱稱Username</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail-outline"></ion-icon></span>
                    <input type="email" required>
                    <label>信箱Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                    <input type="password" required>
                    <label>密碼Password</label>
                </div>
                <div class="remember-forget">
                    <label><input type="checkbox">I agree to the terms & conditions</label>

                </div>
                <button type="submit" class="btn">登入 Login</button>
                <div class="login-register">
                    <p>已有帳號
                        <a href="#" class="login-link">Login</a>
                    </p>
                </div>

            </form>
        </div>
    </div> 
	<script>
    	function changePasswd(){
    		document.querySelector(".change_Password").style.display="block";
    	    document.body.scrollTop=0;
            document.documentElement.scrollTop=0;
            const change_Password = document.querySelector('.change_Password');
            const iconClose = document.querySelector('.icon-close');
            iconClose.addEventListener('click',()=>{
                change_Password.style.display="none";
            })          
    	}
    </script>   
   	<script>
   		function alterPassword(){
   			const old_Password = document.querySelector('#old_Password');
   			const new_Password = document.querySelector('#new_Password');	
   			const re_Password = document.querySelector('#re_Password');
   			alert(old_Password.value.length);
   			if(old_Password.value.length == 0||new_Password.value.length == 0||new_Password.value.length == 0){
   				alert("請確認都有輸入");
   			}else if(new_Password.value !== re_Password.value){
   				alert("再次確認密碼不正確");
   			}else if("<%= memberPassword.getMemberPassword()%>"!== old_Password.value ){
   				alert("舊密碼不符合");
   			}else{
			 	var xmlHTTP
   			 	var str
   			 	if(window.ActiveXObject)
		   	      {
		   	          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
		   	      }
		   	      else if(window.XMLHttpRequest)
		   	      {
		   	          xmlHTTP=new XMLHttpRequest();
		   	      }
		
		   	      xmlHTTP.open("POST","http://localhost:8080/Breakfast/doChangePassword", true);	      
		   		  xmlHTTP.setRequestHeader('Content-Type','application/x-www-form-urlencoded; charset=UTF-8')

		   	      xmlHTTP.onreadystatechange=function get_data()
		   	      {
		   	          if(xmlHTTP.status == 200)
		   	          {
		   	              if(xmlHTTP.readyState == 4)
		   	              {
		   	                  str=xmlHTTP.responseText;
		   	                  if(str ==="UpdateOK"){
		   	                  		alert("密碼更改成功\r\n請重新登入");
		   	                 		location.href="./index.jsp";
		   	                  }else{
		   	                		alert(str);
		   	                  }
		   	              }
		   	          }
		   	      }
		   	      xmlHTTP.send('new_Password=' + new_Password.value +'&member_Id='+ <%= member.getMemberId()%>);
		   	}	
		}  	
   	</script>
    <script src="./js/member.js"></script>
    <script src="./js/email.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <!--登入介面-->
    		<% }
	}
%>
    
</body>

</html>