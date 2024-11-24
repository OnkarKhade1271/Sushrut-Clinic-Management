import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
int p_id=Integer.parseInt(req.getParameter("p_id"));
System.out.println("My Appointment");
System.out.println(p_id);
String a_time=req.getParameter("a_time");
System.out.println(a_time);
String a_date=req.getParameter("a_date");
System.out.println(a_date);
Date d1=Date.valueOf(a_date);
System.out.println("date "+d1);
HttpSession session1=req.getSession();
String p_name=(String)session1.getAttribute("username");
System.out.println(p_name);
String p_email=(String)session1.getAttribute("useremail");
System.out.println(p_email);
HttpSession s1=req.getSession();

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loaded in Appointment page");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection success in Appointment page");
	PreparedStatement ps1=con.prepareStatement("select * from takeleave");
	ResultSet rs1;
	int flag=1;
	Date dt1=null;
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
		dt1=rs1.getDate("l_date");
		if(dt1.equals(d1))
		{
			flag=0;
			break;
		}
	}
	if(flag==0)
	{
		resp.sendRedirect("NonAvailable.jsp");
	}
	else
	{
		//System.out.println("Hii");
		PreparedStatement ps2=con.prepareStatement("select count(*) from appointment where p_email=? and a_date=?");
		ps2.setString(1,p_email);
		ps2.setDate(2, d1);
		ResultSet rs2;
		rs2=ps2.executeQuery();
		int cnt=0;
		while(rs2.next())
		{
			cnt=rs2.getInt(1);
		}
		System.out.println(cnt);
		if(cnt!=0)
		{
			resp.sendRedirect("DuplicateBooking.jsp");
		}
		else
		{
		ResultSet rs4;
		PreparedStatement ps4=con.prepareStatement("select count(*) from appointment where a_time=? and a_date=?");
		ps4.setString(1, a_time);
		ps4.setDate(2, d1);
		rs4=ps4.executeQuery();
		int count=0;
		while(rs4.next())
		{
			count=rs4.getInt(1);
		}
		System.out.println(count);
		int slots_available=3-count;
		System.out.println(" slots : "+slots_available);
		if(slots_available==0)
		{
			resp.sendRedirect("ZeroSlots.jsp");
		}
		else
		{
			s1.setAttribute("udid", p_id);
			s1.setAttribute("udate123", a_date);
			s1.setAttribute("utime",a_time);
			s1.setAttribute("sa",slots_available);
			resp.sendRedirect("booking.jsp");
		}
		}
		
	}
	
	
}
catch(Exception e)
{
	
}
}
}
