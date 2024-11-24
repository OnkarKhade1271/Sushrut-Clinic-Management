import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String email=req.getParameter("email");
	String pass=req.getParameter("pass");
	String dob=req.getParameter("dob");
	Date dtd=Date.valueOf(dob);
	try
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loaded");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection Success !......");
	PreparedStatement ps=con.prepareStatement("select p_dob,p_email from patient where p_dob=? and p_email=?");
	ps.setDate(1,dtd);
	ps.setString(2,email);
	ResultSet rs=ps.executeQuery();

	String e=null;
	Date d =null;
	while(rs.next())
	{
		d=rs.getDate(1);
		e=rs.getString(2);
		
	}
	if(e.equals(email)&& d.equals(dtd))
	{
	System.out.println("Login Successfull");
	PreparedStatement ps2=con.prepareStatement("update patient set p_password=? where p_dob=? and p_email=?");
	ps2.setString(1, pass);
	ps2.setDate(2, dtd);
	ps2.setString(3, email);
	int i1=ps2.executeUpdate();
	if(i1!=0)
	{
		System.out.println("Record Updated");
		resp.sendRedirect("Login.jsp");
	}
	else
	{
		System.out.println("Error in updation");
		resp.sendRedirect("Error.jsp");
	}
	//resp.sendRedirect("Login.jsp");
	}
	else
	{
		
		System.out.println("Wrong date of birth or email ");
		
	}
	con.close();
	}
	catch(Exception e)
	{
	System.out.println("Error occured");	
	}


}
}
