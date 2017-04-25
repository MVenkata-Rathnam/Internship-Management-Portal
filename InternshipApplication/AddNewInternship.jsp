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
        $(".ViewInternshipsAdded").toggle();
	});
	$(".two").click(function(){
		$(".ViewInternshipsAdded").slideUp();
		$(".FeedbackForm").toggle();
	});
	$(".three").click(function(){
		$("#Application").toggle();
	});
});
history.pushState(null,null,document.title);
window.addEventListener('popstate',function(){
	history.pushState(null,null,document.title);
});
function loadApplication(){
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		xmlDoc = this.responseXML;
		var txt = "";
		x = xmlDoc.getElementsByTagName("Internship");
		for (i = 0; i < x.length; i++) {
			for(j = 0; j < 11; j++){
				txt += "<b>" + x[i].childNodes[j].childNodes[i].nodeValue + "</b>";
			}
		}
		alert(txt);
		alert(document.getElementById('Application'));
		document.getElementById('Application').innerHTML = txt;
		alert(document.getElementById('Application'));
    	}
	};
	xhttp.open("GET","dlksjfkj.xml", true);
	xhttp.send();
}
</script>
</head>
<body id = "temp">
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
		if(!((submit == null) || submit.length() == 0)){
			internship_name = request.getParameter("internship_name");
			internship_company = request.getParameter("company");
			internship_type = request.getParameter("internship_type");
			duration = request.getParameter("duration");
			stipend = request.getParameter("stipend");
			app_start = request.getParameter("application_start");
			app_end = request.getParameter("application_end");
			abt_company = request.getParameter("abt_company");
			abt_internship = request.getParameter("abt_internship");
			perks = request.getParameter("perks");
			who_apply = request.getParameter("who_can_apply");
			int i = stmt.executeUpdate("insert into Internship values('"+user_name+"','"+internship_company+"','"+internship_name+"','"+internship_type+"','"+app_start+"','"+app_end+"','"+duration+"','"+stipend+"')");
			
			File input = new File("tomcat/webapps/InternshipApplication/"+internship_name+".xml");
			input.createNewFile();
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.newDocument();
			
		Element Internship = doc.createElement("Internship");
		doc.appendChild(Internship);
		
		Element i_name = doc.createElement("Internship_Name");
		i_name.appendChild(doc.createTextNode(internship_name));
		Internship.appendChild(i_name);
		
		Element c_name = doc.createElement("Company_Name");
		c_name.appendChild(doc.createTextNode(internship_company));
		Internship.appendChild(c_name);
		
		Element i_type = doc.createElement("Internship_Type");
		i_type.appendChild(doc.createTextNode(internship_type));
		Internship.appendChild(i_type);
		
		Element i_duration = doc.createElement("Duration");
		i_duration.appendChild(doc.createTextNode(duration));
		Internship.appendChild(i_duration);
		
		Element stipends = doc.createElement("Stipend");
		stipends.appendChild(doc.createTextNode(stipend));
		Internship.appendChild(stipends);
		
		Element appl_start = doc.createElement("Application_Start");
		appl_start.appendChild(doc.createTextNode(app_start));
		Internship.appendChild(appl_start);
		
		Element appl_end = doc.createElement("Application_End");
		appl_end.appendChild(doc.createTextNode(app_end));
		Internship.appendChild(appl_end);
		
		Element abot_company = doc.createElement("About_Company");
		abot_company.appendChild(doc.createTextNode(abt_company));
		Internship.appendChild(abot_company);
		
		Element abot_internship = doc.createElement("About_Internship");
		abot_internship.appendChild(doc.createTextNode(abt_internship));
		Internship.appendChild(abot_internship);
		
		Element perk = doc.createElement("Perks");
		perk.appendChild(doc.createTextNode(perks));
		Internship.appendChild(perk);
		
		Element who = doc.createElement("Who_Can_Apply");
		who.appendChild(doc.createTextNode(who_apply));
		Internship.appendChild(who);
		
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
						<a class = "tooltip"  href = "Pages/GloabalServices.html">
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
				<li class="one"><a href="#">View Internships</a></li>
				<li class="two"><a href="#">Add Internship</a></li>
			<hr />
			</ul>
		</div>
		<div style = "width : 700px; margin-left : 50px;display : none;" class = "FeedbackForm" title = "InternshipAdditionBox">
			<h1>Internship Addition Form</h1>
			<hr style = "width : 700px">
			<form action="AddNewInternship" style="border:1px solid #ccc; text-align : left;" method = "Post">
				<label><b>Company Name*</b></label>
				<input type = "text" name = "company" value = "" required>
				
				<label><b>Internship Name*</b></label>
				<input type = "text" name = "internship_name" value = "" required>
				
				<label><b>Internship_Type*</b></label>
				<ul>
					<li>Full Time</li>
					<li>Half Time</li>
					<li>Work From Home</li>
				</ul>
				<input type = "text" name = "internship_type" value = "" required>
				
				<label><b>Duration*</b></label>
				<input type = "text" name = "duration" value = "" required>
				
				<label><b>Stipend*</b></label>
				<input type = "text" name = "stipend" value = "" required>
				
				<label><b>Application Start Date*</b></label>
				<input type = "text" name = "application_start" value = "" required>
				
				<label><b>Application End Date*</b></label>
				<input type = "text" name = "application_end" value = "" required>
				
				<label><b>About the Company*</b></label>
				<textArea rows = "auto" cols ="50" id = "about" name="abt_company" value = "" required></textArea>
 				
				<label><b>About the Internship*</b></label>
				<textArea rows = "auto" cols ="50" id = "about" name="abt_internship" value = "" required></textArea>
				
				<label><b>Perks*</b></label>
				<textArea rows = "2" cols = "50" id = "description" name="perks" value = "" required> </textArea>
				
				<label><b>Who Can Apply*</b></label>
				<textArea rows = "auto" cols = "50" id = "description" name="who_can_apply" value = "" required> </textArea>
				
				<div class="clearfix">
					<button type="reset" class="resetbtn">Cancel</button>
					<button type="submit" class="submitbtn" name = "submitbtn" value = "submit" >Add</button>
				</div>
			</form>
		</div>
		<div class = "ViewInternshipsAdded">
			<div style = "height : auto;" class = "GeneralInfo">
			<ul type = "">
			<li><i><img src = "Images/lightbulb.png" height = "20px" width = "20px">The following table provides the internships provided by you.</i></li>
			<li><i><img src = "Images/lightbulb.png" height = "20px" width = "20px">You can view your internship application here.</i></li>
			</ul>
			</div>
			<div style = "display : inline; overflow-y : scroll;"class = "CommentTable" title = "PostedInternships">
				<table align = "center" class = "dashboard" border = "0">
				<caption><h2><i>Internships Added</i></h2></caption>
				<tr>
					<th style = "width : 49%">Internship Name</th>
					<th style = "width : 40%">Internship Type</th>
					<th style = "width : 50%">View Application</th>
				</tr>
				<%
					ResultSet rs1 = stmt.executeQuery("select Internship_Name, Internship_Field from Internship where Poster_Name = '"+user_name+"'");
					while(rs1.next()){
				%>
				<tr>
					<td><%= rs1.getString(1) %></td>
					<td><%= rs1.getString(2) %></td>
					<td><form action = "" name = "Intern" action ="" method = "post">
							<button style = "width : 100%; background-color : tomato" type="submit" class="submitbtn" name = "viewbtn" value = "<%= rs1.getString(1)%>">View</button>
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			</div>
			<center>
			<div class="submenu">
			<ul class = "sub">
				<li class="three"><a class = "tooltip" href="#">Click Here to view the application<span style = "background-color : gray;" class="tooltiptext">Click again to slide up</span></a></li>
			<hr />
			</ul>
			</div>
			<div style = "width : 700px; margin-left : 50px;display : none;" id = "Application" class = "FeedbackForm" title = "InternshipAdditionBox">
			<h1 style = "color : tomato">View your Application after selecting an internship here</h1>
			<%
				String submit1 = request.getParameter("viewbtn");
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
					%>
			<h1>Registered Internship</h1>
			<hr style = "width : 700px">
			<form action="AddNewInternship" style="border:1px solid #ccc; text-align : left;" method = "Post">
				<label><b>Company Name*</b></label>
				<input type = "text" name = "company" value = "<%=element.getElementsByTagName("Internship_Name").item(0).getTextContent()%>" disabled>
				
				<label><b>Internship Name*</b></label>
				<input type = "text" name = "internship_name" value = "<%=element.getElementsByTagName("Company_Name").item(0).getTextContent()%>" disabled>
				
				<label><b>Internship_Type*</b></label>
				<ul>
					<li>Full Time</li>
					<li>Half Time</li>
					<li>Work From Home</li>
				</ul>
				<input type = "text" name = "internship_type" value = "<%=element.getElementsByTagName("Internship_Type").item(0).getTextContent()%>" disabled>
				
				<label><b>Duration*</b></label>
				<input type = "text" name = "duration" value = "<%=element.getElementsByTagName("Duration").item(0).getTextContent()%>" disabled>
				
				<label><b>Stipend*</b></label>
				<input type = "text" name = "stipend" value = "<%=element.getElementsByTagName("Stipend").item(0).getTextContent()%>" disabled>
				
				<label><b>Application Start Date*</b></label>
				<input type = "text" name = "application_start" value = "<%=element.getElementsByTagName("Application_Start").item(0).getTextContent()%>" disabled>
				
				<label><b>Application End Date*</b></label>
				<input type = "text" name = "application_end" value = "<%=element.getElementsByTagName("Application_End").item(0).getTextContent()%>" disabled>
				
				<label><b>About the Company*</b></label>
				<textArea disabled rows = "auto" cols ="50" id = "about" name="abt_company" value = "<%=element.getElementsByTagName("About_Company").item(0).getTextContent()%>"><%=element.getElementsByTagName("About_Company").item(0).getTextContent()%></textArea>
 				
				<label><b>About the Internship*</b></label>
				<textArea disabled rows = "auto" cols ="50" id = "about" name="abt_internship" value = "<%=element.getElementsByTagName("About_Internship").item(0).getTextContent()%>" ><%=element.getElementsByTagName("About_Internship").item(0).getTextContent()%></textArea>
				
				<label><b>Perks*</b></label>
				<textArea disabled rows = "2" cols = "50" id = "description" name="perks" value = "<%=element.getElementsByTagName("Perks").item(0).getTextContent()%>"><%=element.getElementsByTagName("Perks").item(0).getTextContent()%></textArea>
				
				<label><b>Who Can Apply*</b></label>
				<textArea disabled rows = "auto" cols = "50" id = "description" name="who_can_apply" value = "<%=element.getElementsByTagName("Who_Can_Apply").item(0).getTextContent()%>" ><%=element.getElementsByTagName("Who_Can_Apply").item(0).getTextContent()%></textArea>
			</form>
			<%
					}
				}
				}
			%>
		</div>
			</center>
			<%
					rs1.close();
					stmt.close();
					conn.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
			%>
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