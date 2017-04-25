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
<script language = "javascript">
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
			String question1 = request.getParameter("question1");
			String question2 = request.getParameter("question2");
			String question3 = request.getParameter("question3");
			String question4 = request.getParameter("question4");
			String question5 = request.getParameter("question5");
			String question6 = request.getParameter("question6");
			String question7 = request.getParameter("question7");
			String question8 = request.getParameter("question8");
			String question9 = request.getParameter("question9");
			
			if(!(question1 == null || question2 == null || question3 == null || question4 == null || question5 == null || question6 == null || question1.length() == 0 || question2.length() == 0 || question3.length() == 0 || question4.length() == 0 || question5.length() == 0 || question6.length() == 0)){
				int i = stmt.executeUpdate("insert into Feedback values('"+question1+"','"+question2+"','"+question3+"','"+question4+"','"+question5+"','"+question6+"','"+question7+"','"+question8+"','"+question9+"','"+user_name+"')");
			}
				stmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
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
		<div class = "FeedbackForm" title = "FeedbackFormBox">
			<center>
			<h1>Feedback Form</h1>
			<hr style = "width : 500px">
			<form action="feedback" style="border:1px solid #ccc" method = "Post">
				<label><b>Do you find what you needed*</b></label>
				<div><input type ="radio" name = "question1" value = "yesAll">Yes, All of it
				<input type ="radio" name = "question1" value = "yesSome">Yes, Some of it
				<input type ="radio" name = "question1" value = "None">No, none of it<br><br>
				
				<label><b>What is the primary reason you came to this website*</b></label>
				<textArea rows = "3" cols ="50" id = "about" name="question2" value = "" required></textArea>
				
				<label><b>Please tell us how easy it is to find information on the site*</b></label>
				<textArea rows = "2" cols = "50" id = "description" name="question3" value = "" required> </textArea>
				
				<label><b>What is the overall impression of the site*</b></label>
				<table>
					<tr>
					<th>Asthetic Features</th>
					<th>Below Expectations</th>
					<th>Meets Expectations</th>
					<th>Exceeds Expectations</th>
					</tr>
					
					<tr>
					<td>Professional</td>
					<td style = "text-align : center"><input type ="radio" name = "question4" value = "1">1</td>
					<td style = "text-align : center"><input type ="radio" name = "question4" value = "2">2</td>
					<td style = "text-align : center"><input type ="radio" name = "question4" value = "3">3</td>
					</tr>
					
					<tr>
					<td>Informative</td>
					<td style = "text-align : center"><input type ="radio" name = "question5" value = "1">1</td>
					<td style = "text-align : center"><input type ="radio" name = "question5" value = "2">2</td>
					<td style = "text-align : center"><input type ="radio" name = "question5" value = "3">3</td>
					</tr>
				
					<tr>
					<td>Visually Pleasing</td>
					<td style = "text-align : center"><input type ="radio" name = "question6" value = "1">1</td>
					<td style = "text-align : center"><input type ="radio" name = "question6" value = "2">2</td>
					<td style = "text-align : center"><input type ="radio" name = "question6" value = "3">3</td>
					</tr>
				</table>
				
				<label><b>Do you want to say anything on any internship<br>Internship Name</b></label>
				<textArea rows = "3" cols ="50" id = "about" name="question7" value = "" required></textArea>
					
				<label><b>Company Name</b></label>
				<textArea rows = "3" cols ="50" id = "about" name="question8" value = "" required></textArea>
				
				<label><b>Your Feedback</b></label>
				<textArea rows = "3" cols ="50" id = "about" name="question9" value = "" required></textArea>
				
				<div class="clearfix">
					<button type="reset" class="resetbtn">Cancel</button>
					<button type="submit" class="submitbtn" name = "submitbtn" value = "submit" >Submit</button>
				</div>
			</form>
			</center>
		</div>
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