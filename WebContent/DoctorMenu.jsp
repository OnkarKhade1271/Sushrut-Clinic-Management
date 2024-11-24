<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Sushrut Clinic</title>

    <!-- <link rel="stylesheet" href="style1.css"> -->
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration: none;
    border: none;
    outline: none;
    font-family: 'Poppins', sans-serif;
}

:root {
    --bg-color: #1f242d;
    --second-bg-color: #323946;
    --text-color: #fff;
    --main-color: #0ef;
}

html {
    font-size: 62.5%;
    overflow-x: hidden;
    scroll-behavior: smooth;
    scroll-padding: 5rem;
}

body {
    background-image: url(Hospital_bgg.png);
    background-repeat: no-repeat;
    background-position: center;
    background-size: 2500px 1100px;
}

.header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    padding: 2rem 9%;
    background: var(--bg-color);
    display: flex;
    justify-content: space-between;
    align-items: center;
    z-index: 100;
}

.header.sticky {
    border-bottom: 0.1rem solid rgba(0, 0, 0, 0.2);
}

.logo {
    font-size: 2.5rem;
    color: var(--text-color);
    font-weight: 600;
    cursor: default;
}

.navbar a {
    font-size: 1.7rem;
    color: var(--text-color);
    margin-left: 4rem;
    transition: 0.3s;
}

.navbar a:hover,
.navbar a.active {
    color: var(--main-color);
}

#menu-icon {
    font-size: 3.6rem;
    color: var(--text-color);
    display: none;
}

.title {
    font-size: medium;
    color: red;
}

.title-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 70px;
    height: 70px;
    position: relative;
}

.title-container h2 {
    display: flex;
    justify-content: center;
    align-items: center;
    
    position: relative;
    font-weight: 700;
    font-size: 50px;
}



.grid-item a{
    background-color: #04AA6D;
    border: none;
    padding: 15px 25px;
    text-align: center;
    text-decoration: none;
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 10px;
    margin-left: 25px;
    margin-right: 25px;
  }

  .grid-item {
    text-align: center;
    padding: 10px;
    color: white;
    font-size: 16px;
font-weight: 700;
  }

  .grid-item a {
    text-decoration: none;
    color: inherit;
    display: block;
  }
</style>

<body>
    
        <div class="title-container">
            <h2>Sushrut Clinic </h2><br>
            <br>
            <br>
        </div>
 <div class="title-container">
 <h2>Welcome Dr Milind</h2><br>
 <br>
 </div>
        <div class="grid-container">
            <div class="grid-item" ><a href="ViewAppointmentsDoctor.jsp">View Appointments</a></div>
            <div class="grid-item" ><a href="AddPatientHistory.jsp">Add Patient History</a></div>
            <div class="grid-item" ><a href="UpdatePatientHistory.jsp">Update Patient History</a></div>
             <div class="grid-item" ><a href="ViewReportsDoctor.jsp">View Reports</a></div>
            <div class="grid-item" ><a href="GivePrescription1.jsp">Give Prescription</a></div>
            <div class="grid-item" ><a href="GivePrescription2.jsp">Give Prescription(For non registered patients)</a></div>
            <div class="grid-item" ><a href="ViewFeedBackDoctor.jsp">View Feedback</a></div>
            <div class="grid-item" ><a href="TakeLeave.jsp">Take a leave</a></div>
            <div class="grid-item" ><a href="DoctorLogout.jsp">Logout</a></div>
          </div>


</body>

</html>