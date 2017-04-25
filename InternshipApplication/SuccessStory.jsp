<%@page import="java.sql.*"%>
<%@page import="javax.xml.parsers.*"%>
<%@page import="java.io.*"%>
<%@page import="org.w3c.dom.*"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="javax.xml.transform.*"%>
<%@page import="javax.xml.transform.dom.*"%>
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
<script type="text/javascript" src="Scripts/jquery.cycle.all.js"></script>
<script language = "javascript">
$(document).ready(function(){
    $(".one").click(function(){
		$(".SuccessForm").slideUp();
        $(".SuccessStories").toggle();
	});
	$(".two").click(function(){
		$(".SuccessStories").slideUp();
		$(".SuccessForm").toggle();
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
			Statement stmt5=conn.createStatement();
			String fname = request.getParameter("firstname");
			String lname = request.getParameter("lastname");
			String about = request.getParameter("abt");
			String desc = request.getParameter("des");
			if(!(fname == null || lname == null || about == null || desc == null || fname.length() == 0 || lname.length() == 0 || about.length() == 0 || desc.length() == 0)){
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document doc = builder.parse("tomcat/webapps/InternshipApplication/Xml/SuccessStories.xml");
			
				Element root = (Element)doc.getDocumentElement();
				Element story = doc.createElement("Story");
				root.appendChild(story);
			
				Element first_name = doc.createElement("First_Name");
				first_name.appendChild(doc.createTextNode(fname));
				story.appendChild(first_name);
				
				Element last_name = doc.createElement("Last_Name");
				last_name.appendChild(doc.createTextNode(lname));
				story.appendChild(last_name);
				
				Element About = doc.createElement("About");
				About.appendChild(doc.createTextNode(about));
				story.appendChild(About);
				
				Element Descrip = doc.createElement("Description");
				Descrip.appendChild(doc.createTextNode(desc));
				story.appendChild(Descrip);
				
				TransformerFactory transformerfactory = TransformerFactory.newInstance();
				Transformer transformer = transformerfactory.newTransformer();
				DOMSource source = new DOMSource(doc);
				StreamResult result = new StreamResult(new File("tomcat/webapps/InternshipApplication/Xml/SuccessStories.xml"));
				transformer.transform(source,result);
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
				<li class="one"><a href="#">View Success Story</a></li>
				<li class="two"><a href="#">Write Your own</a></li>
			<hr />
			</ul>
		</div>
		<div class = "SuccessStories">
			<%
				File input = new File("tomcat/webapps/InternshipApplication/Xml/SuccessStories.xml");
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document doc = builder.parse(input);
	
				NodeList nList = doc.getElementsByTagName("Story");
				for(int i = 0; i < nList.getLength(); i++){
					Node n = nList.item(i);
					if(n.getNodeType() == Node.ELEMENT_NODE){
						Element element = (Element)n;
					%>
						<div class = "temp">
						<img src = "Images/user.png" height = "30px" width = "30px">
						<h4><i style = "color : black">FirstName : </i><%=element.getElementsByTagName("First_Name").item(0).getTextContent()%></h4>
						<h4><i style = "color : black">LastName : </i><%=element.getElementsByTagName("Last_Name").item(0).getTextContent()%></h4>
						<h4><i style = "color : black">About : </i><%=element.getElementsByTagName("About").item(0).getTextContent()%></h4>
						<h4><i style = "color : black">Description : </i><%=element.getElementsByTagName("Description").item(0).getTextContent()%></h4>
						</div>
					<%
					}
				}
				rs9.close();
				stmt5.close();
				conn.close();
				}catch(Exception e){
					e.printStackTrace();
				}
				%>
		</div>
		<div class = "SuccessForm" title = "SuccessFormBox">
			<center>
			<h1>Success Stories Form</h1>
			<hr style = "width : 500px">
			<form action="success" style="border:1px solid #ccc" method = "Post">
				<label><b>First Name*</b></label>
				<input type="text" placeholder="Enter First name" name="firstname" value ="" required>

				<label><b>Last Name*</b></label>
				<input type="text" placeholder="Enter Last name" name="lastname" value = "" required>
				
				<label><b>About Yourself*</b></label>
				<textArea rows = "6" cols ="50" id = "about" name="abt" value = "" required></textArea>
				
				<label><b>Description*</b></label>
				<textArea rows = "15" cols = "50" id = "description" name="des" value = "" required> </textArea>
				
				<div class="clearfix">
					<button type="button" class="resetbtn">Cancel</button>
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