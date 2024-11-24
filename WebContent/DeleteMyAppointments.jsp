<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>

 <%
    
  
    	
    	int app_id=Integer.parseInt(request.getParameter("id"));
    	Connection con;
    	PreparedStatement psmt;
    	ResultSet rs;
    	Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
		PreparedStatement pstmt=con.prepareStatement("delete from appointment where a_id=?");
		pstmt.setInt(1,app_id);
		pstmt.executeUpdate();
		
		%>
		
		<script>
		
		
		alert("Record Deleted  ");
		<%
		response.sendRedirect("PatientMenu.jsp");
		%>
		
		</script>
		
		


  