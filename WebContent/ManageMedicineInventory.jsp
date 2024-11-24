<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
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
.back-btn a {
text-decoration:none;
  color:white;
}
.edit-btn
{
 background-color: green;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.edit-btn a {
text-decoration:none;
  color:white;
}


.delete-btn
{
 background-color: red;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.delete-btn a {
text-decoration:none;
  color:white;
}

 body
    {
     background-image:url("clinic_bg.jpg");
        background-size:cover;
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

<h1>Medicines</h1>
<table>
 <thead>
            <tr>
	<th>Medicine id</th>
	<th>Medicine Name</th>
	<th>Medicine Quantity</th>
	<th>Medicine Price</th>
	<th>Manufacturing date</th>
	<th>Best Before</th>
	<th>Medicine Description</th>
	<th>Last Update on</th>
	<th>Edit</th>
	<th>Delete</th>
	</tr>      
        </thead>
        <tbody>
	
<%
    
    try
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loaded in medicines page");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection success in My manage medicines page");
	PreparedStatement pstmt=con.prepareStatement("select * from medicines");
	ResultSet rs=pstmt.executeQuery();
	while(rs.next())
	{ 
		int m_id=rs.getInt("medicine_id");
		%>
		
	<tr>
<td><%=rs.getInt("medicine_id") %></td>
<td><%=rs.getString("medicine_name") %></td>
<td><%=rs.getInt("medicine_quantity") %></td>
<td><%=rs.getInt("medicine_price") %></td>
<td><%=rs.getDate("mfg_date") %></td>
<td><%=rs.getString("best_before") %></td>
<td><%=rs.getString("medicine_description") %></td>
<td><%=rs.getDate("last_updated_on") %></td>
<td><button class="edit-btn"><a href="EditMedicines.jsp?medicine_id=<%=m_id%>">Edit</a></button></td>
<td><button class="delete-btn"><a href="DeleteMedicines.jsp?medicine_id=<%=m_id%>">Delete</a></button></td>
	
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
	<br>
	     <button class="back-btn"><a href="MenuAtt.jsp">Back</a></button>   
	
	</center>
	</div>
</body>
</html>