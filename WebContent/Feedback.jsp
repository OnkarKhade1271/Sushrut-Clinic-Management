<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback form</title>
    <script src="https://kit.fontawesome.com/c4254e24a8.js" crossorigin="anonymous"></script>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
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

h2 {
  color: #4CAF50;
}

    .container {
		margin-top:70px;
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

    .container form {
    height: 628px;
    width: 585px;
    justify-content:center;
    background-image: url(Form_bg.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    border-radius: 4px;
    position: relative;
    margin-left:180px;
}

    ::placeholder {
        font-size: 14px;
    }

    h2 {
        text-align: center;
        font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        font-size: 23px;
        font-weight: 200px;
        padding-top: 6px;
        margin-left:-176px;
        color:black;
        justify-content:center;

    }
   body
    {
     background-image:url("clinic_bg.jpg");
        background-size:cover;
    }
	
	
    #btn {
        background-color: rgb(116, 116, 240);
        border-radius: 2px;
        padding: 2px 2px;
        color: white;
        font-weight:100px;
    }
    .back-btn{

 background-color: rgb(116, 116, 240);
        border-radius: 2px;
        padding: 2px 2px;
        color: white;
        font-weight:100px;
}

.back-btn a {
text-decoration:none;
  color:white;
}
    
</style>
 <%
            String email=(String)session.getAttribute("useremail");%>
            
<body>
<nav class="green-navbar">
    <div class="green-container">
      <h1 class="logo">Sushrut Clinic</h1>
    </div>
  </nav>
    
    <div class="container">
   
            <form action="./UserFeedBack" method="post">
                <h2 style="text-align:center">FeedBack Form</h2><br><br>
               <label>Give your valuable feed back:</label><br>
                <textarea id="w3review" name="feedback" rows="4"
                    cols="50" maxlength="100"></textarea><br>
<br>
<br>
                    <label for="">Rating out of 10</label><br>
                    <input type="number" name="rating" min="0" max="10">
<br>
<br>
<br>
                <input type="submit" value="Submit" id="btn">
                <button class="back-btn"><a href="PatientMenu.jsp">Back</a></button>
                
            </form>

            
    </div>

</body>

</html>