<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%> 
<%@page import=" java.net.URLEncoder"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
//String name="Avadhut";
//String email="wagareavadhut18@gmail.com";
//String phone="9654479936,7972616734";
session.setAttribute("name",name); 
session.setAttribute("email",email);
session.setAttribute("phone",phone); 
//String authkey = "130491ADE9VcIY7WyB5vst82d3";
String authorization="LeOktZUM0PX2T97NwQsAV35IJWav8qnzflHb6yxorhuRdCgYBKXlT6IK28MDbuq5WshEixA4GHowarvC";
//Multiple mobiles numbers separated by comma
String mobiles = phone;
Random rand = new Random();
int otp = rand.nextInt(900000) + 100000;
session.setAttribute("otp",otp);
//Sender ID,While using route4 sender id should be 6 characters long.
//String senderId = "ABCDEF";
String sender_Id ="FSTSMS";

//Your message to send, Add URL encoding here.
String message = "Your OTP is "+otp;
//Your language
String lang="english";
//define route
//String route="4";
String route="p";
//Prepare Url
URLConnection myURLConnection=null;
URL myURL=null;
BufferedReader reader=null;
//encoding message 
String encoded_message=URLEncoder.encode(message);
//Send SMS API
//String mainUrl="http://malussms.com/api/sendhttp.php?";
String mainUrl="https://www.fast2sms.com/dev/bulk";
//Prepare parameter string 
StringBuilder sbPostData= new StringBuilder(mainUrl);
sbPostData.append("?authorization="+authorization); 
sbPostData.append("&sender_id="+sender_Id);
sbPostData.append("&message="+encoded_message);
sbPostData.append("&language="+lang);
sbPostData.append("&route="+route);
sbPostData.append("&numbers="+mobiles); 



//final string
mainUrl = sbPostData.toString();
try
{
//prepare connection
myURL = new URL(mainUrl);
myURLConnection = myURL.openConnection();
myURLConnection.connect();
reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
String success="Your message sent sucessfully";
response.sendRedirect("Otp.jsp");
//finally close connection
reader.close(); 
}
catch (IOException e)
{
e.printStackTrace(); 
}
%>
</body>
</html>


