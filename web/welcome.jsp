<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: student
  Date: 24.10.2017
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<h1>Welcome, User!</h1>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Role</th>
    </tr>
    <%
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "root");
            String sql = "SELECT * FROM user";
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
    %>
    <tr>
        <td><%= resultSet.getString("name") %></td>
        <td><%= resultSet.getString("role") %></td>
    </tr>
    <%
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>