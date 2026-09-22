<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*" isELIgnored="false"%>

<%@ taglib uri="jakarta.tags.sql" prefix="sql"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Update Employee</title>

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

        .back {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .button {
            padding: 10px;
            background-color: grey;
            border-radius: 10px;
            border: 1px solid black;
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

    String id = request.getParameter("id");

    String[] fields = request.getParameterValues("fields");

    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String phoneNumber = request.getParameter("phoneNumber");
    String age =request.getParameter("age");
    String joinDate = request.getParameter("join_date");
    String department=request.getParameter("department");

%>


<sql:setDataSource
    var="myDB"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/javaschema"
    user="root"
    password="tiger" />


<%

    String query = "UPDATE employees SET ";

    for (int i = 0; i < fields.length; i++) {

        if (i > 0) {
            query = query + ", ";
        }

        query = query + fields[i] + "=?";

    }

    query = query + " WHERE id=?";

%>


<sql:update dataSource="${myDB}" sql="<%=query%>">

<%

    for (String field : fields) {

        if (field.equals("firstName")) {
%>

            <sql:param value="<%=firstName%>" />

<%
        }

        else if (field.equals("lastName")) {
%>

            <sql:param value="<%=lastName%>" />

<%
        }

        else if (field.equals("phoneNumber")) {
%>

            <sql:param value="<%=phoneNumber%>" />

<%
        }

        else if (field.equals("age")) {
%>

            <sql:param value="<%=age%>" />

<%
        }

        else if (field.equals("join_date")) {
%>

            <sql:param value="<%=joinDate%>" />
<%
        }

        else if (field.equals("department")) {
%>

            <sql:param value="<%=department%>" />

<%
        }

    }

%>

   <sql:param value="<%=id %>" />

</sql:update>


<div class="box">

    <h1>Employee Updated Successfully</h1>

    <table>

        <tr>
            <td>Employee ID:</td>
            <td><%=id%></td>
        </tr>

<%

    for (String field : fields) {

        if (field.equals("firstName")) {
%>

        <tr>
            <td>First Name:</td>
            <td><%=firstName%></td>
        </tr>

<%
        }

        else if (field.equals("lastName")) {
%>

        <tr>
            <td>Last Name:</td>
            <td><%=lastName%></td>
        </tr>

<%
        }

        else if (field.equals("phoneNumber")) {
%>

        <tr>
            <td>Phone Number:</td>
            <td><%=phoneNumber%></td>
        </tr>

<%
        }

        else if (field.equals("age")) {
%>

        <tr>
            <td>Age:</td>
            <td><%=age%></td>
        </tr>

<%
        }

        else if (field.equals("join_date")) {
%>

        <tr>
            <td>Join Date:</td>
            <td><%=joinDate%></td>
        </tr>

<%
        }

        else if (field.equals("department")) {
%>

        <tr>
            <td>Department:</td>
            <td><%=department%></td>
        </tr>
<%
        }

    }

%>

    </table>

    <br>

    <div class="back">

        <button class="button" onclick="history.back();">
            Back to Home
        </button>

    </div>
    <div class="button1">
    	<a href="select.jsp">View Emplyees</a>
    </div>
    

</div>

</body>

</html>

