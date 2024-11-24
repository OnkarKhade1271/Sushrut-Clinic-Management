<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    <%
    int id=Integer.parseInt(request.getParameter("id"));
    try
   	{
   	Class.forName("com.mysql.cj.jdbc.Driver");
   	System.out.println("Driver Loaded in view presc page");
   	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
   	System.out.println("Connection success in view presc page");
   	PreparedStatement pstmt=con.prepareStatement("select * from prescription where presc_id=? ");
   	pstmt.setInt(1,id);
   	ResultSet rs=pstmt.executeQuery();
   	
   	while(rs.next())
   	{
   		%>
    %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Light Theme Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 600px;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .header {
        text-align: center;
        margin-bottom: 20px;
    }
    .logo {
    margin-top:5px;
        max-width: 100px;
        margin-bottom: 10px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        font-weight: bold;
    }
    .form-group input {
        width: 70%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
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
    
</style>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="MedicalLogo.png" alt="Logo" class="logo">
        <h2>Sushrut Clinic</h2>
    </div>
    <form>
    <div class="form-group">
            <label for="Todays date">Date:</label>
            <input type="date" value="<%=rs.getDate("today_date") %>" id="todaysdate" name="todaysdate" readonly>
        </div>
        <div class="form-group">
            <label for="patientId">Patient ID:</label>
            <input type="text"  value="<%=rs.getInt("p_id") %>" id="patientId" name="pid" readonly>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name"  value="<%=rs.getString("name") %>"name="name" readonly>
        </div>
        <div class="form-group">
            <label for="age">Age:</label>
            <input type="number" id="age"  value="<%=rs.getString("age") %>"name="age" readonly>
        </div>
        <div class="form-group">
            <label for="sex">Gender:</label>
            <input type="text" id="name"  value="<%=rs.getString("gender") %>"name="gender" readonly>
        </div>
        <div class="form-group">
            <label for="weight">Weight:</label>
            <input type="number" id="weight" value="<%=rs.getString("weight") %>" min="20" max="200" name="weight" readonly>
        </div>
        <div class="form-group">
            <label for="symptoms">Symptoms:</label>
            <textarea id="symptoms" rows="15" cols="50"  name="symptoms" readonly><%=rs.getString("symptoms") %></textarea>
        </div>
        <div class="form-group">
            <label for="medicine">Medicine:</label>
            <textarea rows="15" cols="50" id="medicine"  name="medicine" readonly><%=rs.getString("medicine") %></textarea>
        </div>
        <div class="form-group">
            <label for="followUpDate">Follow-up Date:</label>
            <input type="text" id="followUpDate"  value="<%=rs.getString("followupdate") %>" name="fdate" readonly>
        </div>
        <button type="submit" class="btn"><a href="PatientMenu.jsp">Back</a></button>
    </form>
</div>
<% 
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
    
    %>
</body>
</html>