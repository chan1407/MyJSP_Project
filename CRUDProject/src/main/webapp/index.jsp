<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%@ taglib prefix="sql" uri="jakarta.tags.sql"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Employee CRUD</title>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	padding: 30px;
}

h1 {
	text-align: center;
}

form {
	width: 700px;
	margin: 25px auto;
}

fieldset {
	background-color: white;
	border: 1px solid #bbb;
	border-radius: 6px;
	padding: 25px;
}

legend {
	font-size: 20px;
	font-weight: bold;
	padding: 5px 10px;
}

table {
	width: 100%;
}

td {
	padding: 8px;
}

td:first-child {
	width: 180px;
	font-weight: bold;
}

input[type="text"], input[type="number"], input[type="datetime-local"],
	select {
	width: 300px;
	padding: 7px;
}

input[type="checkbox"] {
	margin-right: 8px;
}

input[type="submit"] {
	padding: 8px 20px;
	cursor: pointer;
	border-radius: 10px;
	background-color: grey;
}


</style>

</head>


<body>

	<h1>Employee CRUD Operations</h1>




	<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/javaschema" user="root"
		password="tiger" />


	<sql:query dataSource="${myDB}" var="ids">

        SELECT id FROM employees

    </sql:query>




	<form action="insert.jsp" method="GET">

		<fieldset>

			<legend>1. Insert Employee</legend>

			<table>

				<tr>
					<td>First Name:</td>
					<td><input type="text" name="firstName"></td>
				</tr>

				<tr>
					<td>Last Name:</td>
					<td><input type="text" name="lastName"></td>
				</tr>

				<tr>
					<td>Age:</td>
					<td><input type="number" name="age"></td>
				</tr>
				<tr>
					<td>Phone Number:</td>
					<td><input type="text" name="phone_number"></td>
				</tr>



				<tr>
					<td>Join Date:</td>
					<td><input type="datetime-local" name="join_date"></td>
				</tr>
				<tr>
					<td>Department:</td>
					<td><input type="number" name="dept"></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" value="Insert"></td>
				</tr>

			</table>

		</fieldset>

	</form>




	<form action="update.jsp" method="GET">

		<fieldset>

			<legend>2. Update Employee</legend>

			<table>



				<tr>

					<td>Employee ID:</td>

					<td><select name="id">

							<c:forEach var="myId" items="${ids.rows}">

								<option value="${myId.id}">${myId.id}</option>

							</c:forEach>

					</select></td>

				</tr>




				<tr>

					<td><input type="checkbox" name="fields" value="firstName">

						First Name:</td>

					<td><input type="text" name="firstName"></td>

				</tr>




				<tr>

					<td><input type="checkbox" name="fields" value="lastName">

						Last Name:</td>

					<td><input type="text" name="lastName"></td>

				</tr>

				<tr>

					<td><input type="checkbox" name="fields" value="age">

						Age:</td>

					<td><input type="number" name="age"></td>

				</tr>


				<tr>

					<td><input type="checkbox" name="fields" value="phoneNumber">

						Phone Number:</td>

					<td><input type="text" name="phoneNumber"></td>

				</tr>

				<tr>

					<td><input type="checkbox" name="fields" value="join_date">

						Join Date:</td>

					<td><input type="datetime-local" name="join_date"></td>

				</tr>

				<tr>

					<td><input type="checkbox" name="fields" value="department">

						Department:</td>

					<td><input type="number" name="department"></td>

				</tr>




				<tr>

					<td></td>

					<td><input type="submit" value="Update"></td>

				</tr>

			</table>

		</fieldset>

	</form>




	<form action="select.jsp" method="GET">

		<fieldset>

			<legend>3. Select Employee</legend>


			<h3>Click The Below Button to view All Employees</h3>
			<table>



				<tr>
					<td></td>
					<td><input id="submit" type="submit" value="Select"></td>
				</tr>

			</table>













		</fieldset>

	</form>




	<form action="delete.jsp" method="GET">

		<fieldset>

			<legend>4. Delete Employee</legend>

			<table>

				<tr>

					<td>Employee ID:</td>

					<td><select name="id">

							<c:forEach var="myId" items="${ids.rows}">

								<option value="${myId.id}">${myId.id}</option>

							</c:forEach>

					</select></td>

				</tr>

				<tr>

					<td></td>

					<td><input class="delete" type="submit" value="Delete"></td>

				</tr>

			</table>

		</fieldset>

	</form>


</body>

</html>