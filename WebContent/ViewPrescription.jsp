<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <% 
    String email=(String)session.getAttribute("useremail");
    try
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loaded in view presc");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection Success in view presc !......");
	PreparedStatement ps=con.prepareStatement("select id from patient where p_email=?");
	ps.setString(1,email);
	ResultSet rs=ps.executeQuery();
	int id=0;
	int flag=0;
	while(rs.next())
	{
		id=rs.getInt("id");
	}
	System.out.println(id);
	if(id!=0)
	{
		
    %>
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
.view-btn
{
 background-color:green;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;

}

.view-btn a
{
text-decoration:none;
  color:white;
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
<h1>View Prescriptions</h1>
<table>
<thead>
<tr>
	<th>Prescription  Id</th>
	<th>Patient Id</th>
	<th>Prescription Date</th>
	<th>Symptoms</th>
	<th>Medicines</th>
	<th>Follow up date</th>
	<th>View  Full</th>
	</tr>
	</thead>
	<tbody>
<%
    
    	PreparedStatement ps2=con.prepareStatement("select * from prescription where p_id=? order by today_date desc");
		ps2.setInt(1,id);
		ResultSet rs1=ps2.executeQuery();
		while(rs1.next())
		{
			int presc_id=rs1.getInt("presc_id");
		%>
		
	<tr>
<td><%=rs1.getInt("presc_id") %></td>
<td><%=rs1.getInt("p_id") %></td>
<td><%=rs1.getDate("today_date") %></td>
<td><%=rs1.getString("symptoms") %></td>
<td><%=rs1.getString("medicine") %></td>
<td><%=rs1.getString("followupdate") %></td>
<td><button class="view-btn"><a href="ViewInFull.jsp?id=<%=presc_id%>">View</a></button></td>

	
<% 
	
	}
    %>
     </tr>
      </tbody>
    </table>
</div>
<br>
	        <button class="back-btn"><a href="PatientMenu.jsp">Back</a></button>
	
	</center>
</body>
<% 
}
	
	else
	{
		%>
		<script>
				alert("Wrong credentials ");
		</script>
		
		
		<% 
	}
	con.close();
	}
	catch(Exception e)
	{
	e.printStackTrace();	
	}%>
</html>