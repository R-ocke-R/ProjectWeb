<%@ page import="java.sql.*" %>

<%
Connection con=null;
ResultSet rs=null;
Statement st=null;


String stu_id=(String)request.getParameter("student_id");
String cashier=(String)session.getAttribute("cashier");


try{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school_fees", "root", "root");
st=con.createStatement();
String query="Select * from student_details where Student_ID='"+stu_id+"'";
rs= st.executeQuery(query);

if(rs.next())
{
session.setAttribute("stu_id", stu_id);
response.sendRedirect("Final_Landing.jsp");
}
else
{
response.sendRedirect("error_wrong_stu_id.jsp");
}


}//End of try
catch(Exception e)
{
out.println(e);
}
%>