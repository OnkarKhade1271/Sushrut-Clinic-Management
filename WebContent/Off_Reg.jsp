<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
  <script src="https://kit.fontawesome.com/c4254e24a8.js" crossorigin="anonymous"></script>
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.container {

    width: 100%;
    height: 100vh;
    background-image: url('petshopbg.jpg');
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
    display: flex;
    align-items: center;
    justify-content: center;
}

.useful-links {
    position: absolute;
    top: 5%;
    right: 5%;

}

.container form {
    height: 628px;
    width: 630px;
    padding:50px 123px 34px 80px;
    background-image: url(Form_bg.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    position: relative;
}

.input-group {
    width: 100%;
    display: flex;
    align-items: center;
    margin: 10px 0;
    position: relative;
}

.input-group label {
    width: 140px;
    display: inline-block;
    font-weight: bold;
    font-family: Arial, Helvetica, sans-serif;
}

.input-group input,
.input-group textarea {
    flex-basis: 68%;
    background: transparent;
    border: 0;
    outline: 0;
    padding: 10px 0;
    border-bottom: 1px solid #999;
    color: #333;
    font-size: 16px;
}

::placeholder {
    font-size: 14px;
}

form button {
    background: #141a34;
    color: #fff;
    border-radius: 4px;
    border: 1px solid rgba(255, 255, 255, 0.7);
    padding: 10px 40px;
    outline: 0;
    cursor: pointer;
    display: block;
    margin: 30px auto 10px;
}

.input-group span {
    position: absolute;
    bottom: 12px;
    right: 17px;
    font-size: 14px;
    color: red;
}

#submit-error {
    color: red;
}

.input-group span i {
    color: seagreen;
}

.reset {
    background: #141a34;
    color: #fff;
    border-radius: 4px;
    border: 1px solid rgba(255, 255, 255, 0.7);
    padding: 10px 40px;
    outline: 0;
    cursor: pointer;
    display: block;
    margin: 30px auto 10px;
}

h1 {
    text-align: center;
    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
    font-size: 23px;
    font-weight: 200px;
    padding-top: 6px;
    

}
  body
    {
     background-image:url("clinic_bg.jpg");
        background-size:cover;
    }
input#submit {
    padding: 4px;
    border-radius: 3px;
    margin-right: 3px;
    background-color: dodgerblue;
    color: white;
    width: 65px;
    height: 31px;
}

input#submit:hover {
    padding: 4px;
    margin-right: 3px;
    background-color: rgb(12, 84, 157);
    color: white;
}

span.footer {
    display: inline-block;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-style: italic;
    margin-left: 170px;
    font-size: small;
    margin-top: 15px;
}

span.footer a {
    display: inline-block;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-style: italic;
    margin-left: 5px;
    color: blue;
}

center {
    margin-top: 20px;
    margin-bottom: 5px;
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
    <form action="./OffPatRegisterServlet" method="post">
      <h1>Patient Registration Form</h1>

      <div class="input-group">
        <label>Patient Name: </label>
        <input type="text" placeholder="Enter your name" id="Patient-name" name="p_name" onkeyup="validateName()">
        <span id="name-error"></span>
      </div>

      <div class="input-group">
        <label>Patient Email: </label>
        <input type="email" placeholder="Enter Email" id="Patient-email" name="p_email" onkeyup="validateEmail()">
        <span id="email-error"></span>

      </div>

      <div class="input-group">
        <label>Patient Phone: </label>
        <input type="tel" id="Patient-phone" name="p_phone" onkeyup="validatePhone()">
        <span id="phone-error"></span>

      </div>

     
       <div class="input-group">
        <label>Gender: </label>
        <input type="radio" name="Gender" value="Male">Male
        <input type="radio" name="Gender" value="Female">Female
        <input type="radio" name="Gender" value="Other">Other
        <span id="gender-error"></span>

      </div>

      
      <div class="input-group">
        <label>Age: </label>
        <input type="text" name="age" placeholder="Enter your age" id="Patient_age" onkeyup="validateAge()">
        <span id="age-error"></span>

      </div>
      <div class="input-group">
        <label>Address : </label>
        <input type="text" name="address" placeholder="Enter Address" id="Patient-address" onkeyup="validateAddress()" >
        <span id="addresstype-error"></span>

      </div>

      <center>
        <input type="submit" value="Submit" id="submit" name="submit" onclick="return validateForm()">
        <span id="submit-error"></span>
        <input type="reset" value="Clear" id="submit">
    </center>

  </form>
    

  </div>

  <script>
   var nameError = document.getElementById('name-error');
  var emailError = document.getElementById('email-error');
  var phoneError = document.getElementById('phone-error');
  var passwordError = document.getElementById('password-error');
  var submitError = document.getElementById('submit-error');
 // var doberror=document.getElementById('dob-error');
  var addresserror=document.getElementById('addresstypr-error');
  var ageerror=document.getElementById('age-error');
  var confirmpassworderror=document.getElementById('confirmpassword-error');
  
  // Name Validation
   function validateName() {
       var name = document.getElementById('Patient-name').value;
  
       if(name.length == 0){
           nameError.innerHTML = 'Patient name is required';
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

  function validateAge()
  {
	  var age=document.getElementById('Patient_age').value;
	  if(age<=1 || age>100)
		  {
		  ageerror.innerHTML = 'Age should be valid';
		    return false; 
		  }
	  ageerror.innerHTML = 
		  '<i class="fas fa-check-circle"></i>';
      return true; 
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