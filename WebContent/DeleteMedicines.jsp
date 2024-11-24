<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%
    
	int id=Integer.parseInt(request.getParameter("medicine_id"));
    try
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Loaded in medicines page");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
	System.out.println("Connection success in My manage medicines page");
	PreparedStatement pstmt=con.prepareStatement("delete from medicines where medicine_id=? ");
	pstmt.setInt(1,id);
		int i=pstmt.executeUpdate();
			if(i!=0)
			{
				//System.out.println("Record Updated");
				%>
				<script>
				alert("Record Deleted Successfully")
				</script>
				<%
				response.sendRedirect("ManageMedicineInventory.jsp");
				
			}
			else
			{
				System.out.println("Error");
				response.sendRedirect("Error.jsp");
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		%>