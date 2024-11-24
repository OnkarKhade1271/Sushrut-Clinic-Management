<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%
    String em=(String)session.getAttribute("useremail");
    String nm=(String)session.getAttribute("username");
   int idt=(Integer)session.getAttribute("udid");
   int sa=(Integer)session.getAttribute("sa");
   String ut=(String)session.getAttribute("utime");
   String ud=(String)session.getAttribute("udate123");
   
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
  <link rel="stylesheet" href="Registration.css">
  <script src="https://kit.fontawesome.com/c4254e24a8.js" crossorigin="anonymous"></script>
</head>
</head>
<style>
   body
    {
     background-image:url("clinic_bg.jpg");
        background-size:cover;
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
  margin-top: -50px;
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
  
  <div class="container">
    <form action="./FinalBooking" method="post">
      <h1>Book Your Appointment</h1>
      <div class="input-group">
        <label>Patient Id: </label>
        <input type="text" value="<%= idt%>" id="Patient-name" name="p_id" readonly>
        <span id="name-error"></span>
      </div>
      

       <div class="input-group">
        <label>Patient Name: </label>
        <input type="text" value="<%=nm %>" id="Patient-name" name="p_name" readonly>
        <span id="name-error"></span>
      </div>

      <div class="input-group">
        <label>Patient Email: </label>
        <input type="email" value="<%=em%>" id="Patient-email" name="p_email" readonly>
        <span id="email-error"></span>

      </div>

      
      

      <div class="input-group">
        <label>Date of Appointment : </label>
        <input type="date" name="a_date"  value="<%=ud %>" readonly >
        <span id="dob-error"></span>

      </div>

      <div class="input-group">
        <label>Selected Time of Appointment : </label>
        <input type="text" name="a_time"  value="<%=ut %>"  readonly><br>
       
        <span id="a_time"></span>

      </div>


      <div class="input-group">
        <label>Slots Available : </label>
        <input type="text" name="sa" value="<%=sa %>" readonly >
        <span id="dob-error"></span>

      </div>

      

      <center>
        <input type="submit" value="Book" id="submit" name="submit" >
        <span id="submit-error"></span>
    </center>
    
</form>
</div>
</body>
</html>