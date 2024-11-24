import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String name=(String)session.getAttribute("username");
        //System.out.println(name);
		HttpSession session=req.getSession();
        String email=(String)session.getAttribute("useremail");
        System.out.println(email);
    	//int id=Integer.parseInt(request.getParameter("id"));
    	String newname=req.getParameter("p_name");
    	String newemail=req.getParameter("p_email");
    	String newphone=req.getParameter("p_phone");
    	String newdob=req.getParameter("dob");
    	String newage=req.getParameter("age");
    	String newaddress=req.getParameter("address");
    	Date dtd=Date.valueOf(newdob);
    	
    	try
    	{
    		Connection con;
    	
    	PreparedStatement psmt;
    	ResultSet rs1;
    	Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
		PreparedStatement pstmt=con.prepareStatement("update patient set p_name=?,p_phone=?,p_dob=?,p_age=?,p_address=? where p_email=?");
		pstmt.setString(1, newname);
		pstmt.setString(2, newphone);
		pstmt.setDate(3,dtd);
		pstmt.setString(4,newage);
		pstmt.setString(5,newaddress);
		pstmt.setString(6,email);
		int i=pstmt.executeUpdate();
		if(i!=0){
		{
		resp.sendRedirect("PatientMenu.jsp");
		}
    }
	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}

}
}
