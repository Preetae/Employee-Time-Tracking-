<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get the session
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }

    // Retrieve username from the session
    String username = (String) session.getAttribute("username");
    int userId = 0;
    String dbUrl = "jdbc:mysql://localhost:3306/EmployeeTaskTracker";
    String dbUser = "root";
    String dbPass = "preethi1234";

    // Query to get user_id from username
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        PreparedStatement ps = con.prepareStatement("SELECT user_id FROM Users WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            userId = rs.getInt("user_id");
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Task Management</title>
</head>
<body>
    <h2>Task Management for <%= username %></h2>
    <form action="TaskServlet" method="get">
        <input type="hidden" name="userId" value="<%= userId %>" >
        <label for="project">Project:</label>
        <input type="text" id="project" name="project" placeholder="Enter your project"><br><br>
        <label for="date">Date:</label>
        <input type="date" id="date" name="date"><br><br>
        <label for="startTime">Start Time:</label>
        <input type="time" id="startTime" name="startTime"><br><br>
        <label for="endTime">End Time:</label>
        <input type="time" id="endTime" name="endTime"><br><br>
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" placeholder="Enter category"><br><br>
        <label for="description">Description:</label>
        <textarea id="description" name="description" placeholder="Enter the Description"></textarea><br><br>
        <input type="submit" value="Add Task">
    </form>
    <h3>Your Tasks</h3>
    <table border="1">
        <tr>
            <th>Project</th>
            <th>Date</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Category</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Tasks WHERE employee_id=?");
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("project") %></td>
            <td><%= rs.getDate("date") %></td>
            <td><%= rs.getTime("start_time") %></td>
            <td><%= rs.getTime("end_time") %></td>
            <td><%= rs.getString("category") %></td>
            <td><%= rs.getString("description") %></td>
            <td>
                <a href="EditTaskServlet?taskId=<%= rs.getInt("task_id") %>">Edit</a>
                <a href="DeleteTaskServlet?taskId=<%= rs.getInt("task_id") %>">Delete</a>
            </td>
        </tr>
        <%
                }
                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <a href="dashboard.jsp"class="back">Back to Dashboard</a>
    <style>
     body {
            font-family: Arial, sans-serif;
            background: #2c3e50;
            color: #ecf0f1;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }
        h2 {
            color: #1abc9c;
            margin-bottom: 20px;
            padding-top: 400px; /* Added padding to the top */
        }
        h3{
        color: #1abc9c;
        font-size:25px;
        }
        form {
            background: rgba(255, 255, 255, 0.1); /* Slightly opaque background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 300px;
            max-width: 100%;
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        textarea {
            height: 100px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #1abc9c;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        input[type="submit"]:hover {
            background: #16a085;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            color: #34495e; /* Change the color of the table text */
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background: #34495e;
            color: #ecf0f1;
        }
        td {
            background: #ffffff;
        }
        tr:nth-child(even) {
            background: #f2f2f2;
        }
        a {
            color: #1abc9c;
            text-decoration: none;
            font-weight: bold;
        }
        .back{
        font-size:20px;
        padding:10px;
        }
        a:hover {
            text-decoration: underline;
        }
        .logout {
            margin-top: 20px;
            font-size: 16px;
            color: #e74c3c;
            text-decoration: underline;
        }
        .logout:hover {
            color: #c0392b;
        }
    </style>
</body>
</html>