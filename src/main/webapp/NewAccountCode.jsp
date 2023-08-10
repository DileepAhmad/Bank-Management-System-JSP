<%@ page import="java.sql.*" %>
<%
long account_no=Long.parseLong(request.getParameter("acno"));
String name=request.getParameter("uname");
String password=request.getParameter("psw");
String cpassword=request.getParameter("cpsw");
double amount=Double.parseDouble(request.getParameter("amt"));
String address=request.getParameter("addr");
long mobile_no=Long.parseLong(request.getParameter("mno"));
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","qdb","qdb");
	PreparedStatement ps=con.prepareStatement("insert into sdfc values(?,?,?,?,?,?)");
	ps.setLong(1,account_no);
	ps.setString(2,name);
	ps.setString(3,password);
	ps.setDouble(4,amount);
	ps.setString(5,address);
	ps.setLong(6,mobile_no);
	if(cpassword.equals(password)){
		int i=ps.executeUpdate();
		out.print(i+"New Account Created");
	}
	else{
		out.print("Passwords are not matching");
	}
	con.close();
}
catch(Exception ex){
	out.print(ex);
}







%>