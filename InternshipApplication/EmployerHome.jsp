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
		Statement stmt1 = conn.createStatement();
		Statement stmt2 = conn.createStatement();
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
		
		String selbtn = request.getParameter("selectbtn");
		if(!(selbtn == null || selbtn.length() == 0)){
			String int_name = request.getParameter("internshipName");
			String com_name = request.getParameter("companyName");
			String int_type = request.getParameter("internship_type");
			stmt2.executeUpdate("update Internship_Applied set Status = 'selected' where user_id = '"+selbtn+"' and Internship_Name = '"+int_name+"' and Company_Name = '"+com_name+"' and Internship_type = '"+int_type+"'");
		}
		String deselbtn = request.getParameter("deselectbtn");
		if(!(deselbtn == null || deselbtn.length() == 0)){
			String int_name = request.getParameter("internshipName");
			String com_name = request.getParameter("companyName");
			String int_type = request.getParameter("internship_type");	
			stmt2.executeUpdate("update Internship_Applied set Status = 'deselected' where user_id = '"+deselbtn+"' and Internship_Name = '"+int_name+"' and Company_Name = '"+com_name+"' and Internship_type = '"+int_type+"'");
		}
%>
<%
		String querySubmit = request.getParameter("search");
		if(!(querySubmit == null)){
			query = request.getParameterValues("Internship_Field");
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
		<div class="submenu">
			<ul class = "sub">
				<li class="one"><a href="#">View Application</a></li>
				<li class="two"><a href="#">View Resume</a></li>
			<hr />
			</ul>
		</div>
		<%
				String resbtn = request.getParameter("resumebtn");
				if(!(resbtn == null || resbtn.length() == 0)){
				File input = new File("tomcat/webapps/InternshipApplication/"+resbtn+".xml");
				FileReader fr = new FileReader(input);
				if(input.exists() && fr.read() != -1){
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
			<form action = "EmployerHome" method = "post">
			<label><b>Internship Field</b></label><br><hr>
			<%
				ResultSet rs2 = stmt.executeQuery("select distinct(Internship_Field) as Internship_Field from Internship where Poster_Name = '"+user_name+"'");
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
						ResultSet rs3 = stmt.executeQuery("select *from (select distinct table1.Internship_Name i1, table1.Company_Name c1, table1.Internship_type i2, table1.user_id u1 from Internship_Applied table1 inner join Internship table2 on table1.Company_Name = table2.Company_Name and table1.Internship_Name = table2.Internship_Name where Poster_Name = '"+user_name+"' and Status = 'Applied') as temp1 where i2 = '"+query[i]+"'");
						while(rs3.next()){
						%>
						<div class = "temp">
							<h3><%=rs3.getString(1)%></h3>
							<h5><%=rs3.getString(2)%></h4>
							<%
								ResultSet rs5 = stmt1.executeQuery("select First_Name, Last_Name from userDetails where User_Name = '"+rs3.getString(4)+"'");
								rs5.next();
								%>
								<h5><%= rs5.getString(1) + " " + rs5.getString(2) %></h5>
							<form style = "display : inline;float : left" action = "EmployerHome" method = "post">
								<button style = "width : 100%" type = "submit" name = "resumebtn" value = "<%=rs3.getString(4)%>">View Resume</button>
							</form>
							<form style = "display : inline;float : left" action ="EmployerHome" method ="post">
								<input type="hidden" id="company" name="companyName" value="<%=rs3.getString(2)%>" >
								<input type="hidden" id="internship" name="internshipName" value="<%=rs3.getString(1)%>" >
								<input type="hidden" id="internship_type" name="internship_type" value="<%=rs3.getString(3)%>" >
								<button style = "width : 100%; margin-left : 30px" type = "submit" name = "selectbtn" value = "<%=rs3.getString(4)%>">Select Candidate</button>
							</form>
							<form style = "display : inline;" action = "EmployerHome" method ="post">
							<input type="hidden" id="company" name="companyName" value="<%=rs3.getString(2)%>" >
								<input type="hidden" id="internship" name="internshipName" value="<%=rs3.getString(1)%>" >
								<input type="hidden" id="internship_type" name="internship_type" value="<%=rs3.getString(3)%>" >
								<button style = "width : 30%; margin-left : 60px" type = "submit" name = "deselectbtn" value ="<%=rs3.getString(4)%>">Deselect Candidate</button>
							</form>
						</div>
						<%
						}
					}
				}
				else{
					ResultSet rs4 = stmt.executeQuery("select distinct table1.Internship_Name, table1.Company_Name, table1.Internship_type, table1.user_id from Internship_Applied table1 inner join Internship table2 on table1.Company_Name = table2.Company_Name and table1.Internship_Name = table2.Internship_Name where Poster_Name = '"+user_name+"' and Status = 'Applied'");
					while(rs4.next()){
					%>
						<div class = "temp">
							<h3><%=rs4.getString(1)%></h3>
							<h5><%=rs4.getString(2)%></h4>
							<%
								ResultSet rs5 = stmt1.executeQuery("select First_Name, Last_Name from userDetails where User_Name = '"+rs4.getString(4)+"'");
								rs5.next();
							%>
							<h5><%= rs5.getString(1) + " " + rs5.getString(2) %></h5>
							<form style = "display : inline;float : left;" action = "EmployerHome" method = "post">
								<button style = "width : 100%" type = "submit" name = "resumebtn" value = "<%=rs4.getString(4)%>">View Resume</button>
							</form>
							<form style = "display : inline;float : left" action ="EmployerHome" method ="post">
								<input type="hidden" id="company" name="companyName" value="<%=rs4.getString(2)%>" >
								<input type="hidden" id="internship" name="internshipName" value="<%=rs4.getString(1)%>" >
								<input type="hidden" id="internship_type" name="internship_type" value="<%=rs4.getString(3)%>" >
								<button style = "width : 100%; margin-left : 30px;" type = "submit" name = "selectbtn" value = "<%=rs4.getString(4)%>">Select Candidate</button>
							</form>
							<form style = "display : inline;" action = "EmployerHome" method ="post">
								<input type="hidden" id="company" name="companyName" value="<%=rs4.getString(2)%>" >
								<input type="hidden" id="internship" name="internshipName" value="<%=rs4.getString(1)%>" >
								<input type="hidden" id="internship_type" name="internship_type" value="<%=rs4.getString(3)%>" >
								<button style = "width : 30%;margin-left : 60px;" type = "submit" name = "deselectbtn" value ="<%=rs4.getString(4)%>">Deselect Candidate</button>
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
				<%	ResultSet rs1 = stmt.executeQuery("select First_Name,Last_Name,Email_Id from userDetails where User_Name = '"+resbtn+"'");
					rs1.next();
				%>
				<img style = "float : left; margin-left : 10px;" src = "Images/user.png" width = "100px" height = "100px">
				<h2><%= rs1.getString(1) + rs1.getString(2) %></h2>
				<h4><%= rs1.getString(3) %></h4>
				<hr style = "background-color : rgba(0, 0, 0, 0.5); height : 1px; width : 880px"/>
				
				<label><b>Eduction - SSLC</b></label>
				<textArea disabled rows = "auto" cols ="50" id = "about" name="sslc" value = "<%=sslc%>" ><%=sslc%></textArea>
				
				<label><b>Eduction - HSC</b></label>
				<textArea disabled rows = "auto" cols ="50" id = "about" name="hsc" value = "<%=hsc%>" ><%=hsc%></textArea>
				
				<label><b>Eduction - Higher Degree</b></label>
				<textArea disabled rows = "auto" cols ="50" id = "about" name="hdeg" value = "<%=highdeg%>" ><%=highdeg%></textArea>
				
				<label><b>Jobs</b></label>
				<textArea disabled rows = "auto" cols ="50" id = "about" name="jobs" value = "<%=jobs%>" ><%=jobs%></textArea>
				
				<label><b>Internships</b></label>
				<textArea disabled rows = "auto" cols ="50" id = "about" name="internships" value = "<%=internships%>" ><%=internships%></textArea>
				
				<label><b>Positions of Responsibility</b></label>
				<textArea disabled rows = "auto" cols ="50" id = "about" name="respons" value = "<%=respons%>" ><%=respons%></textArea>
				
				<label><b>Projects </b></label>
				<textArea disabled rows = "auto" cols = "50" id = "about" name = "project" value = "<%=project%>" ><%=project%></textArea>
				
				<label><b>Technical Skills</b></label>
				<textArea disabled rows = "auto" cols = "50" id = "about" name = "techSkills" value = "<%=techSkills%>" ><%=techSkills%></textArea>
				
				<label><b>Additional Skills</b></label>
				<textArea disabled rows = "auto" cols = "50" id = "about" name = "addSkills" value = "<%=addSkills%>" ><%=addSkills%></textArea>
				
				<a style = "text-decoration : none; background-color : tomato;color : white;" href = "<%= resbtn %>.xml" download = "<%= rs1.getString(1)%>" >Download the resume here</a>
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