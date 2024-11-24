import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserFeedBack")
public class UserFeedBack extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	HttpSession session=req.getSession();
	String name=(String)session.getAttribute("username");
    System.out.println(name);
    String email=(String)session.getAttribute("useremail");
    System.out.println(email);
    String feedback=req.getParameter("feedback");
    String rating=req.getParameter("rating");
    try
	{
	Connection con;
	PreparedStatement psmt;
	ResultSet rs1;
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection Successful");
	PreparedStatement pstmt=con.prepareStatement("select id from patient where p_email=?");
	pstmt.setString(1, email);
	rs1=pstmt.executeQuery();
	int id=0;
	while(rs1.next())
	{
		id=rs1.getInt(1);
	}
	System.out.println(id);
	if(id!=0 )
	{
		PreparedStatement pstmt2=con.prepareStatement("insert into feedback(p_id,name,email,f_rating,feedback) values(?,?,?,?,?)");
		pstmt2.setInt(1,id);
		pstmt2.setString(2, name);
		pstmt2.setString(3,email);
		pstmt2.setString(4, rating);
		pstmt2.setString(5,feedback);
		int i=pstmt2.executeUpdate();
		if(i!=0){
		{
		resp.sendRedirect("PatientMenu.jsp");
		}
		
	}
	
}
}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
}
