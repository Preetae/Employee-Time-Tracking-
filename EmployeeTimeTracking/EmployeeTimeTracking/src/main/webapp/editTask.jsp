<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //HttpSession session = request.getSession(false);
    ResultSet task = (ResultSet) request.getAttribute("task");
    if (task != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
</head>
<body>
    <h2>Edit Task</h2>
    <form action="EditTaskServlet" method="post">
        <input type="hidden" name="taskId" value="<%= task.getInt("task_id") %>">
        <label for="project">Project:</label>
        <input type="text" id="project" name="project" value="<%= task.getString("project") %>"><br><br>
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="<%= task.getDate("date") %>"><br><br>
        <label for="startTime">Start Time:</label>
        <input type="time" id="startTime" name="startTime" value="<%= task.getTime("start_time") %>"><br><br>
        <label for="endTime">End Time:</label>
        <input type="time" id="endTime" name="endTime" value="<%= task.getTime("end_time") %>"><br><br>
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" value="<%= task.getString("category") %>"><br><br>
        <label for="description">Description:</label>
        <textarea id="description" name="description"><%= task.getString("description") %></textarea><br><br>
        <input type="submit" value="Update Task">
    </form>
    <a href="taskPage.jsp">Back to Task Management</a>
     <style>
        body {
            font-family: Arial, sans-serif;
            background: #2c3e50; /* Dark background for contrast */
            color: #ecf0f1; /* Light text color for readability */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh; /* Full viewport height */
            text-align: center;
        }
        h2 {
            color: #1abc9c; /* Teal color for headings */
            margin-bottom: 20px;
            padding-top:200px;
        }
        form {
            background: rgba(255, 255, 255, 0.1); /* Slightly opaque white background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 300px;
            max-width: 100%;
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
        a {
            display: block;
            margin-top: 20px;
            color: #1abc9c;
            text-decoration: none;
            font-size: 16px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
    
</body>
</html>
<%
    }
%>
