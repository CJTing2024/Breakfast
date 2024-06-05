const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');
const btnPopup = document.querySelector('.btnLogin-popup');
const iconClose = document.querySelector('.icon-close');



registerLink.addEventListener('click',()=>{
    wrapper.classList.add('active');
});

loginLink.addEventListener('click',()=>{
    wrapper.classList.remove('active');
});



btnPopup.addEventListener('click',()=>{
    wrapper.classList.add('active-popup');
});

iconClose.addEventListener('click',()=>{
    wrapper.classList.remove('active-popup');
});

//ajax
var xmlHTTP;
var str;
function checkRegister(){  
 	  //去select資料庫看是否有這筆資料	
      let register_Email=document.getElementById("register_Email").value;
	  console.log(register_Email);
      if(window.ActiveXObject)
      {
          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if(window.XMLHttpRequest)
      {
          xmlHTTP=new XMLHttpRequest();
      }

       xmlHTTP.open("POST","http://localhost:8080/Breakfast/doCheckRegister", true);	      
	   xmlHTTP.setRequestHeader('Content-Type','application/x-www-form-urlencoded; charset=UTF-8')
	  
	      

      xmlHTTP.onreadystatechange=function get_data()
      {
          if(xmlHTTP.status == 200)
          {
              if(xmlHTTP.readyState == 4)
              {
                  str=xmlHTTP.responseText;
                  if(str ==="isUsedEmail"){
                  	alert("信箱已被註冊");
                  }else{
                  	document.getElementById("register_Form").submit();
                  }
              }
          }
      }
       xmlHTTP.send('register_Email=' + register_Email);
}

function checkLogin(){
	  //去select資料庫看帳號密碼是否正確
	  let login_Email=document.getElementById("login_Email").value;
	  let login_Password=document.getElementById("login_Password").value;
      
      if(window.ActiveXObject)
      {
          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if(window.XMLHttpRequest)
      {
          xmlHTTP=new XMLHttpRequest();
      }

       xmlHTTP.open("POST","http://localhost:8080/Breakfast/doCheckLogin", true);	      
	   xmlHTTP.setRequestHeader('Content-Type','application/x-www-form-urlencoded; charset=UTF-8')
	  
	      

      xmlHTTP.onreadystatechange=function get_data()
      {
          if(xmlHTTP.status == 200)
          {
              if(xmlHTTP.readyState == 4)
              {
                  str=xmlHTTP.responseText;
				  
                  alert(str);
                  if("登入成功" === str){
                  		document.location.reload();
              	  }
              }
          }
      }
      xmlHTTP.send("login_Email=" + login_Email + "&login_Password="+login_Password );
}  


