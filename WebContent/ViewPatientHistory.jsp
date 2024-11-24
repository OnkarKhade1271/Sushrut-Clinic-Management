<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%
String email=(String)session.getAttribute("useremail");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
System.out.println("Driver Loaded in patient history page");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
System.out.println("Connection success in patient history1 page");
PreparedStatement pstmt=con.prepareStatement("select id from patient where p_email=?");
pstmt.setString(1,email);
ResultSet rs=pstmt.executeQuery();
int id=0;
while(rs.next())
{
	id=rs.getInt("id");
}

int id1=0;
int flag=0;
PreparedStatement ps1=con.prepareStatement("select p_id from patient_history where p_id=?");
ps1.setInt(1,id);
ResultSet rs2=ps1.executeQuery();
while(rs2.next())
{
	id1=rs2.getInt("p_id");
}
if(id==id1){
PreparedStatement ps=con.prepareStatement("select * from patient_history where p_id=?");
ps.setInt(1,id);
ResultSet rs1=ps.executeQuery();
while(rs1.next()){
	
%>
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
    height: 70vh;
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

   body
    {
     background-image:url("clinic_bg.jpg");
        background-size:cover;
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
    <form action="./UpdateHistory3.jsp" method="post">
      <h1>Your Medical History</h1>

      <div class="input-group">
        <label>Patient id: </label>
        <input type="text"  name="p_id" value="<%=rs1.getInt("p_id") %>" readonly>
        <span id="name-error"></span>
      </div>
      
      <div class="input-group">
        <label>Blood Pressure: </label>
        <input type="text" value="<%=rs1.getInt("bp") %>"  readonly>
        <span id="name-error"></span>
      </div>

<div class="input-group">
        <label>Diabetes : </label>
        <input type="text" value="<%=rs1.getString("diabetes") %>"  readonly>
        <span id="name-error"></span>
      </div>
     
	
<div class="input-group">
        <label>Heart Disease : </label>
        <input type="text" value="<%=rs1.getString("heart_problem") %>"  readonly>
        <span id="name-error"></span>
      </div>
     <div class="input-group">
        <label>Any drug allergies : </label>
        <input type="text" value="<%=rs1.getString("drug_allergies") %>"  readonly>
        <span id="name-error"></span>
      </div>
           <center>
        
    </center>

  </form>
  </div>
<%
}
}
else
{
	%>
	<h1>Sorry you have not updated history yet</h1>
	<% 
}
}
catch(Exception e)
{
	e.printStackTrace();
}


%>
<center>
<button class="back-btn"><a href="PatientMenu.jsp">Back</a></button>
</center>
</body>

</html>