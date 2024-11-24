<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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
	PreparedStatement pstmt=con.prepareStatement("select id from patient where id=?");
	pstmt.setInt(1,p_id);
	ResultSet rs=pstmt.executeQuery();
	int id=0;
	int flag=0;
	while(rs.next())
	{
		id=rs.getInt("id");
		if(id==p_id)
		{
			flag=1;
			break;
		}
	}
	if(flag==1)
	{
		PreparedStatement p1=con.prepareStatement("insert into patient_history(p_id,bp,diabetes,heart_problem,drug_allergies) values(?,?,?,?,?)");
		p1.setInt(1,p_id);
		p1.setInt(2,bp);
		p1.setString(3,diabetes);
		p1.setString(4,heart);
		p1.setString(5,allergies);
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