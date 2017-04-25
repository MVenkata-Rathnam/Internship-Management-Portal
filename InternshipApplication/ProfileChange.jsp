<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Victory Internship Portal</title>
<meta name="title" content="Internship Application"/>
<meta charset="utf-8">
<link rel = "stylesheet" type="text/css" href = "Styles/home.css">
<link rel = "stylesheet" type="text/css" href = "Styles/Dashboard.css">
<link rel = "stylesheet" type="text/css" href = "Styles/SubMenu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<script language = "javascript">
$(document).ready(function(){
    $(".one").click(function(){
		$(".changePasswordForm").slideUp();
        $(".FeedbackForm").toggle();
	});
	$(".two").click(function(){
		$(".FeedbackForm").slideUp();
		$(".changePasswordForm").toggle();
	});
});
history.pushState(null,null,document.title);
window.addEventListener('popstate',function(){
	history.pushState(null,null,document.title);
});
</script>
</head>
<body>
<%
			String user_name = (String)session.getAttribute("userName");
			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Intern","root","");
			Statement stmt=conn.createStatement();
			Statement stmt5 = conn.createStatement();
			String submit = request.getParameter("submitbtn");
			if((!(submit == null) && submit.equals("ProfileSave"))){
				String first_name = request.getParameter("firstname");
				String last_name = request.getParameter("lastname");
				String mail_id = request.getParameter("mail");
				String username = request.getParameter("user");
			%>
			<%
				stmt.executeUpdate("update userDetails set First_Name = '"+first_name+"',Last_Name = '"+last_name+"',Email_Id = '"+mail_id+"', User_Name = '"+username+"' where User_Name = '"+user_name+"'");
				
				session.setAttribute("userName",username);
				user_name = username;
			}
			%>
			<%
			if((!(submit == null) && submit.equals("PasswordSave"))){
				String newpsw = request.getParameter("newpsw");
				String newcpsw = request.getParameter("newcpsw");
				
				if(!(newpsw.equals(newcpsw))){
				%>
				<script>alert("Password and confirm password must match!!!");</script>
				<%
				}
				else{
					String oldpsw = request.getParameter("oldpsw");
					ResultSet rs3 = stmt.executeQuery("select Password from userDetails where User_Name = '"+user_name+"'");
					rs3.next();
					String old = rs3.getString(1);
					if(!((oldpsw).equals(old))){
					%>
					<script>alert("Old password is not correct!!!");</script>
					<%
					}
					else{
						stmt.executeUpdate("update userDetails set Password = '"+newpsw+"' where User_Name = '"+user_name+"'");
					}
				}
			}
%>
	<div class = "Main">
		<div class = "MenuBar">
			<nav>
				<div class = "Heading">
					<b style = "font-size : 30px;">VICTORY INTERNSHIP PORTAL</b>
					<img style = "float : left" src="Images/Logo.png" alt="Logo" height = "60px" width = "80px"><br>
					-"Imagination at Work"
				</div>
				<%
					ResultSet rs9 = stmt5.executeQuery("select User_Type from userDetails where User_Name = '"+user_name+"'");
					rs9.next();
					if(rs9.getString(1).equals("user")){
				%>
				<ul>
					<li>
						<a class = "tooltip"  href = "UserHome.jsp">
							<img src = "Images/Home.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Dashboard</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "ViewInternship.jsp">
							<img src = "Images/Internships.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">View Internship</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "Comment.jsp">
							<img src = "Images/comment.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Comment</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "Feedback.jsp">
							<img src = "Images/Feedback.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Feedback</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "ProfileChange.jsp">
							<img src = "Images/Profile.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Profile</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "signout.jsp">
							<img src = "Images/Logout.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Sign Out</span>
						</a>
					</li>
				</ul>
				</nav>
		</div>
		<div class = "sideBar">
			<nav>
				<ul>
					<li>
						<a class = "tooltip"  href = "Pages/AboutUs.html">
							<img src = "Images/AboutUs.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">About Us</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "Pages/ContactUs.html">
							<img src = "Images/Contactus.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">FAQ And Contact</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "SuccessStory.jsp">
							<img src = "Images/success_story.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Success Stories</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "Pages/Services.html">
							<img src = "Images/GlobalNews.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Global Services</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "#subscribe">
							<img src = "Images/Subscribe.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Subscribe</span>
						</a>
					</li>
				</ul>
			  </nav>
		</div>
				<%
					}
					else{
				%>
				<ul>
					<li>
						<a class = "tooltip"  href = "EmployerHome.jsp">
							<img src = "Images/Home.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Dashboard</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "AddNewInternship.jsp">
							<img src = "Images/Internships.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">View Internship</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "Comment.jsp">
							<img src = "Images/comment.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Comment</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "FeedbackCompany.jsp">
							<img src = "Images/Feedback.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Feedback</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "ProfileChange.jsp">
							<img src = "Images/Profile.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Profile</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "signout.jsp">
							<img src = "Images/Logout.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Sign Out</span>
						</a>
					</li>
				</ul>
				</nav>
		</div>
		<div class = "sideBar">
			<nav>
				<ul>
					<li>
						<a class = "tooltip"  href = "Pages/About_us.html">
							<img src = "Images/AboutUs.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">About Us</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "Pages/Contact_us.html">
							<img src = "Images/Contactus.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">FAQ And Contact</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "SuccessStory.jsp">
							<img src = "Images/success_story.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Success Stories</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "Pages/GlobalServices.html">
							<img src = "Images/GlobalNews.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Global Services</span>
						</a>
					</li>
					<li>
						<a class = "tooltip"  href = "#subscribe">
							<img src = "Images/Subscribe.png" height = "30px" width = "30px"><br>
							<span class="tooltiptext">Subscribe</span>
						</a>
					</li>
				</ul>
			  </nav>
		</div>
				<%
					}
				%>
		<div class="submenu">
			<ul class = "sub">
				<li class="one"><a href="#">Modify Profile</a></li>
				<li class="two"><a href="#">Change Password</a></li>
			<hr />
			</ul>
		</div>
		<%
			ResultSet rs2 = stmt.executeQuery("select *from userDetails where User_Name = '"+user_name+"'");
			rs2.next();
		%>
			<div class = "FeedbackForm" title = "ProfileModificationBox">
			<center>
			<h1>View Profile Form</h1>
			<hr style = "width : 500px">
			<form action="profilechange" style="border:1px solid #ccc" method = "Post">
				<label><b>User Profile</b></label><br>
				<img src = "Images/user.png" height = "80px" width = "80px"><br><br>
				<label><b>First Name</b></label>
				<input type="text" placeholder="Enter First name" name="firstname" value = "<%=rs2.getString(1)%>"required>

				<label><b>Last Name</b></label>
				<input type="text" placeholder="Enter Last name" name="lastname" value = "<%= rs2.getString(2)%>"required>
				
				<label><b>Mail Id</b></label>
				<input type="text" placeholder="Enter Mail id" name="mail" value = "<%= rs2.getString(3) %>" required>
				
				<label><b>User Name</b></label>
				<input type="text" placeholder="Enter username" name="user" value= "<%= rs2.getString(4) %>" required>
				
				<div class="clearfix">
					<button type="button" class="resetbtn">Cancel</button>
					<button type="submit" class="submitbtn" name = "submitbtn" value = "ProfileSave" >Save Changes</button>
				</div>
			</form>
			</center>
			</div>
			<div style = "width : 40%; height : 50%; margin-left : 150px; display : none; align : center;" class ="changePasswordForm" title = "ChangePasswordBox" >
			<center>
			<h1>Change Password</h1>
			<hr style = "width : 490px">
			<form action="profilechange" style="border:1px solid #ccc" method = "Post">
				<label><b>User Profile</b></label><br>
				<img src = "Images/user.png" height = "80px" width = "80px"><br><br>
				<label><b>Old Password</b></label>
				<input type="password" placeholder="Enter Old Password" name="oldpsw" value = "" required>

				<label><b>New Password</b></label>
				<input type="password" placeholder="Enter New Password" name="newpsw" value = "" required>
				
				<label><b>Confirm New Password</b></label>
				<input type="password" placeholder="Confirm New Password" name="newcpsw" value = "" required>
				
				<div class="clearfix">
					<button type="button" class="resetbtn">Cancel</button>
					<button type="submit" class="submitbtn" name = "submitbtn" value = "PasswordSave" >Save Changes</button>
				</div>
			</center>
			</div>
		<%
				rs2.close();
				stmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<div class ="footerBlock">
			<center>
				<h3>Copyright &copy; Venkata Rathnam Muralidharan 2017 </h3>
			</center>
			<div id = "subscribe" class ="subscribe">
				<a href = "http://www.facebook.com" target="_blank"><img src = "Images/Facebook.png" height = "50px" width = "50px"></a>
				<a href = "http://www.linkedin.com" target="_blank"><img src = "Images/LinkedIn.png" height = "50px" width = "50px"></a>
				<a href = "http://www.twitter.com" target="_blank"><img src = "Images/Twitter.png" height = "50px" width = "50px"></a>
				<a href = "http://www.plus.google.com" target="_blank"><img src = "Images/Google+.png" height = "50px" width = "50px"></a>
				<a href = "http://www.skype.com" target="_blank"><img src = "Images/Skype.png" height = "50px" width = "50px"></a>
			</div>
		</div>
	</div>
</body>
</html>