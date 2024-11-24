import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
@WebServlet("/GivePresc3")
public class GivePresc3 extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String todaysdate=req.getParameter("todaysdate");
	Date td=Date.valueOf(todaysdate);
	String pid=req.getParameter("pid");
	String name=req.getParameter("name");
	String age=req.getParameter("age");
	String gender=req.getParameter("gender");
	String weight=req.getParameter("weight");
	String symptoms=req.getParameter("symptoms");
	String medicine=req.getParameter("medicine");
	String fdate=req.getParameter("fdate");
	HttpSession session4=req.getSession();
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loaded in Appointment page");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
		System.out.println("Connection success in Appointment page");
		PreparedStatement pstmt=con.prepareStatement("insert into presc2(today_date,p_email,name,age,gender,weight,symptoms,medicine,followupdate) values(?,?,?,?,?,?,?,?,?);");
		pstmt.setDate(1,td);
		pstmt.setString(2,pid);
		pstmt.setString(3,name);
		pstmt.setString(4,age);
		pstmt.setString(5,gender);
		pstmt.setString(6,weight);
		pstmt.setString(7,symptoms);
		pstmt.setString(8,medicine);
		pstmt.setString(9,fdate);
		int i=pstmt.executeUpdate();
		if(i!=0)
		{
			System.out.println("Record inserted successfully ! ..........");
			session4.setAttribute("name", name);
			session4.setAttribute("age", age);
			session4.setAttribute("gender", gender);
			session4.setAttribute("pid", pid);
			session4.setAttribute("dt", todaysdate);
			session4.setAttribute("weight", weight);
			session4.setAttribute("symptoms", symptoms);
			session4.setAttribute("medicine", medicine);
			session4.setAttribute("fdate", fdate);
			resp.sendRedirect("Presc3.jsp");
		}
		else
		{
			System.out.println("Error in inserting");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
}
}
