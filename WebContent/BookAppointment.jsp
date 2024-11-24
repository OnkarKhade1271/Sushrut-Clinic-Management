<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
    
    String name=(String)session.getAttribute("username");
    System.out.println(name);
    String email=(String)session.getAttribute("useremail");
    System.out.println(email);
    
    try
    {
    	int id;
    	Date p_dob;
    	String p_name,p_email,p_phone,p_age,p_address;
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	System.out.println("Driver Loaded");
    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
    	System.out.println("Connection Success !......");
    	PreparedStatement psmt;
    	ResultSet rs;
		PreparedStatement pstmt=con.prepareStatement("select * from patient where p_email=?");
		pstmt.setString(1,email);
		rs=pstmt.executeQuery();
		while(rs.next())
		{
			%> 
    
<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
  <link rel="stylesheet" href="Registration.css">
  <script src="https://kit.fontawesome.com/c4254e24a8.js" crossorigin="anonymous"></script>
</head>
<style>
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
   body
    {
     background-image:url("clinic_bg.jpg");
        background-size:cover;
    }
	
	
</style>
<body>
<nav class="green-navbar">
    <div class="green-container">
      <h1 class="logo">Sushrut Clinic</h1>
    </div>
  </nav>
  <div class="container">
    <form action="./AppointmentServlet" method="post">
      <h1>Book Your Appointment</h1>
      <div class="input-group">
        <label>Patient Id: </label>
        <input type="text" value="<%= rs.getInt("id")%>" id="Patient-name" name="p_id" readonly>
        <span id="name-error"></span>
      </div>
      

       <div class="input-group">
        <label>Patient Name: </label>
        <input type="text" value="<%=name %>" id="Patient-name" name="p_name" readonly>
        <span id="name-error"></span>
      </div>

      <div class="input-group">
        <label>Patient Email: </label>
        <input type="email" value="<%=email%>" id="Patient-email" name="p_email" readonly>
        <span id="email-error"></span>

      </div>

      
      

      <div class="input-group">
        <label>Date of Appointment : </label>
        <input type="date" name="a_date"  min="2024-05-21" max="2024-06-21" onchange="checkWeekend()" id="Appointment_date" required>
        <span id="dob-error"></span>

      </div>

      <div class="input-group">
        <label>Select Time of Appointment : </label>
        <input type="radio" name="a_time"  value="10:00 am to 12:00 pm" required >10:00 am to 12:00 pm<br>
        <input type="radio" name="a_time"  value="01:00 pm to 03:00 pm" >01:00 pm to 03:00 pm<br>
        <input type="radio" name="a_time"  value="05:00 am to 07:00 pm" >05:00 pm to 07:00 pm<br>
        
        <span id="a_time"></span>

      </div>



      

      <center>
        <input type="submit" value="Book" id="submit" name="submit" >
        <span id="submit-error"></span>
    </center>
    <%
    
    
    }
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    %>
</form>
<script>
function checkWeekend() {
    var selectedDate = new Date(document.getElementById("Appointment_date").value);
    var dayOfWeek = selectedDate.getDay(); // 0 = Sunday, 1 = Monday, ..., 6 = Saturday

    // Check if the selected day is a Saturday (6) or Sunday (0)
    if ( dayOfWeek === 0) {
        alert("Sorry Doctor not available on weekend.");
        document.getElementById("date").value = ""; // Clear the input field
    }
}
</script>
</div>
</body>

</html>