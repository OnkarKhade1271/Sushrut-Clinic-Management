<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int medicine_id=Integer.parseInt(request.getParameter("medicine_id"));
String name=request.getParameter("name");
String selectReason=request.getParameter("selectReason");
int quantity=Integer.parseInt(request.getParameter("quantity"));
 try
 {
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loaded in give medicines page");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SushrutClinic","root","root");
		System.out.println("Connection success in give medicines page");
		PreparedStatement pstmt=con.prepareStatement("select medicine_id from medicines where medicine_id=?");
		pstmt.setInt(1,medicine_id);
		ResultSet rs=pstmt.executeQuery();
		int id=0;
		int flag=0;
		while(rs.next())
		{
			id=rs.getInt("medicine_id");
			if(id==medicine_id)
			{
				flag=1;
				break;
			}
		}
			if(flag==1)
			{
				PreparedStatement ps2=con.prepareStatement("select medicine_quantity from medicines where medicine_id=?");
				ps2.setInt(1,medicine_id);
				ResultSet r1=ps2.executeQuery();
				int qty=0;
				int flag1=0;
				while(r1.next())
				{
					qty=r1.getInt("medicine_quantity");
				}
				if(qty<quantity)
				{
					%>
					<script>
					alert("Sorry you do not have this much stock left ...");
					</script>
					<% 
				}
				else
				{
					PreparedStatement ps3=con.prepareStatement("insert into medicine_stock(medicine_id,name,reason,quantity) values(?,?,?,?)");
					ps3.setInt(1,medicine_id);
					ps3.setString(2,name);
					ps3.setString(3,selectReason);
					ps3.setInt(4,quantity);
					int i1=ps3.executeUpdate();
					int original_qty=qty-quantity;
					PreparedStatement ps4=con.prepareStatement("update medicines set medicine_quantity=? where medicine_id=? ");
					ps4.setInt(1,original_qty);
					ps4.setInt(2,medicine_id);
					int i2=ps4.executeUpdate();
					if(i1!=0 && i2!=0)
					{
						%>
						<script>
						alert("Successful");
						</script>
						<% 
					}
					else
					{
						System.out.println("Error after insert and update");
					}
				}
			}
			else
			{
				%>
				<script>
						alert("Wrong id ");
						</script>
				<% 
			}
		
 }
 catch(Exception e)
 {
	 e.printStackTrace();
 }


%>
</body>
</html>