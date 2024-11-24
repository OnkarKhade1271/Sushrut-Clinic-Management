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
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loaded in add history page");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection success in add history page");
	PreparedStatement pstmt=con.prepareStatement("select p_id from patient_history where p_id=?");
	pstmt.setInt(1,p_id);
	ResultSet rs=pstmt.executeQuery();
	int id=0;
	int flag=0;
	while(rs.next())
	{
		id=rs.getInt("p_id");
		if(id==p_id)
		{
			flag=1;
			break;
		}
	}
	if(flag==1)
	{
		session.setAttribute("p_id",p_id);
		response.sendRedirect("UpdateHistory1.jsp");
	}
	else
	{
		%>
		<script>
		alert("Wrong id ..... ");
		</script>
		<%
	}
}
catch(Exception e)
{
	
}
%>
</body>
</html>