<%@page import="java.sql.*"%>
<!DOCTYPE html>
<head>
<title>Victory Internship Portal</title>
<meta name="title" content="Internship Application"/>
<meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.cycle.all.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"> 
<link rel = "stylesheet" type="text/css" href = "Styles/home.css">
<script language="javascript">
$(document).ready(function(){
	$('#slider1') .cycle({
		fx: 'fade', //'scrollLeft,scrollDown,scrollRight,scrollUp',blindX, blindY, blindZ, cover, curtainX, curtainY, fade, fadeZoom, growX, growY, none, scrollUp,scrollDown,scrollLeft,scrollRight,scrollHorz,scrollVert,shuffle,slideX,slideY,toss,turnUp,turnDown,turnLeft,turnRight,uncover,ipe ,zoom
		speed:  'slow', 
   		timeout: 2000 
	});
	$("#downArrow").click(function(){
        $(".Information").toggle();
    });
	$("#signin").click(function(){
		$("#SignInBox").dialog({
			modal : true
		});
	});
	$("#signup").click(function(){
		$("#SignUpBox").dialog({
			modal : true
		});
	});
	$(".close").click(function () {
		$("#SignUpBox").dialog();
    });
});	
</script>
</head>
<body>
	<div class = "Main">
		<%
			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Intern","root","");
			Statement stmt=conn.createStatement();
			String submit = request.getParameter("signupbtn");
			String user_name = request.getParameter("user");
			String pass_word = request.getParameter("psw");

			String query1 = "(select * from userDetails where User_Name='"+user_name+"')";
			if(submit.equals("signin")){
				try{
					ResultSet rs1 = stmt.executeQuery("select * from userDetails where User_Name='"+user_name+"'");
					while(rs1.next()){
						String pass_check = (String)rs1.getString("password");
						if(pass_check.equals(pass_word)){
							String user_type = (String)rs1.getString("User_Type");
							if(user_type.equals("user")){
								session.setAttribute("userName",user_name);
								session.setMaxInactiveInterval(3600);
								response.sendRedirect("UserHome.jsp");
							}
							else{
								session.setAttribute("userName",user_name);
								session.setMaxInactiveInterval(3600);
								response.sendRedirect("EmployerHome.jsp");
							}
						}
						else{
						%>
						<script>alert("Invalid password!!!!");</script>
						<%
							response.sendRedirect("/InternshipApplication/home");
						}
					}
				}	
				catch(Exception e){
					%>
					<script>alert("Register to access the website!!!");</script>
					<%
						response.sendRedirect("/InternshipApplication/home");
				}
			}
			else if(submit.equals("signup")){
					String first_name = request.getParameter("firstname");
					String last_name = request.getParameter("lastname");
					String mail_id = request.getParameter("mail");
					String confirm_pass = request.getParameter("cpsw");
					String user_type = request.getParameter("UserType");
					
					if(pass_word.equals(confirm_pass)){
							ResultSet rs2 = stmt.executeQuery("select * from userDetails where User_Name='"+user_name+"'");
							if(!rs2.isBeforeFirst()){
								int i = stmt.executeUpdate("insert into userDetails(First_Name,Last_name,Email_Id,User_Name,Password,User_Type) values('"+first_name+"','"+last_name+"','"+mail_id+"','"+user_name+"','"+pass_word+"','"+user_type+"')");
								if(user_type.equals("user")){
									session.setAttribute("userName",user_name);
									session.setMaxInactiveInterval(3600);
									response.sendRedirect("UserHome.jsp");
								}
								else{
									session.setAttribute("userName",user_name);
									session.setMaxInactiveInterval(3600);
									response.sendRedirect("EmployerHome.jsp");
								}
							}
							else{
								%>
								<script>alert("User already exists!!!");</script>
								<%
								response.sendRedirect("/InternshipApplication/home");
							}
					}
					else{
						%>
						<script>alert("Password and confirm password does not match!!!");</script>
						<%
						response.sendRedirect("/InternshipApplication/home");
					}
			}
			
		%>
		<div class = "Navigation">
			<nav>
				<div class = "Heading">
					<b style = "font-size : 30px;">VICTORY INTERNSHIP PORTAL</b>
					<img style = "float : left" src="Images/Logo.png" alt="Logo" height = "60px" width = "80px"><br>
					-"Imagination at Work"
				</div>
				<ul>
					<li>
						<a id = "signin" href = "#">Sign In</a>
					</li>
					<li>
						<a id = "signup" href = "#">Sign Up</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class = "TopBox">
		<center>
		<ul id="slider1">
			<li><img border="0" src="Images/TopBox1.jpg" width = "95%" height = "450px"/></li>
			<li><img border="0" src="Images/TopBox2.jpg" width = "95%" height = "450px"/></li>
			<li><img border="0" src="Images/TopBox3.jpg" width = "95%" height = "450px"/></li>
			<li><img border="0" src="Images/TopBox4.jpg" width = "95%" height = "450px"/></li>
			<li><img border="0" src="Images/TopBox5.jpg" width = "95%" height = "450px"/></li>
			<li><img border="0" src="Images/TopBox6.jpg" width = "95%" height = "450px"/></li>
		</ul>
		<div class = "Arrow">
			<img style = "background-color:grey" id = "downArrow" src ="Images/DownArrow.jpg" width = "50px" height = "50px">
		</div>
		</center>
		</div>
		<div class = "Information">
			<center>
				<h2><b><i>"Find out what you like doing best and get someone to pay you for doing it."</i></b></h2><br>
						&emsp;&emsp;&emsp;-Katharine Elizabeth Whitehorn CBE: British journalist.
			</center>
			<div class ="Counter">
				<center>
				<img src = "Images/hitCounter.png" height = "75px" width = "125px">
				<%
						String query = "select * from HitCounter";
						ResultSet rs=stmt.executeQuery(query);
						while(rs.next()){
				%>
				<h1 style = "  font: 100 3em sans-serif;color: gold;text-decoration: overline wavy yellowgreen;">
				<%
						out.print(rs.getInt("Hits"));
					}
					rs.close();
					stmt.close();
					conn.close();
					}
					catch(Exception e){
						e.printStackTrace();
					}
				%>
				</h1>
				</center>
			</div>
			<div class ="footer">
				<center>
					<h2>Copyright &copy; Venkata Rathnam Muralidharan 2017 </h2>
				</center>
			</div>
		</div>
	</div>
</body>
</html>