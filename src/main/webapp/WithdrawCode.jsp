<%@ page import="java.sql.*" %>
<%
long account_no=Long.parseLong(request.getParameter("acno"));
String name=request.getParameter("uname");
String password=request.getParameter("psw");
double amount=Double.parseDouble(request.getParameter("amt"));
double amt=0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","qdb","qdb");
	PreparedStatement ps=con.prepareStatement("select amount from sdfc where account_no=? and name=? and password=?");
	ps.setLong(1,account_no);
	ps.setString(2,name);
	ps.setString(3,password);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		amt=new Double(rs.getString(1));
	}
	if(amt>amount){
		PreparedStatement ps1=con.prepareStatement("update sdfc set amount=amount-? where account_no=? and name=? and password=?");
		ps1.setDouble(1,amount);
		ps1.setLong(2,account_no);
		ps1.setString(3,name);
		ps1.setString(4,password);
		int i=ps1.executeUpdate();
		out.print("The Original Balance Is "+amt+"<br>");
		out.print("Debited Amount Is "+amount+"<br>");
		out.print("The Total Balance Is "+(amt-amount)+"<br>");
	}
	else{
		out.print("Insufficient Blance");
	}
	con.close();
}
catch(Exception ex){
	out.print(ex);
}







%>