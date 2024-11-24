import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String p_name=req.getParameter("p_name");
	String p_email=req.getParameter("p_email");
	String p_phone=req.getParameter("p_phone");
	String p_password=req.getParameter("password");
	String p_gender=req.getParameter("Gender");
	String p_dob=req.getParameter("dob");
	String p_age=req.getParameter("age");
	String p_address=req.getParameter("address");
	Date dtd=Date.valueOf(p_dob);
	System.out.println("Hii");
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loaded in PatientReg page");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
		System.out.println("Connection success in PatientReg page");
		PreparedStatement pstmt=con.prepareStatement("insert into patient(p_name,p_email,p_phone,p_password,p_gender,p_dob,p_age,p_address) values(?,?,?,?,?,?,?,?);");
		pstmt.setString(1,p_name);
		pstmt.setString(2,p_email);
		pstmt.setString(3,p_phone);
		pstmt.setString(4,p_password);
		pstmt.setString(5,p_gender);
		pstmt.setDate(6,dtd);
		pstmt.setString(7,p_age);
		pstmt.setString(8,p_address);
		//pstmt.setDate(6,java.sql.Date.valueOf("2024-03-19"));
		int i=pstmt.executeUpdate();
		if(i!=0)
		{
			System.out.println("Record Inserted");
			resp.sendRedirect("Login.jsp");
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
