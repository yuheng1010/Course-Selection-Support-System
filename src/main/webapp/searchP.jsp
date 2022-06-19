<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ page import="db3.SearchPServlet"%>
<%@ page import="db3.CourseDAO"%>
<%@ page import="db3.User"%>
<%@ page import="db3.Course"%>
<%@ page import="db3.SimSchDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="BIG5">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/lib/w3.css">
<style type="text/css">
 #wrapper {
      width: 800px;
      margin: 0 auto;
  }
.w3-btn {
	width: 40px;
	left: -150%;
	top: 10%;
	margin-right: 30px;
	border-radius: 50px;
	border: 1px solid #778da9;
}

a {
	color: #778da9;
	font-size: 16px;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
}

.white_content {
	display: none;
	position: absolute;
	top: 16%;
	left: 19%;
	width: 55%;
	height: 55%;
	padding: 20px;
	border: 10px solid black;
	background-color: #272d3a;
	z-index: 1002;
	overflow: auto;
}
.sch_content {
	display: none;
	position: absolute;
	top: 16%;
	left: 19%;
	width: 55%;
	height: 55%;
	padding: 20px;
	border: 10px solid black;
	background-color: #272d3a;
	z-index: 1002;
	overflow: auto;
}
</style>

<body bgcolor="#232a30">
<div id="wrapper">
	<font color=#D0D0D0 face="Lucida Sans Unicode">
		<br>		
		<h1><a href="search.jsp">Result</a></h1>
		<a href = "javascript:void(0)" onclick = "document.getElementById('sch').style.display='block';document.getElementById('cdetail').style.display='block'"><p align="right"><font size="3" face="Lucida Sans Unicode">Simulate Schedule</font></p></a>
		
		
		<div id="cdetail" class="overlay"></div>
		<div style="text-align: center">
			<table>

				<tr>
					<th width="100">CourseID</th>
					<th width="100">Field</th>
					<th width="100">Session</th>
					<th width="100">Course Name</th>
					<th width="100">Credit</th>
					<th width="100">Limited Person</th>
					<th width="100">ProfessorID</th>
					<th width="100">Add</th>
					<th width="100">Delete</th>
				</tr>
			</table>
				<%
				CourseDAO dao = new CourseDAO();
				ArrayList<Course> cc = new ArrayList<Course>();
				ArrayList<Course> cs = new ArrayList<Course>();
				cc = (ArrayList<Course>) request.getSession().getAttribute("cResult");

				for (int i = 0; i < cc.size(); i++) {
					
					cs = dao.searchShare(Integer.toString(cc.get(i).getCourseID()));
					out.println("<table width=\"800\">");
					out.println("<tr><th>        </th><th>     </th><th>       </th><th>           </th><th>      </th><th>              </th><th>           </th><th>   </th><th></th></tr>");
					out.println("<tr>");
					out.println("<form action=\"sharePlat\" method=\"post\"><input id=\"scid\" name=\"scid\" type=\"hidden\" value=\""+cc.get(i).getCourseID()+"\">");
					out.println(
					"<td><a href = \"javascript:void(0)\" onclick = \"document.getElementById('light"+i+"').style.display='block';document.getElementById('cdetail').style.display='block'\">"
							+ cc.get(i).getCourseID() + "</a></td></form>");
					out.println("<td width=\"100\">" + cc.get(i).getField() + "</td>");
					out.println("<td width=\"100\">" + cc.get(i).getSession() + "</td>");
					out.println("<td width=\"100\">" + cc.get(i).getName() + "</td>");
					out.println("<td width=\"100\">" + cc.get(i).getCredit() + "</td>");
					out.println("<td width=\"100\">" + cc.get(i).getLimitP() + "</td>");
					out.println("<td width=\"100\">" + cc.get(i).getProf() + "</td>");
					out.println("<form action=\"Sim\" method=\"post\">");
					out.println("<input type=\"hidden\" id=\"simcid\" name=\"simcid\" value=\""+cc.get(i).getCourseID()+"\">");
					out.println("<td width=\"100\"><button type=\"submit\">+" + "</button></td>");
					out.println("</form>");
					
					out.println("<form action=\"DelSim\" method=\"post\">");
					out.println("<input type=\"hidden\" id=\"delcid\" name=\"delcid\" value=\""+cc.get(i).getCourseID()+"\">");
					out.println("<td width=\"100\"><button type=\"submit\">x" + "</button></td>");
					out.println("</form>");
					
					out.println("</tr>");
					out.println("</table>");
					
					
					out.println("<div id=\"light"+i+"\" class=\"white_content\">");
					out.println("<table><tr><th>CourseID</th><th>Free Degree</th><th>Grade Degree</th><th>Feedback</th><th>Input Date</th></tr>");
						for(Course c:cs){
							out.println("<tr>");
							out.println("<td>" + c.getCourseID() + "</td>");
							out.println("<td>" + c.getFreeD() + "</td>");
							out.println("<td>" + c.getGradeD() + "</td>");
							out.println("<td>" + c.getFeedback() + "</td>");
							out.println("<td>" + c.getInputDate() + "</td>");
							out.println("</tr>");
						}
					out.println("</table><a href=\"javascript:void(0)\" onclick=\"document.getElementById('light"+i+"').style.display='none';document.getElementById('cdetail').style.display='none'\">Close</a></div>");
				}
				out.println("</div>");
				%>
	
			
		
		
			
	
	</font>
</div>	
</body>
<div id="sch" class="sch_content">
<font color=#D0D0D0 face="Lucida Sans Unicode">
<table BORDER="2" align=center>
	<caption>Simulate schedule</caption>
	<%  ArrayList<String>pp=new ArrayList<String>();
		HttpSession session1 = request.getSession(false);
		SimSchDAO ss=new SimSchDAO();
		User u=new User();
		u=(User) session1.getAttribute("user");
		String user=Integer.toString(u.getID());
		pp=ss.printSim(user);
	%>
	<tr>
		<td>No./Day</td>
		<td>Mon</td>
		<td>Tue</td>
		<td>Wed</td>
		<td>Thu</td>
		<td>Fri</td>
	</tr>
	<tr>
		<td>8:00-9:00</td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i)=="Mon 123"){
				out.print(pp.get(i-1));
				}
			}%> </td>
		<td>  </td>
		<td>  </td>
		<td>  </td>
		<td>  </td>
	</tr>
	<tr>
		<td>9:00-10:00</td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Mon 123")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Tue 234")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Wed 234")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Thu 234")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Fri 234")){
				out.println(pp.get(i-1));
				}
			}%></td>
	</tr>
	<tr>
		<td>10:00-11:00</td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Mon 123")){
				out.println(pp.get(i-1));
				}
			}%></td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Tue 234")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Wed 234")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Thu 234")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Fri 234")){
				out.println(pp.get(i-1));
				}
			}%></td>
	</tr>
	<tr>
		<td>11:00-12:00</td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Mon 34")){
				out.println(pp.get(i-1));
				}
			}%> </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Tue 234")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Wed 234")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Thu 234")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Fri 234")){
				out.println(pp.get(i-1));
				}
			}%></td>
	</tr>
	<tr>
		<td>13:00-14:00</td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Mon D56")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Tue D56")){
				out.println(pp.get(i-1));
				}
			}%> </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Wed D56")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Thu D56")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Fri D56")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
	</tr>
	<tr>
		<td>14:00-15:00</td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Mon D56")){
				out.println(pp.get(i-1));
				}
			}%></td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Tue D56")){
				out.println(pp.get(i-1));
				}
			}%></td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Wed D56")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Thu D56")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Fri D56")){
				out.println(pp.get(i-1));
				}
			}%>  </td>
	</tr>
		<td>15:00-16:00</td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Mon D56")){
				out.println(pp.get(i-1));
				}
			}%></td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Tue D56")){
				out.println(pp.get(i-1));
				}
			}%></td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Wed D56")){
				out.println(pp.get(i-1));
				}
			}%></td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Thu D56")){
				out.println(pp.get(i-1));
				}
			}%></td>
		<td><%for(int i=0;i<pp.size();i++){
			if(pp.get(i).equals("Fri D56")){
				out.println(pp.get(i-1));
				}
			}%> </td>
	</tr>
	<tr>

		
	</table>
	</font>
	<a href="javascript:void(0)"
				onclick="document.getElementById('sch').style.display='none';document.getElementById('cdetail').style.display='none'">Close</a>
</div>

</html>