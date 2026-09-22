<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="jakarta.tags.sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#output
{
height:200px;
width:50%;
border:1px solid black;
text-align:center;

margin:auto;
}
.button1{
        	padding-top: 10px;
            
            width: 100%;
            display: flex;
            justify-content: center;
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
</style>
</head>
<body>

<% int id=Integer.parseInt(request.getParameter("id"));  %>

<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/javaschema" user="root" password="tiger"/>
<sql:update dataSource="${myDB }" var="count">
	delete from employees where id=?
	<sql:param value="<%=id%>"></sql:param>
</sql:update>
<div id="output">
<H1>Record deleted Successfully</H1>
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