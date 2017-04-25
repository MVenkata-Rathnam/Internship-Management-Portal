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
<link rel = "stylesheet" type="text/css" href = "Styles/Internship.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.cycle.all.js"></script>
<script language = "javascript">
$(document).ready(function(){
    $(".one").click(function(){
		$(".FeedbackForm").slideUp();
        $(".Internships").toggle();
	});
	$(".two").click(function(){
		$(".Internships").slideUp();
		$(".FeedbackForm").toggle();
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
try{
		String user_name = (String)session.getAttribute("userName");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Intern","root","");
		Statement stmt=conn.createStatement();
		Statement stmt5=conn.createStatement();
		String sslc = "";
		String hsc = "";
		String highdeg = "";
		String jobs = "";
		String internships ="";
		String respons = "";
		String project = "";
		String techSkills = "";
		String addSkills = "";
		String query[] = null;
%>
<%
		String querySubmit = request.getParameter("search");
		if(!(querySubmit == null)){
			query = request.getParameterValues("Internship_Field");
		}
%>
<%
		String submit = request.getParameter("submitbtn");
		if(!(submit == null) && submit.equals("submit")){
			
		sslc = request.getParameter("sslc");
		hsc = request.getParameter("hsc");
		highdeg = request.getParameter("hdeg");
		jobs = request.getParameter("jobs");
		internships = request.getParameter("internships");
		respons = request.getParameter("respons");
		project = request.getParameter("project");
		techSkills = request.getParameter("techSkills");
		addSkills = request.getParameter("addSkills");
		File input = new File("tomcat/webapps/InternshipApplication/"+user_name+".xml");
		input.createNewFile();
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.newDocument();
			
		Element User = doc.createElement("User");
		doc.appendChild(User);
		
		Element SSLC = doc.createElement("SSLC");
		SSLC.appendChild(doc.createTextNode(sslc));
		User.appendChild(SSLC);
		
		Element HSC = doc.createElement("HSC");
		HSC.appendChild(doc.createTextNode(hsc));
		User.appendChild(HSC);
		
		Element HIGH_DEGREE = doc.createElement("HIGH_DEGREE");
		HIGH_DEGREE.appendChild(doc.createTextNode(highdeg));
		User.appendChild(HIGH_DEGREE);
		
		Element JOBS = doc.createElement("JOBS");
		JOBS.appendChild(doc.createTextNode(jobs));
		User.appendChild(JOBS);
		
		Element INTERNSHIPS = doc.createElement("INTERNSHIPS");
		INTERNSHIPS.appendChild(doc.createTextNode(internships));
		User.appendChild(INTERNSHIPS);
		
		Element RESPONSIBILITY = doc.createElement("RESPONSIBILITY");
		RESPONSIBILITY.appendChild(doc.createTextNode(respons));
		User.appendChild(RESPONSIBILITY);
		
		Element PROJECT = doc.createElement("PROJECT");
		PROJECT.appendChild(doc.createTextNode(project));
		User.appendChild(PROJECT);
		
		Element TECHNICAL_SKILLS = doc.createElement("TECHNICAL_SKILLS");
		TECHNICAL_SKILLS.appendChild(doc.createTextNode(techSkills));
		User.appendChild(TECHNICAL_SKILLS);
		
		Element ADDITIONAL_SKILLS = doc.createElement("ADDITIONAL_SKILLS");
		ADDITIONAL_SKILLS.appendChild(doc.createTextNode(addSkills));
		User.appendChild(ADDITIONAL_SKILLS);
		
		TransformerFactory transformerfactory = TransformerFactory.newInstance();
		Transformer transformer = transformerfactory.newTransformer();
		DOMSource source = new DOMSource(doc);
		StreamResult result = new StreamResult(input);
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
		<div class="submenu">
			<ul class = "sub">
				<li class="one"><a href="#">Apply Internships</a></li>
				<li class="two"><a href="#">Update Resume</a></li>
			<hr />
			</ul>
		</div>
		<%
				File input = new File("tomcat/webapps/InternshipApplication/"+user_name+".xml");
				if(input.exists()){
					FileReader fr = new FileReader(input);
					if(fr.read()!=-1){
					DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
					DocumentBuilder builder = factory.newDocumentBuilder();
					Document doc = builder.parse(input);
		
					NodeList nList = doc.getElementsByTagName("User");
					for(int i = 0; i < nList.getLength(); i++){
					Node n = nList.item(i);
					if(n.getNodeType() == Node.ELEMENT_NODE){
						Element element = (Element)n;
						sslc = (String)element.getElementsByTagName("SSLC").item(0).getTextContent();
						hsc = (String)element.getElementsByTagName("HSC").item(0).getTextContent();
						highdeg = (String)element.getElementsByTagName("HIGH_DEGREE").item(0).getTextContent();
						jobs = (String)element.getElementsByTagName("JOBS").item(0).getTextContent();
						internships = (String)element.getElementsByTagName("INTERNSHIPS").item(0).getTextContent();
						respons = (String)element.getElementsByTagName("RESPONSIBILITY").item(0).getTextContent();
						project = (String)element.getElementsByTagName("PROJECT").item(0).getTextContent();
						techSkills = (String)element.getElementsByTagName("TECHNICAL_SKILLS").item(0).getTextContent();
						addSkills = (String)element.getElementsByTagName("ADDITIONAL_SKILLS").item(0).getTextContent();
					}
					}
				}
				}
		%>
		<div class = "Internships">
		<div class = "Preferences">
			<form action = "viewinternship" method = "post">
			<label><b>Internship Field</b></label><br><hr>
			<%
				ResultSet rs2 = stmt.executeQuery("select distinct(Internship_Field) as Internship_Field from Internship");
				while(rs2.next()){
			%>
			<input type = "checkbox" name = "Internship_Field" value = "<%=rs2.getString(1)%>" > <%=rs2.getString(1)%><br>
			<%
				}
			%>
			<br>
			<input type = "submit" name = "search" value = "search">
			</form>
		</div>
		<div class ="verticalLine">
		</div>
		<div class = "InternshipBox">
		<%
			if(!(query == null ) && query.length != 0){
					for(int i = 0; i < query.length; i++){
						ResultSet rs3 = stmt.executeQuery("select Internship_Name, Company_Name from Internship where Internship_Field = '"+query[i]+"'");
						while(rs3.next()){
						%>
						<div class = "temp">
							<h3><%=rs3.getString(1)%></h3>
							<h5><%=rs3.getString(2)%></h4>
							<form action = "ApplyInternship" method = "post">
								<button style = "width : 20%" type = "submit" name = "applybtn" value = "<%=rs3.getString(1)%>">Apply Now</button>
							</form>
						</div>
						<%
						}
					}
				}
				else{
					ResultSet rs4 = stmt.executeQuery("select Internship_Name, Company_Name from Internship");
					while(rs4.next()){
					%>
						<div class = "temp">
							<h3><%=rs4.getString(1)%></h3>
							<h5><%=rs4.getString(2)%></h4>
							<form action = "ApplyInternship" method = "post">
								<button style = "width : 20%" type = "submit" name = "applybtn" value = "<%=rs4.getString(1)%>">Apply Now</button>
							</form>
						</div>
						<%	
					}
				}
			%>
		</div>
		</div>
		<div style = "width : 900px; margin-left : 10px;display : none" class = "FeedbackForm" title = "FeedbackFormBox">
			<center>
			<h1>Resume</h1>
			<hr style = "width : 900px">
			<form action="viewinternship" style="border:1px solid #ccc; text-align : left;" method = "Post">
				<%	ResultSet rs1 = stmt.executeQuery("select First_Name,Last_Name,Email_Id from userDetails where User_Name = '"+user_name+"'");
					rs1.next();
				%>
				<img style = "float : left; margin-left : 10px;" src = "Images/user.png" width = "100px" height = "100px">
				<h2><%= rs1.getString(1) + rs1.getString(2) %></h2>
				<h4><%= rs1.getString(3) %></h4>
				<hr style = "background-color : rgba(0, 0, 0, 0.5); height : 1px; width : 880px"/>
				
				<label><b>Eduction - SSLC</b></label>
				<textArea rows = "auto" cols ="50" id = "about" name="sslc" value = "<%=sslc%>" ><%=sslc%></textArea>
				
				<label><b>Eduction - HSC</b></label>
				<textArea rows = "auto" cols ="50" id = "about" name="hsc" value = "<%=hsc%>" ><%=hsc%></textArea>
				
				<label><b>Eduction - Higher Degree</b></label>
				<textArea rows = "auto" cols ="50" id = "about" name="hdeg" value = "<%=highdeg%>" ><%=highdeg%></textArea>
				
				<label><b>Jobs</b></label>
				<textArea rows = "auto" cols ="50" id = "about" name="jobs" value = "<%=jobs%>" ><%=jobs%></textArea>
				
				<label><b>Internships</b></label>
				<textArea rows = "auto" cols ="50" id = "about" name="internships" value = "<%=internships%>" ><%=internships%></textArea>
				
				<label><b>Positions of Responsibility</b></label>
				<textArea rows = "auto" cols ="50" id = "about" name="respons" value = "<%=respons%>" ><%=respons%></textArea>
				
				<label><b>Projects </b></label>
				<textArea rows = "auto" cols = "50" id = "about" name = "project" value = "<%=project%>" ><%=project%></textArea>
				
				<label><b>Technical Skills</b></label>
				<textArea rows = "auto" cols = "50" id = "about" name = "techSkills" value = "<%=techSkills%>" ><%=techSkills%></textArea>
				
				<label><b>Additional Skills</b></label>
				<textArea rows = "auto" cols = "50" id = "about" name = "addSkills" value = "<%=addSkills%>" ><%=addSkills%></textArea>
				
				<div class="clearfix">
					<button style = "float : left; width : 50%;" type="submit" class="submitbtn" name = "submitbtn" value = "submit" >Save Changes</button>
				</div>
			</form>
			</center>
		</div>
		<%
				rs1.close();
				stmt.close();
				conn.close();
			}catch(Exception e){
				
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