<%@page import="java.sql.*"%>
<%@page import="javax.xml.parsers.*"%>
<%@page import="java.io.*"%>
<%@page import="org.w3c.dom.*"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="javax.xml.transform.*"%>
<%@page import="javax.xml.transform.dom.*"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>Victory Internship Portal</title>
<meta name="title" content="Internship Application"/>
<meta charset="utf-8">
<link rel = "stylesheet" type="text/css" href = "Styles/home.css">
<link rel = "stylesheet" type="text/css" href = "Styles/Dashboard.css">
<link rel = "stylesheet" type="text/css" href = "Styles/SubMenu.css">
<script language= "javascript">
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
			String submit = request.getParameter("submitbtn");
			String internship_name = "";
			String internship_company = "";
			String internship_type = "";
			String duration = "";
			String stipend ="";
			String app_start = "";
			String app_end = "";
			String abt_company = "";
			String abt_internship = "";
			String perks = "";
			String who_apply = "";
			String timeStamp = new java.text.SimpleDateFormat("dd/MM/yyyy").format(new Date());

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
		<div style = "height : auto;" class = "GeneralInfo">
			<ul type = "">
			<li><i><img src = "Images/lightbulb.png" height = "20px" width = "20px">Kindly update your resume before applying.</i></li>
			<li><i><img src = "Images/lightbulb.png" height = "20px" width = "20px">Verify the deadline before applying.</i></li>
			</ul>
		</div>
		<div style = "color: black; 
		text-shadow: 1px 1px 1px rgba(255, 255, 255, 0.6);
  text-align : justify;
  margin-left : 150px;
  font-size : 17px;
  font-family: 'Roboto'; 
  " id = "InternInformation">
		<%
				String submit1 = request.getParameter("applybtn");
				if(!((submit1 == null) || submit1.length() == 0)){
				File input = new File("tomcat/webapps/InternshipApplication/"+submit1+".xml");
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document doc = builder.parse(input);
	
				NodeList nList = doc.getElementsByTagName("Internship");
				for(int i = 0; i < nList.getLength(); i++){
					Node n = nList.item(i);
					if(n.getNodeType() == Node.ELEMENT_NODE){
						Element element = (Element)n;
						internship_name = element.getElementsByTagName("Internship_Name").item(0).getTextContent();
						internship_company = element.getElementsByTagName("Company_Name").item(0).getTextContent();
						internship_type = element.getElementsByTagName("Internship_Type").item(0).getTextContent();
						duration = element.getElementsByTagName("Duration").item(0).getTextContent();
						stipend =element.getElementsByTagName("Stipend").item(0).getTextContent();
						app_start = element.getElementsByTagName("Application_Start").item(0).getTextContent();
						app_end = element.getElementsByTagName("Application_End").item(0).getTextContent();
						abt_company = element.getElementsByTagName("About_Company").item(0).getTextContent();
						abt_internship = element.getElementsByTagName("About_Internship").item(0).getTextContent();
						perks = element.getElementsByTagName("Perks").item(0).getTextContent();
						who_apply =element.getElementsByTagName("Who_Can_Apply").item(0).getTextContent();
		%>				
					
		<h2><%=internship_name%></h2>
		
		<h3><%= internship_company%></h3>
		<hr style = "width : 50px;"/>
		<table style = "margin-left : 0px" class = "dashboard" border = "0">
				<tr>
					<th style = "width : 39%">Internship Type</th>
					<th style = "width : 35%">Duration</th>
					<th style = "width : 30%">Stipend</th>
					<th style = "width : 30%">Posted On</th>
					<th style = "width : 30%">Apply By</th>
				</tr>
				<tr>
					<td><%=internship_type%></td>
					<td><%=duration%></td>
					<td><%=stipend%></td>
					<td><%=app_start%></td>
					<td><%=app_end%></td>
				</tr>
		</table>
		<hr style = "width : 100%; background-color : rgba(0, 0, 0, 0.5); height: .10rem; margin-top : 20px;"/>
		<h3>About :<%= internship_company%></h3>
		<hr style = "width : 50px;"/>
		<%= abt_company %>
		
		<h3>About the Internship:</h3>
		<hr style ="width : 50px;"/>
		<%=abt_internship %>
		
		<h3>Perks:</h3>
		<hr style = "width : 50px;"/>
		<%= perks %>
		
		<h3>Who Can Apply:</h3>
		<hr style = "width : 50px;"/>
		<%=who_apply %>
		<%
					}
				}
				}
		%>
		<br><br>
		<form action="Confirmation" style="border:1px solid #ccc; text-align : left;" method = "Post">
			<input type="hidden" id="company" name="companyName" value="<%=internship_company%>" >
			<input type="hidden" id="internship" name="internshipName" value="<%=internship_name%>" >
			<input type="hidden" id="internship_type" name="internship_type" value="<%=internship_type%>" >

			<button style = "float : left; width : 20%;" type="submit" class="submitbtn" name = "confirmbtn" value = "submit" >Apply Now</button>
		</form>
		</div>
		<%
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