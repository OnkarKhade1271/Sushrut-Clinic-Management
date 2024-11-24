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
	
h2 {
  color: #4CAF50;
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

<body>

 <nav class="green-navbar">
    <div class="green-container">
      <h1 class="logo">Sushrut Clinic</h1>
    </div>
  </nav>
  
  <div class="container">
    <form>
<h1>Patient Details</h1>
<div class="input-group">
        <label>Patient Id: </label>
        <input type="text" value="<%= rs.getInt("id")%>" id="Patient-name" name="p_name" readonly>
        <span id="name-error"></span>
      </div><br>
      
      <div class="input-group">
        <label>Patient Name: </label>
        <input type="text" value=" <%=rs.getString("p_name") %>" id="Patient-name" name="p_name" readonly>
        <span id="name-error"></span><br>
      </div>
<br>
      <div class="input-group">
        <label>Patient Email: </label>
        
        <input type="email" value="<%= rs.getString("p_email") %>" id="Patient-email" name="p_email" readonly>
        <span id="email-error"></span><br>

      </div>
<br>
      <div class="input-group">
        <label>Patient Phone: </label>
        
        <input type="tel" id="Patient-phone" value="<%=rs.getString("p_phone") %>" name="p_phone" readonly>
        <span id="phone-error"></span><br>

      </div>
<br>
     

     

      <div class="input-group">
        <label>Date of Birth : </label>
       
        <input type="date" name="dob" value="<%=rs.getDate("p_dob") %>" id="Patient-DOB"  readonly>
        <span id="dob-error"></span>

      </div>
<br>
     <div class="input-group">
        <label>Gender : </label>
       
        <input type="text" name="gender" value="<%=rs.getString("p_gender") %>" id="Patient-DOB"  readonly>
        <span id="dob-error"></span>

      </div>
<br>

      <div class="input-group">
        <label>Age: </label>
        
        <input type="text" name="age"value="<%= rs.getString("p_age") %>" id="Patient-age" readonly>
        <span id="age-error"></span>

      </div>
      <div class="input-group">
        <label>Address : </label>
        
        <input type="text" name="address" value="<%= rs.getString("p_address")%>" id="Patient-address" readonly >
        <span id="addresstype-error"></span>

      </div>

      <center>
        <button class="back-btn"><a href="PatientMenu.jsp">Back</a></button>
        
    </center>
   
   </form>
    

  </div>
  <%
  
  	}
    }
    catch(Exception e)
    {
    	System.out.println("Error");
    }
    %>
</body>
</html>