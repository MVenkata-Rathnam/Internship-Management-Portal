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
history.pushState(null,null,document.title);
window.addEventListener('popstate',function(){
	history.pushState(null,null,document.title);
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
			String query1 = "update HitCounter set Hits = Hits + 1";
			stmt.executeUpdate(query1);
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
		<div id = "SignInBox" title = "SignInBox" method = "post">
			<form action="validation" style="border:1px solid #ccc">
				<label><b>User Name</b></label>
				<input type="text" placeholder="Enter userName" name="user" required>

				<label><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="psw" required>

				<div class="clearfix">
					<button type="button" class="cancelbtn">Cancel</button>
					<button type="submit" class="signupbtn" name = "signupbtn" value = "signin" >Sign In</button>
				</div>
			</form>
		</div>
		<div id = "SignUpBox" title = "SignUpBox">
			<form action="validation" style="border:1px solid #ccc" method = "Post">
				<label><b>First Name*</b></label>
				<input type="text" placeholder="Enter First name" name="firstname" required>

				<label><b>Last Name*</b></label>
				<input type="text" placeholder="Enter Last name" name="lastname" required>
				
				<label><b>Mail Id*</b></label>
				<input type="text" placeholder="Enter Mail id" name="mail" required>
				
				<label><b>User Name*</b></label>
				<input type="text" placeholder="Enter username" name="user" required> 
				
				<label><b>Password*</b></label>
				<input type="password" placeholder="Enter Password" name="psw" required>
				
				<label><b>Confirm Password*</b></label>
				<input type="password" placeholder="Enter Password" name="cpsw" required>
				
				<label><b>Internship*</b></label>
				<label><b>Applier</b></label>
				<input type = "radio" name = "UserType" value = "user" checked>
				
				<label><b>Provider</b></label>
				<input type = "radio" name = "UserType" value = "Company">

				<div class="clearfix">
					<button type="button" class="cancelbtn">Cancel</button>
					<button type="submit" class="signupbtn" name = "signupbtn" value = "signup" >Sign Up</button>
				</div>
			</form>
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
				<h2><b><i>"Find out what you like doing best and get someone to pay you for doing it."</i></b></h2>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;- <i><b> Katharine Elizabeth Whitehorn CBE: British journalist.</b></i><br><br>
			</center>
			<div class = "Info">
			<div>
				<center>
				<b>Registered <br>Users</b>
				<%
					String query2 = "select count(*) from userDetails";
					ResultSet rs1 = stmt.executeQuery(query2);
					while(rs1.next()){
				%>
				<h1 style = " font: 100 3em sans-serif;color: gold; text-decoration: overline wavy yellowgreen;">
				<%
					out.print(rs1.getInt(1));
					}
				%>
				</center>
			</div>
			<div>
			<center>
				<b>Internship <br>Applier</b>
				<%
					String query3 = "select count(*) from userDetails where User_Type='user'";
					ResultSet rs2 = stmt.executeQuery(query3);
					while(rs2.next()){
				%>
				<h1 style = " font: 100 3em sans-serif;color: gold; text-decoration: overline wavy yellowgreen;">
				<%
					out.print(rs2.getInt(1));
					}
				%>
				</center>

			</div>
			<div>
			<center>
				<b>Internship <br>Provider</b>
				<%
					String query4 = "select count(*) from userDetails where User_Type='company'";
					ResultSet rs3 = stmt.executeQuery(query4);
					while(rs3.next()){
				%>
				<h1 style = " font: 100 3em sans-serif;color: gold; text-decoration: overline wavy yellowgreen;">
				<%
					out.print(rs3.getInt(1));
					}
				%>
				</center>

			</div>
			<div>
			<center>
				<b>Internships <br>Available</b>
				<%
					String query5 = "select count(*) from Internship";
					ResultSet rs4 = stmt.executeQuery(query5);
					while(rs4.next()){
				%>
				<h1 style = " font: 100 3em sans-serif;color: gold; text-decoration: overline wavy yellowgreen;">
				<%
					out.print(rs4.getInt(1));
					}
				%>
			</center>
			</div>
			</div>
			<br>
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
					<h3>Copyright &copy; Venkata Rathnam Muralidharan 2017 </h3>
				</center>
			</div>
		</div>
	</div>
</body>
</html>