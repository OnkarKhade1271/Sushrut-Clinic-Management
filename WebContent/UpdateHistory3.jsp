<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int p_id=Integer.parseInt(request.getParameter("p_id"));
int bp=Integer.parseInt(request.getParameter("bp"));
String diabetes=request.getParameter("diabetes");
String heart=request.getParameter("heart");
String allergies=request.getParameter("allergies");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loaded in add history page");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection success in add history page");
		PreparedStatement p1=con.prepareStatement("update patient_history set bp=?,diabetes=?,heart_problem=?,drug_allergies=? where p_id=?");
		
		p1.setInt(1,bp);
		p1.setString(2,diabetes);
		p1.setString(3,heart);
		p1.setString(4,allergies);
		p1.setInt(5,p_id);
		int i=p1.executeUpdate();
		if(i!=0)
		{
			%>
			<script>
			alert("History inserted successfully ");
			</script>
			<%
			response.sendRedirect("DoctorMenu.jsp");
		}

}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>