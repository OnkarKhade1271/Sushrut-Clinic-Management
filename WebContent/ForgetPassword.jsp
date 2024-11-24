<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login</title>
    <script src="https://kit.fontawesome.com/c4254e24a8.js" crossorigin="anonymous"></script>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
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
        padding: 110px 71px 34px 80px;
        background-image: url(Form_bg.jpg);
        background-size: cover;
        background-repeat: no-repeat;
        border-radius: 4px;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5);
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
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        
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
        margin-top: -12px;

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
        margin-left: 328px;
        font-size: small;
        margin-top: 29px;
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
</style>

<body>
    <div class="container">
        <form method="post" action="./ForgetPassword">
            <h1>Patient Login</h1>

            <div class="input-group">
                <label>Email: </label>
                <input type="text" placeholder="Enter email" id="Cust-username" name="email" required>
                <span id="username-error"></span>
            </div>
			<div class="input-group">
                <label>Date of birth: </label>
                <input type="date"  min="1930-01-01" max="2023-01-01" placeholder="Enter date of birth" id="Cust-username" name="dob" required>
                <span id="username-error"></span>
            </div>

            <div class="input-group">
                <label> New Password: </label>
                <input type="password" placeholder="Enter Password" name="password" id="Patient-password" onclick="return validatePassword()" required>
                <span id="password-error"></span>

            </div>
			<div class="input-group">
                <label>Confirm Password: </label>
                <input type="password" placeholder="Enter Confirm Password" name="pass" id="PatientConfirm-password"  onclick="return validateMatchPassword()" required>
                <span id="confirmpassword-error"></span>

            </div>

            <center>
                <input type="submit" value="Submit" id="submit" name="submit" onclick="return validateForm()">
                <span id="submit-error"></span>
                <input type="reset" value="Clear" id="submit">
            </center>

        </form>
        <script>
  var passwordError = document.getElementById('password-error');

  var confirmpassworderror=document.getElementById('confirmpassword-error');
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



// Submit validation
  function validateForm() {
      if(!validatePassword() || !validateMatchPassword()) {
          submitError.style.display = 'block';
          submitError.innerHTML = 'Please fill all the fields';
          setTimeout(function(){submitError.style.display = 'none';}, 3000);
          return false;
      }
  }</script>
        

    </div>

   

</body>

</html>