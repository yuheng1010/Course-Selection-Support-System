<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<style type="text/css">


</style>
<html>
<head>
<meta charset="utf-8">
<title>choice</title>

</head>
<body bgcolor="#2F302F" background="images/bg5.png"style='position: fixed; width: 1300px; left: 0%; top: 0%; margin-top: 0px; margin-left: 0px'>

    <div style="text-align: center">
    <br><br><br>
        <h1><font face="Lucida Sans Unicode" color=#e1ecf7>Welcome to Course Selection Support System!</font></h1>
        <h2 style="position: absolute; width: 350px; height: 150px; left: 50%; top: 35%; margin-top: -30.5px; margin-left: -178px; font-size: 100%; font-family: 'Lucida Sans Unicode'; color: #D0D0D0;">Hello , ${user.name} !</h2>
        <br>
        <h2 style="position: absolute; width: 80px; height: 100px; left: 1%; top:20%;margin-top: -4px; margin-left: -1px;font-size: 100%;"><font face="Lucida Sans Unicode" color=#D0D0D0 >Name:${user.name} </font></h2>
        <h2 style="position: absolute; width: 80px; height: 100px; left: 1%; top:25%;margin-top: -4px; margin-left: -1px;font-size: 100%;"><font face="Lucida Sans Unicode" color=#D0D0D0 >Dep: ${user.dep} </font></h2>
        <br><br>
        <a href="logout" style="position: absolute; width: 80px; height: 100px; left: 1%; top:10%;margin-top: -2px; margin-left: -1px; font-size: 100%; "><font face="Lucida Sans Unicode" color=#D0D0D0>Logout</font></a>
        <br><br><br>
       	
    </div>
</body>
<body class="w3-container">


	<form id="form1" name="form1" action="search" method="post">

	<p> <input  type="image"  name="search_Btn"  id="search_Btn"  src="images/search.gif" align="center" style='width:280px;height:210px;left:65%;top:0%;margin-left:300px;margin-top:-20px;'onClick="document.form1.submit()">
	</form>

	<form id="form2" name="form2" action="share" method="post">

	<input  type="image"  name="share_Btn"  id="share_Btn"  src="images/share.gif"  align="center" style='width:200px;height:150px;left:80%;top:0%;margin-left:700px;margin-top:-210px;'onClick="document.form2.submit()" >
	</form></p>

</body>
</html>