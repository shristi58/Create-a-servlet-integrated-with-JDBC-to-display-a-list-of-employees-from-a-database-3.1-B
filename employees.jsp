<%@ page import="java.util.*, com.example.servlet.Employee" %>
<html>
<head><title>Employee List</title></head>
<body>
<h2>All Employees</h2>
<table border="1" cellpadding="8">
<tr><th>ID</th><th>Name</th><th>Department</th><th>Salary</th></tr>

<%
List<Employee> list = (List<Employee>) request.getAttribute("employees");
for(Employee e : list) {
%>
<tr>
<td><%= e.getId() %></td>
<td><%= e.getName() %></td>
<td><%= e.getDepartment() %></td>
<td><%= e.getSalary() %></td>
</tr>
<% } %>

</table>
<br>
<a href="index.html">Back</a>
</body>
</html>
