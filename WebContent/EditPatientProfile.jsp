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
    <form action="./UpdateUser" method="post">
      <h1>Update Your Details</h1>

      <div class="input-group">
        <label>Patient Name: </label>
        <input type="text" value="<%=rs.getString("p_name") %>" id="Patient-name" name="p_name" onkeyup="validateName()">
        <span id="name-error"></span>
      </div>

      <div class="input-group">
        <label>Patient Email: </label>
        <input type="email" value="<%=rs.getString("p_email")%>" id="Patient-email" name="p_email" readonly>
        <span id="email-error"></span>

      </div>

      <div class="input-group">
        <label>Patient Phone: </label>
        <input type="tel" value="<%=rs.getString("p_phone")%>" id="Patient-phone" name="p_phone" onkeyup="validatePhone()">
        <span id="phone-error"></span>

      </div>

      

      <div class="input-group">
        <label>Date of Birth : </label>
        <input type="date" name="dob"value="<%=rs.getString("p_dob")%>" min="1930-01-01" max="2023-01-01" id="Patient_DOB" onchange="calculateAge()" >
        <span id="dob-error"></span>

      </div>

     

      <div class="input-group">
        <label>Age: </label>
        <input type="text" name="age" value="<%=rs.getString("p_age")%>" placeholder="Enter your age" id="Patient_age" readonly>
        <span id="age-error"></span>

      </div>
      <div class="input-group">
        <label>Address : </label>
        <input type="text" name="address" value="<%=rs.getString("p_address")%>" placeholder="Enter Address" id="Patient-address" onkeyup="validateAddress()" >
        <span id="addresstype-error"></span>

      </div>

      <center>
        <input type="submit" value="Update" id="submit" name="submit" onclick="return validateForm()">
        <span id="submit-error"></span>
       
    </center>
  
 <%
  
  	}
    }
    catch(Exception e)
    {
    	System.out.println("Error");
    }
    %>
  </form>
    

  </div>

  <script>
   var nameError = document.getElementById('name-error');
  var emailError = document.getElementById('email-error');
  var phoneError = document.getElementById('phone-error');
  //var passwordError = document.getElementById('password-error');
  var submitError = document.getElementById('submit-error');
 // var doberror=document.getElementById('dob-error');
  var addresserror=document.getElementById('addresstypr-error');
  var ageerror=document.getElementById('age-error');
  //var confirmpassworderror=document.getElementById('confirmpassword-error');
  
  // Name Validation
   function validateName() {
       var name = document.getElementById('Patient-name').value;
  
       if(name.length == 0){
           nameError.innerHTML = 'Customer name is required';
           return false;
       }
       if(!name.match(/^[A-Za-z]*\s{1}[A-Za-z]*$/)) {
           nameError.innerHTML = 'Write full name';
           return false;
       }
       nameError.innerHTML = '<i class="fas fa-check-circle"></i>';
       return true;
   }
  
  // Email Validation
  function validateEmail() {
      var email = document.getElementById('Patient-email').value;
  
      if(!email.match(/^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)) {
          emailError.innerHTML = "Please enter a valid email";
          return false;
      }
      emailError.innerHTML = '<i class="fas fa-check-circle"></i>';
      return true;  
  }
  
  // Phone validation
  function validatePhone() {
      var phone = document.getElementById('Patient-phone').value;
  
      if(phone.length == 0) {
          phoneError.innerHTML = 'Phone is required';
          return false;
      }
      if(phone.length !== 10) {
          phoneError.innerHTML = 'Phone no. should be 10 digits';
          return false;
      }
      if(!phone.match (/^[6-9][0-9]{9}$/)) {
          phoneError.innerHTML = 'Enter a valid phone no ';
          return false;
      }
      phoneError.innerHTML = '<i class="fas fa-check-circle"></i>';
      return true;
  }
  
  
  // Password validation
  function validatePassword() {
      var password = document.getElementById('Patient-password').value;
  
      if(password.length == 0) {
          passwordError.innerHTML = 'Password is required';
          return false;
      }
      if(password.length < 8 ) {
          passwordError.innerHTML = 'Password should be minimum 8 characters';
          return false;
      }
      passwordError.innerHTML = '<i class="fas fa-check-circle"></i>';
      return true;
  }
  
  function validateMatchPassword() {  
  var pw1 = document.getElementById("Patient-password").value;  
  var pw2 = document.getElementById("PatientConfirm-password").value;  
  if(pw1 != pw2)  
  {   
    confirmpassworderror.innerHTML = 'Password should be matched';
    return false; 
  }
  
  confirmpassworderror .innerHTML = '<i class="fas fa-check-circle"></i>';
      return true; 
} 

  function calculateAge() {
      var birthdate = new Date(document.getElementById('Patient_DOB').value);
      var today = new Date();
      var age = today.getFullYear() - birthdate.getFullYear();
      var m = today.getMonth() - birthdate.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < birthdate.getDate())) {
          age--;
      }
      document.getElementById('Patient_age').value = age;
    }

// Submit validation
  function validateForm() {
      if(!validateName() || !validateEmail() || !validatePhone() || !validatePassword() || !validateAge() || !validateMatchPassword()) {
          submitError.style.display = 'block';
          submitError.innerHTML = 'Please fill all the fields';
          setTimeout(function(){submitError.style.display = 'none';}, 3000);
          return false;
      }
  }</script>

</body>

</html>