<%@ page import="com.example.servlet.Employee" %>
<html>
<head><title>Search Employee</title></head>
<body>
<h2>Employee Search Result</h2>

<%
Employee emp = (Employee) request.getAttribute("employee");
if (emp != null) {
%>
<p><b>ID:</b> <%= emp.getId() %></p>
<p><b>Name:</b> <%= emp.getName() %></p>
<p><b>Department:</b> <%= emp.getDepartment() %></p>
<p><b>Salary:</b> <%= emp.getSalary() %></p>
<% } else { %>
<p>No employee found with this ID.</p>
<% } %>

<br><a href="index.html">Back</a>
</body>
</html>
