import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/InsertTakeLeave")
public class InsertTakeLeave extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String date=req.getParameter("l_date");
	String reason=req.getParameter("reason");
	Date l_date=Date.valueOf(date);
	int d_id=1;
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loaded in update history1 page");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
		System.out.println("Connection success in update history1 page");
		PreparedStatement pstmt=con.prepareStatement("insert into takeleave(d_id,l_date,leave_reason) values(?,?,?)");
		pstmt.setInt(1,d_id);
		pstmt.setDate(2, l_date);
		pstmt.setString(3, reason);
		int i=pstmt.executeUpdate();
		if(i!=0)
		{
			resp.sendRedirect("DoctorMenu.jsp");
		}
	}
	catch(Exception e)
	{
		
	}
}
}
