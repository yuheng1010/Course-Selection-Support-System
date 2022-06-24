<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Signup</title>
<style type="text/css">
.w3-btn{
	width:80px;
	border-radius: 40px;
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
a {
	color: #ea9b6d;
	font-size: 20px;
	text-decoration: none;
}
</style>
</head>
<body bgcolor="#2F302F" background="images/bg6.png"style='position: fixed; width: 1300px; left: 0%; top: 0%; margin-top: 0px; margin-left: 0px'>
<font face="Lucida Sans Unicode"><a href="login.jsp" style="position: absolute; left: 5%; top:10%;margin-top: -2px; margin-left: -1px;  ">login</a></font>
<div style="text-align: center">
<form action="signup" method="post" name="form1" id="form1">
	<br><br><br><br><br><br><br><br><br><br>
	<font color=#93acb5 size="5" face="Lucida Sans Unicode">Please input your personal information！</font>
	<br><br><br><br>
	<label for="ID"><font face="Lucida Sans Unicode" color=#D0D0D0>Student ID:</font></label>
	<input name="ID" size="30" />
	<br><br>
	<label for="Name"><font face="Lucida Sans Unicode" color=#D0D0D0>Name:</font></label>
	<input name="Name" size="36" />
	<br><br>
	<label for="password"><font face="Lucida Sans Unicode" color=#D0D0D0>Password:</font></label>
	<input type="password" name="password" size="32" />
	<br><br>
	<label for="Department"><font face="Lucida Sans Unicode" color=#D0D0D0>Department:</font></label>
	<input name="Department" size="29" />
	<br><br>
	<button type="submit" name="submit" class="w3-btn"><font size="4" face="Lucida Sans Unicode">Submit</font></button>
	</form>
	 <script>
        var button = document.querySelector('.w3-btn');
        
        function popup2(e) {
            window.confirm('Adding success!');
        };
        button.addEventListener('click', popup2);
    </script>
</div>
</body>
</html>