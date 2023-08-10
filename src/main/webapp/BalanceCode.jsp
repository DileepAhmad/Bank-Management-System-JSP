<%@ page import="java.sql.*" %>
<%
long account_no=Long.parseLong(request.getParameter("acno"));
String name=request.getParameter("uname");
String password=request.getParameter("psw");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","qdb","qdb");
	PreparedStatement ps=con.prepareStatement("select * from sdfc where account_no=? and name=? and password=?");
	ps.setLong(1,account_no);
	ps.setString(2,name);
	ps.setString(3,password);
	ResultSet rs=ps.executeQuery();
	ResultSetMetaData rsmd=rs.getMetaData();
	out.print("<html><body><table border='1'>");
	int n=rsmd.getColumnCount();
	for(int i=1;i<=n;i++){
		out.print("<td><font color=red size=3>"+"<br>"+rsmd.getColumnName(i));
	}
	out.print("<tr>");
	while(rs.next()){
		for(int i=1;i<=n;i++){
			out.print("<td><br>"+rs.getString(i));
		}
		out.print("<tr>");
	}
	out.print("</table></body></html>");
	con.close();
}
catch(Exception ex){
	out.print(ex);
}







%>