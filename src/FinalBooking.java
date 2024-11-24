import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.sql.*;
@WebServlet("/FinalBooking")
public class FinalBooking extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String p_name=req.getParameter("p_name");
	int p_id=Integer.parseInt(req.getParameter("p_id"));
	String p_email=req.getParameter("p_email");
	String a_date=req.getParameter("a_date");
	Date dm=Date.valueOf(a_date);
	String a_time=req.getParameter("a_time");
	try
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loaded in FinalBooking page");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection success in FinalBooking page");
	PreparedStatement pstmt=con.prepareStatement("insert into appointment(p_id,p_name,p_email,a_date,a_time) values(?,?,?,?,?);");
	pstmt.setInt(1,p_id);
	pstmt.setString(2, p_name);
	pstmt.setString(3, p_email);
	pstmt.setDate(4, dm);
	pstmt.setString(5,a_time);
	int i=pstmt.executeUpdate();
	if(i!=0)
	{
		System.out.println("Record Inserted");
		resp.sendRedirect("MyAppointments.jsp");
	}
	else
	{
		System.out.println("Error");
		//resp.sendRedirect("Error.jsp");
	}

	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
}
