<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
    padding:100px 123px 34px 80px;
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
  body
    {
     background-image:url("clinic_bg.jpg");
        background-size:cover;
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
    <form action="./ViewReports1.jsp" method="post">
      <h1>View Reports</h1>

       <div class="input-group">
        <label>Select Criteria: </label>
        <select id="selectOption" name="reason">
        <option value="Hospital">Hospital </option>
        <option value="Patient">Patient</option>
        <option value="Medical">Medical</option>
        <option value="Others">Others</option>
        
    </select>
      </div>

           <center>
        <input type="submit" value="View" id="submit" name="submit" onclick="return validateForm()">
        <span id="submit-error"></span>
        <input type="reset" value="Clear" id="submit">
    </center>

  </form>
    

  </div>
</body>
</html>