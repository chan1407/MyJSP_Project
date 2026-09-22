<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*" isELIgnored="false"%>

<%@ taglib uri="jakarta.tags.sql" prefix="sql"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Insert Employee</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 30px;
        }

        .box {
            width: 500px;
            margin: auto;
            background-color: white;
            padding: 25px;
            border: 1px solid #ccc;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
        }

        td {
            padding: 8px;
        }

        input[type="submit"] {
            padding: 8px 20px;
        }
        .back{
        	width: 100%;
        	display:flex;
        	justify-content: center;
        }
        .button{
        	padding:10px;
        	background-color: grey;
        	border-radius: 10px;
        }
        .button1{
        	padding-top: 10px;
            width: 100%;
            display: flex;
            justify-content: center;
        }

    </style>

</head>

<body>

    <%
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phone_number");
        int age = Integer.parseInt(request.getParameter("age"));
        String joinDate = request.getParameter("join_date");
        int Department=Integer.parseInt(request.getParameter("dept"));
        
        
        Date d=null;
        SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
        
        try{
        	
        	d=s.parse(joinDate);
        }
        catch(ParseException e){
        	e.printStackTrace();
        }
        
        
    %>


    <sql:setDataSource
        var="myDB"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/javaschema"
        user="root"
        password="tiger" />


    <sql:update dataSource="${myDB}">

        INSERT INTO employees
        (firstName, lastName,age, phoneNumber, join_date,department)
        VALUES
        (?, ?, ?, ?, ?,?)

        <sql:param value="<%=firstName%>" />
        <sql:param value="<%=lastName%>" />
        <sql:param value="<%=age%>" />
        <sql:param value="<%=phoneNumber%>" />
        <sql:param value="<%=d%>" />
        <sql:param value="<%=Department%>" />

    </sql:update>


    <div class="box">

        <h1>Employee Inserted Successfully</h1>

        <table>

            <tr>
                <td>First Name:</td>
                <td><%=firstName%></td>
            </tr>

            <tr>
                <td>Last Name:</td>
                <td><%=lastName%></td>
            </tr>

            <tr>
                <td>Phone Number:</td>
                <td><%=phoneNumber%></td>
            </tr>

            <tr>
                <td>Age:</td>
                <td><%=age%></td>
            </tr>

            <tr>
                <td>Join Date:</td>
                <td><%=joinDate%></td>
            </tr>

        </table>

        <br>
		<div class="back"><button class="button" onclick="history.back();">Back to Home</button></div>
       	<div class="button1">
    	<a href="select.jsp">View Emplyees</a>
    </div>

    </div>

</body>

</html>

