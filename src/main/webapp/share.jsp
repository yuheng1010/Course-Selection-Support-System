<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>share</title>
</head>
 <a href="logout" style="position: absolute; width: 80px; height: 100px; left: 7%; top:7%;margin-top: -2px; margin-left: -1px; font-size: 100%; "><font face="Lucida Sans Unicode" color=#D0D0D0>Logout</font></a>
<body bgcolor="#2F302F" background="images/bg2.png"style='position: fixed; width: 1300px; left: 0%; top: 0%; margin-top: 0px; margin-left: 0px'><font color=#D0D0D0 face="Lucida Sans Unicode">
	<div style="text-align: center">
	<br><br>
		<h1>Share</h1>
		<form action="share" method="post">
			<label for="LectureName">Course Name:</label> 
			<input type="text"name="LectureName" size="20" />  
			&ensp; &ensp; &ensp; 
			<label for="CourseID">CourseID:</label> 
			<input type="text"name="CourseID" size="20" />  
			<br><br>
			<label for="free_d">Free degree:</label> 
			<label><input  type="radio" name="free_d" value="1">1</label>
		    <label><input  type="radio" name="free_d" value="2">2</label>
		    <label><input  type="radio" name="free_d" value="3">3</label>
		    <label><input  type="radio" name="free_d" value="4">4</label>
		    <label><input  type="radio" name="free_d" value="5">5</label>
			&ensp; &ensp; &ensp; &ensp; 
			<label for="grade_d">Grade degree:</label> 
			<label><input  type="radio" name="grade_d" value="1">1</label>
		    <label><input  type="radio" name="grade_d" value="2">2</label>
		    <label><input  type="radio" name="grade_d" value="3">3</label>
		    <label><input  type="radio" name="grade_d" value="4">4</label>
		    <label><input  type="radio" name="grade_d" value="5">5</label>
		    <br><br>
			<label for="Feedback">Feedback:</label>
			<br>
			<textarea name="Feedback" cols="40" rows="7">What you want to share...</textarea>
			<br>
			<button type="submit" class="sub">submit</button>
		</form>
	</div>
	 <script>
        var button = document.querySelector('.sub');
        
        function popup2(e) {
            window.confirm('Thanks for sharing!');
        };
        button.addEventListener('click', popup2);
    </script>
    </font>
</body>
</html>