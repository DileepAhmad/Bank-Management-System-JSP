<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
body{
padding-top:10px;}
.navbar a{
text-decoration: none;
background-color:#16A085;
color:white;
font-size:20px;
padding:10px;
}
img{
width:600px;

}
div{
border-radius:10px;
background-color:#85C1E9 ;
width:40%;
}
td{
padding:5px;}
</style>
<center>
<nav class="navbar">
<a href="Home.jsp">Home</a>&nbsp
<a href="NewAccount.jsp">New Account</a>&nbsp
<a href="Balance.jsp">Balance</a>&nbsp
<a href="Deposit.jsp">Deposit</a>&nbsp
<a href="Withdraw.jsp">Withdraw</a>&nbsp
<a href="Transfer.jsp">Transfer</a>&nbsp
<a href="Close.jsp">Close</a>&nbsp
<a href="Aboutus.jsp">AboutUs</a>&nbsp
</nav><br>
<img src="bank.jpg">
<form action="WithdrawCode.jsp" method="post">
<div><h1>WITHDRAW FORM</h1></div>
<table>
<tr>
<td>Account No:</td>
<td><input type="number" name="acno"></td>
</tr>
<tr>
<td>Name:</td>
<td><input type="text" name="uname"></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="password" name="psw"></td>
</tr>
<tr>
<td>Amount</td>
<td><input type="number" name="amt"></td>
</tr>
<tr>
<td><input type="submit" value="Submit"></td>
<td><input type="reset" value="clear"></td>
</tr>

</table>
</form>
</center>
</body>
</html>