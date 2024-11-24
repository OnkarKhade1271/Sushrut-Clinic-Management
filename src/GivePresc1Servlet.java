import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.sql.*;
@WebServlet("/GivePresc1Servlet")
public class GivePresc1Servlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	int pid=Integer.parseInt(req.getParameter("pid"));
	HttpSession session2=req.getSession();
	 LocalDate currentDate = LocalDate.now();
     DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
     String formattedDate = currentDate.format(dateFormatter);
     Date dt=Date.valueOf(formattedDate);
System.out.println(dt);
	try
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loaded in givepresc1servlet");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection Success in givepresc1servlet !......");
	PreparedStatement ps=con.prepareStatement("select id from patient where id=?");
	ps.setInt(1,pid);
	ResultSet rs=ps.executeQuery();
	int id=0;
	int flag=0;
	while(rs.next())
	{
		if(pid==rs.getInt("id"))
		{
			id=pid;
			flag=1;
			break;
		}
	}
	if(flag==1)
	{
		PreparedStatement ps2=con.prepareStatement("select * from patient where id=?");
		ps2.setInt(1,pid);
		ResultSet rs1=ps2.executeQuery();
		String name=null;
		String age=null;
		String gender=null;
		while(rs1.next())
		{
			name=rs1.getString("p_name");
			age=rs1.getString("p_age");
			gender=rs1.getString("p_gender");
		}
		session2.setAttribute("name", name);
		session2.setAttribute("age", age);
		session2.setAttribute("gender", gender);
		session2.setAttribute("pid", pid);
		session2.setAttribute("dt", formattedDate);
		resp.sendRedirect("Presc1.jsp");
	}
	else
	{
		resp.sendRedirect("ErrorPatientid.jsp");
	}
	con.close();
	}
	catch(Exception e)
	{
	e.printStackTrace();	
	}

}
}
