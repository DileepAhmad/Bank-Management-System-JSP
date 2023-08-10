<%@ page import="java.sql.*" %>
<%
long account_no=Long.parseLong(request.getParameter("acno"));
String name=request.getParameter("uname");
String password=request.getParameter("psw");
double amount=Double.parseDouble(request.getParameter("amt"));
long tacno=Long.parseLong(request.getParameter("tacno"));
double amt=0;
double amt1=0;
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
	if(amount<amt){
		PreparedStatement ps1=con.prepareStatement("update sdfc set amount=amount-? where account_no=? and name=? and password=?");
		ps1.setDouble(1,amount);
		ps1.setLong(2,account_no);
		ps1.setString(3,name);
		ps1.setString(4,password);
		int i=ps1.executeUpdate();
		out.print("Your Account Debited By "+amount+"<br>");
		out.print("Your Total Balance Is "+(amt-amount)+"<br>");
		PreparedStatement ps2=con.prepareStatement("select amount from sdfc where account_no=?");
		ps2.setLong(1,tacno);
		ResultSet rs1=ps2.executeQuery();
		if(rs1.next()){
			amt1=new Double(rs1.getString(1));
		}
		PreparedStatement ps3=con.prepareStatement("update sdfc set amount=amount+? where account_no=?");
		ps3.setDouble(1,amount);
		ps3.setLong(2,tacno);
		int j=ps3.executeUpdate();
		out.print("Target Account Credited By "+amount+"<br>");
		out.print("Final Target Account Balance Is "+(amount+amt1)+"<br>");
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