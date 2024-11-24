<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.back-btn{

 background-color: #7474f0;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

 body
    {
     background-image:url("clinic_bg.jpg");
        background-size:cover;
    }
.back-btn a {
text-decoration:none;
  color:white;
}
.container {
    background: rgba(255, 255, 255, 0.3); /* Semi-transparent white background */
    border-radius: 15px; /* Rounded corners */
    backdrop-filter: blur(10px); /* Apply blur effect */
    padding: 20px;
   /* box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);  Box shadow */
}

h1 {
    text-align: center;
    color: #444;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 10px;
    border-bottom: 1px solid #ddd; /* Bottom border */
}

td {
text-align:center;
}

th {
    background-color: #f2f2f2; /* Light gray background for headings */
    font-weight: normal;
}

tbody tr:hover {
    background-color: rgba(255, 255, 255, 0.5); /* Hover effect */
}
.green-navbar {
  background-color: #04AA6D;
  color: #fff;
  margin-top: 25px;
  height: 50px;
  padding: 1px 0;
}

.green-navbar .green-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-size: 24px;
  color: white;
  text-align: center;
  margin-top: -40px;
  padding-left: 300px;
}

.green-container {
  max-width: 800px;
  margin: 50px auto;
}
</style>

<body>
<nav class="green-navbar">
    <div class="green-container">
      <h1 class="logo">Sushrut Clinic</h1>
    </div>
  </nav>
<center>
<div class="container">
<h1>Appointments</h1>
<table>
<thead>       <tr>
	<th>Appointment Id</th>
	<th>Patient Name</th>
	<th>Appointment date</th>
	<th>Appointment Time</th>
	  </tr>
        </thead>
        <tbody>
	
<%
    
    String d1="2024-04-12";
	String d2="2024-04-19";
	Date date1=Date.valueOf(d1);
	Date date2=Date.valueOf(d2);
    try
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loaded in FinalBooking page");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection success in My appointment page");
	PreparedStatement pstmt=con.prepareStatement("select * from appointment where a_date between ? and ?");
	pstmt.setDate(1, date1);
	pstmt.setDate(2,date2);
	ResultSet rs=pstmt.executeQuery();
	while(rs.next())
	{
		%>
	<tr>
<td><%=rs.getInt("a_id") %></td>
<td><%=rs.getString("p_name") %></td>
<td><%=rs.getString("p_email") %></td>
<td><%=rs.getDate("a_date") %></td>
<td><%=rs.getString("a_time") %></td>	
<% 
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
    
    %>
    </tr>
    </tbody>
	</table>
	</div>
	<br>
	        <button class="back-btn"><a href="DoctorMenu.jsp">Back</a></button>
	
	</center>
</body>
</html>