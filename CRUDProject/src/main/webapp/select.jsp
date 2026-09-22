<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.text.*,sl314.myclasses.*,java.sql.*"
	isELIgnored="false"%>

<%@ taglib uri="jakarta.tags.sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

table 
{
width:80%;
border:1px solid red;
margin:auto;

}
h1{
padding-left: 150px;
}
th,td 
{
width:13.3%;
border:1px solid red;
text-align:center;
background-color: yellow;

}

.back {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 10px;
        }

        .button {
            padding: 10px;
            background-color: grey;
            border-radius: 10px;
            border: 1px solid black;
        }
</style>
</head>
<body>

	<h1>The Followings are the list of Employees:</h1>

	<%
	Data d = (Data)application.getAttribute("data");
	ResultSet rs = d.rs;
	%>

	<table>
		<tr>
			<th>ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Phone Number</th>
			<th>Join Date</th>
			<th>Department</th>
		</tr>


		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getInt(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getDate(6)%></td>
			<td><%=rs.getInt(7)%></td>
		</tr>
		<%
		}
		%>


	</table>
	
	<div class="back">

        <button class="button" onclick="history.back();">
            Back
        </button>

    </div>

</body>
</html>