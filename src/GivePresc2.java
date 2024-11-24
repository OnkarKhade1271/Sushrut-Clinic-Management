import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
@WebServlet("/GivePresc2")
public class GivePresc2 extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String todaysdate=req.getParameter("todaysdate");
	Date td=Date.valueOf(todaysdate);
	int pid=Integer.parseInt(req.getParameter("pid"));
	String name=req.getParameter("name");
	String age=req.getParameter("age");
	String gender=req.getParameter("gender");
	String weight=req.getParameter("weight");
	String symptoms=req.getParameter("symptoms");
	String medicine=req.getParameter("medicine");
	String fdate=req.getParameter("fdate");
	HttpSession session3=req.getSession();
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loaded in Appointment page");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
		System.out.println("Connection success in Appointment page");
		PreparedStatement pstmt=con.prepareStatement("insert into prescription(today_date,p_id,name,age,gender,weight,symptoms,medicine,followupdate) values(?,?,?,?,?,?,?,?,?);");
		pstmt.setDate(1,td);
		pstmt.setInt(2,pid);
		pstmt.setString(3,name);
		pstmt.setString(4,age);
		pstmt.setString(5,gender);
		pstmt.setString(6,weight);
		pstmt.setString(7,symptoms);
		pstmt.setString(8,medicine);
		pstmt.setString(9,fdate);
		//pstmt.setDate(6,java.sql.Date.valueOf("2024-03-19"));
		int i=pstmt.executeUpdate();
		if(i!=0)
		{
			System.out.println("Record inserted successfully ! ..........");
			session3.setAttribute("name", name);
			session3.setAttribute("age", age);
			session3.setAttribute("gender", gender);
			session3.setAttribute("pid", pid);
			session3.setAttribute("dt", todaysdate);
			session3.setAttribute("weight", weight);
			session3.setAttribute("symptoms", symptoms);
			session3.setAttribute("medicine", medicine);
			session3.setAttribute("fdate", fdate);
			resp.sendRedirect("Presc2.jsp");
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
