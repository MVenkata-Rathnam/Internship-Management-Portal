import java.sql.*;
import javax.xml.parsers.*;
import java.io.*;
import org.w3c.dom.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;

public class Test{
	public static void main(String args[]){
	try{	File input = new File("venkat97.xml");
		input.createNewFile();
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.newDocument();
			
		Element User = doc.createElement("User");
		doc.appendChild(User);
		
		Element SSLC = doc.createElement("SSLC");
		SSLC.appendChild(doc.createTextNode("sjdlkfjsdlkfj"));
		User.appendChild(SSLC);
		
		Element HSC = doc.createElement("HSC");
		HSC.appendChild(doc.createTextNode("sldjflsjdfk"));
		User.appendChild(HSC);
		
		Element HIGH_DEGREE = doc.createElement("HIGH_DEGREE");
		HIGH_DEGREE.appendChild(doc.createTextNode("klsjdlkfjasdf"));
		User.appendChild(HIGH_DEGREE);
		
		Element JOBS = doc.createElement("JOBS");
		JOBS.appendChild(doc.createTextNode("djhsajkfhadfs"));
		User.appendChild(JOBS);
		
		Element INTERNSHIPS = doc.createElement("INTERNSHIPS");
		INTERNSHIPS.appendChild(doc.createTextNode("sjdfjskldfj"));
		User.appendChild(INTERNSHIPS);
		
		Element RESPONSIBILITY = doc.createElement("RESPONSIBILITY");
		RESPONSIBILITY.appendChild(doc.createTextNode("jsadkjfhd"));
		User.appendChild(RESPONSIBILITY);
		
		Element PROJECT = doc.createElement("PROJECT");
		PROJECT.appendChild(doc.createTextNode("sjdhfkjh"));
		User.appendChild(PROJECT);
		
		Element TECHNICAL_SKILLS = doc.createElement("TECHNICAL_SKILLS");
		TECHNICAL_SKILLS.appendChild(doc.createTextNode("sjdfkdfh"));
		User.appendChild(TECHNICAL_SKILLS);
		
		Element ADDITIONAL_SKILLS = doc.createElement("ADDITIONAL_SKILLS");
		ADDITIONAL_SKILLS.appendChild(doc.createTextNode("kjsldhjkfhd"));
		User.appendChild(ADDITIONAL_SKILLS);
		
		TransformerFactory transformerfactory = TransformerFactory.newInstance();
		Transformer transformer = transformerfactory.newTransformer();
		DOMSource source = new DOMSource(doc);
		StreamResult result = new StreamResult(input);
		transformer.transform(source,result);
		}catch(Exception e){}
	}
}