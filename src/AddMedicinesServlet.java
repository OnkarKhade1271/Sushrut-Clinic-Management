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
@WebServlet("/AddMedicinesServlet")
public class AddMedicinesServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	 LocalDate currentDate = LocalDate.now();
     // Define date and time formatters if needed
     DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
         // Format the current date and time components according to the defined formats
     String formattedDate = currentDate.format(dateFormatter);
     
     Date dt=Date.valueOf(formattedDate);
     System.out.println(dt);
	String medicine_name=req.getParameter("medicine_name");
	int quantity=Integer.parseInt(req.getParameter("quantity"));
	int price=Integer.parseInt(req.getParameter("price"));
	String mfgdate=req.getParameter("mfg_date");
	Date mfg_date=Date.valueOf(mfgdate);
	String best_before=req.getParameter("best_before");
	String desc=req.getParameter("desc");
	int d_id=1;
	System.out.println("Hii");
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loaded in PatientReg page");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
		System.out.println("Connection success in PatientReg page");
		PreparedStatement pstmt=con.prepareStatement("insert into medicines(d_id,medicine_name,medicine_quantity,medicine_price,mfg_date,best_before,medicine_description,Last_updated_on) values(?,?,?,?,?,?,?,?);");
		pstmt.setInt(1,d_id);
		pstmt.setString(2,medicine_name);
		pstmt.setInt(3,quantity);
		pstmt.setInt(4,price);
		pstmt.setDate(5, mfg_date);
		pstmt.setString(6, best_before);
		pstmt.setString(7,desc);
		pstmt.setDate(8,dt);
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
