<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sushrut Clinic</title>
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
    .btn {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    .btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="MedicalLogo.png" alt="Logo" class="logo">
        <h2>Sushrut Clinic</h2>
    </div>
    <form method="post" action="./GivePresc3">
    <div class="form-group">
            <label for="Todays date">Today's Date:</label>
            <input type="date" id="todaysdate" name="todaysdate" required>
        </div>
        <div class="form-group">
            <label for="patientId">Patient Email ID:</label>
            <input type="email"   id="patientId" name="pid" required>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name"  name="name" required>
        </div>
        <div class="form-group">
            <label for="age">Age:</label>
            <input type="number" id="age"  name="age" required>
        </div>
        <div class="form-group">
            <label for="sex">Gender:</label>
            <select  name="gender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label for="weight">Weight:</label>
            <input type="number" id="weight" min="20" max="200" name="weight" required>
        </div>
        <div class="form-group">
            <label for="symptoms">Symptoms:</label>
            <textarea id="symptoms" rows="15" cols="50" name="symptoms" required></textarea>
        </div>
        <div class="form-group">
            <label for="medicine">Medicine:</label>
            <textarea rows="15" cols="50" id="medicine" name="medicine" required></textarea>
        </div>
        <div class="form-group">
            <label for="followUpDate">Follow-up Date:</label>
            <input type="text" id="followUpDate" name="fdate" required>
        </div>
        <button type="submit" class="btn">Next</button>
    </form>
</div>
</body>
</html>
