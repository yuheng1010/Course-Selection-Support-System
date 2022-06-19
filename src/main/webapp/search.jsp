<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>search</title>
</head>
<body bgcolor="#2F302F" background="images/bg2.png"style='position: fixed; width: 1300px; left: 0%; top: 0%; margin-top: 0px; margin-left: 0px'>
<div style="text-align: center">
<br>
<a href="logout" style="position: absolute; width: 80px; height: 100px; left: 1%; top:7.5%;margin-top: -2px; margin-left: -1px; font-size: 100%; "><font face="Lucida Sans Unicode" color=#D0D0D0>Logout</font></a>
		 <h2 style="position: absolute; width: 80px; height: 100px; left: 1%; top:15%;margin-top: -4px; margin-left: -1px;font-size: 100%;"><font face="Lucida Sans Unicode" color=#D0D0D0 >Name:${user.name} </font></h2>
        <h2 style="position: absolute; width: 80px; height: 100px; left: 1%; top:20%;margin-top: -2px; margin-left: -1px;font-size: 100%;"><font face="Lucida Sans Unicode" color=#D0D0D0 >Dep: ${user.dep} </font></h2>
<br><br><br><br><br>
	
		<h1><font color=#D0D0D0 size="6" face="Lucida Sans Unicode">Search</font></h1>
		<form action="searchP" method="post">
			<label for="Keyword"><font face="Lucida Sans Unicode" color=#D0D0D0>Keyword:</label> </font>
			<input type="text"name="Keyword" size="30" /> <br>
			<br>			
			<br> <br>
			<br>
			<button type="submit"><font face="Lucida Sans Unicode" color=#232a30>submit</font></button>
			<font face="Lucida Sans Unicode" color=#c1121f>${message}</font>
		</form>
	</div>
</body>
</html>