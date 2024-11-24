import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/OffPatRegisterServlet")
public class OffPatRegisterServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	 LocalDate currentDate = LocalDate.now();
     LocalTime currentTime = LocalTime.now();

     // Define date and time formatters if needed
     DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
     DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

     // Format the current date and time components according to the defined formats
     String formattedDate = currentDate.format(dateFormatter);
     String formattedTime = currentTime.format(timeFormatter);
Date dt=Date.valueOf(formattedDate);
System.out.println(dt);
     // Print the formatted date and time components
     System.out.println("Current Date: " + formattedDate);
     System.out.println("Current Time: " + formattedTime);
	String p_name=req.getParameter("p_name");
	String p_email=req.getParameter("p_email");
	String p_phone=req.getParameter("p_phone");
	String p_gender=req.getParameter("Gender");
	String p_age=req.getParameter("age");
	String p_address=req.getParameter("address");
	String my_date=formattedDate;
	Date todays_date=Date.valueOf(my_date);
	String entry_time=formattedTime;
	System.out.println("Hii");
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loaded in PatientReg page");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
		System.out.println("Connection success in PatientReg page");
		PreparedStatement pstmt=con.prepareStatement("insert into offline_patients(op_name,email,phone,gender,age,address,todays_date,entry_time) values(?,?,?,?,?,?,?,?);");
		pstmt.setString(1,p_name);
		pstmt.setString(2,p_email);
		pstmt.setString(3,p_phone);
		pstmt.setString(4,p_gender);
		pstmt.setString(5,p_age);
		pstmt.setString(6,p_address);
		pstmt.setDate(7,todays_date);
		pstmt.setString(8,entry_time);
		//pstmt.setDate(6,java.sql.Date.valueOf("2024-03-19"));
		int i=pstmt.executeUpdate();
		if(i!=0)
		{
			System.out.println("Record Inserted");
			resp.sendRedirect("MenuAtt.jsp");
		}
		else
		{
			System.out.println("Error");
			resp.sendRedirect("Error.jsp");
		}
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
}
