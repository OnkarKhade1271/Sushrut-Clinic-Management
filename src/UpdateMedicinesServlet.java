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

@WebServlet("/UpdateMedicinesServlet")
public class UpdateMedicinesServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int medicine_id=Integer.parseInt(req.getParameter("medicine_id"));
		String medicine_name=req.getParameter("medicine_name");
		int quantity=Integer.parseInt(req.getParameter("quantity"));
		int price=Integer.parseInt(req.getParameter("price"));
		String mfg_dt=req.getParameter("mfg_date");
		Date mfg_date=Date.valueOf(mfg_dt);
		String best_before=req.getParameter("best_before");
		String desc=req.getParameter("desc");
		 LocalDate currentDate = LocalDate.now();
	     // Define date and time formatters if needed
	     DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	         // Format the current date and time components according to the defined formats
	     String formattedDate = currentDate.format(dateFormatter);
	     
	     Date dt=Date.valueOf(formattedDate);
	     System.out.println(dt);
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in PatientReg page");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
			System.out.println("Connection success in PatientReg page");
			PreparedStatement pstmt=con.prepareStatement("update medicines set medicine_name=?,medicine_quantity=?,medicine_price=?,mfg_date=?,best_before=?,medicine_description=?,last_updated_on=? where medicine_id=?;");
			pstmt.setString(1,medicine_name);
			pstmt.setInt(2,quantity);
			pstmt.setInt(3,price);
			pstmt.setDate(4, mfg_date);
			pstmt.setString(5, best_before);
			pstmt.setString(6,desc);
			pstmt.setDate(7, dt);
			pstmt.setInt(8, medicine_id);
			int i=pstmt.executeUpdate();
			if(i!=0)
			{
				System.out.println("Record Updated");
				resp.sendRedirect("ManageMedicineInventory.jsp");
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
