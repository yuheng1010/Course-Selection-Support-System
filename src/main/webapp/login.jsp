<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>G8Web</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
<link rel="stylesheet" href="/lib/w3.css">
<style>
.w3-btn{
	width:80px;
	border-radius: 20px;
	border: 1px solid #fcbf49;
}
.w3-btn:hover {
    background-color: #fcbf49; 
    color: white;
}
.w3-btn:active {
  background-color: #fcbf49;
  transform: translateY(4px);
}
.tr {
	position: absolute;
	width: 30px;
	height: 30px;
	animation-timing-function: ease-in-out;
	animation-direction: alternate;
	animation-name: tr;
	animation-duration: 5s;
	animation-iteration-count: infinite;
}
@keyframes tr{
  0%{
    transform: rotate(0deg);
  }
  100%{
    transform: rotate(360deg);
  }
}

</style>
</head>


<body bgcolor="#2F302F" background="images/bg6.png"style='position: fixed; width: 1300px; left: 0%; top: 0%; margin-top: 0px; margin-left: 0px'>
    
    <div style="text-align: center">

        <img src="images/tr1.png" class="tr" style="position: absolute; left: 50%; top: 35%; margin-top: -1px; margin-left: -400px;">
         <img src="images/tr2.png" class="tr" style="width:40px;height:40px;position: absolute; left: 50%; top: 45%; margin-top: 50px; margin-left: 250px;">
          <img src="images/tr2.png" class="tr" style="position: absolute; left: 50%; top: 90%; margin-top: 50px; margin-left: -300px;">
        <img src="images/laptop.gif" width="420" height="280" style="top:0%">
        <br>
        <font color=#D0D0D0 size="6" face="Lucida Sans Unicode">Login</font>
        <br><br>
        <form action="login" method="post" name="form1" id="form1">
            <label for="ID"><font face="Lucida Sans Unicode" color=#D0D0D0>Student ID:</font></label>
            <input name="ID" size="29.3" />
            <br><br>
            <label for="password"><font face="Lucida Sans Unicode" color=#D0D0D0>Password:</font></label>
            <input type="password" name="password" size="30" />
            <br><font face="Lucida Sans Unicode" color=#c1121f>${message}</font>
            <br>          
            <button type="submit" name="submit" class="w3-btn"><font size="4" face="Lucida Sans Unicode">Submit</font></button>        
            </form>
            <br>
            <button  class="w3-btn"  onclick="location.href='signup.jsp';"><font size="4" face="Lucida Sans Unicode">Sign up</font></button>
    </div>

   

</body>
<script> 
    $(document).ready(function() {
        $("#submit").click(function(){
        	if($("#ID").val()==""){
                alert("Please enter your ID");
                eval("document.form1['ID'].focus()");       
            }else if($("#password").val()==""){
                alert("Please enter your password");
                eval("document.form1['password'].focus()");        
            }else{
                document.form1.submit();
            }
	        })
	    })
</script>
</html>