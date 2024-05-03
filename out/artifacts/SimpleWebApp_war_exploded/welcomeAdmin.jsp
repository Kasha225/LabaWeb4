<%--
  Created by IntelliJ IDEA.
  User: ruslan
  Date: 25.04.2024
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WelcomeAdmin</title>
</head>
<body>
<h1>Welcome, Admin!</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Password</th>
        <th>Email</th>
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
        <td><%= resultSet.getInt("id_user") %></td>
        <td><%= resultSet.getString("name") %></td>
        <td><%= resultSet.getString("password") %></td>
        <td><%= resultSet.getString("email") %></td>
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
