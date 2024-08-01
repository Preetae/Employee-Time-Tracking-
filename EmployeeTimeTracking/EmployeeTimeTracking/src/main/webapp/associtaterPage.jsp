<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--  
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    } else if (!"Associate".equals(session.getAttribute("role"))) {
        response.sendRedirect("dashboard.jsp");
        return; // Redirect to dashboard if the user is not an associate
    }
-->
<!DOCTYPE html>
<html>
<head>
    <title>Associate Page</title>
</head>
<body>
    <h2>Associate Page</h2>
    <ul>
        
        <li><a href="viewMyCharts.jsp">View My Charts</a></li>
    </ul>
    <a href="dashboard.jsp">Back to Dashboard</a>
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
        }
        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        li {
            margin: 10px 0;
            color:white;
        }
        a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            background: #34495e;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s ease, transform 0.3s ease;
            display: block;
            width: 180px;
            margin: 10px auto;
        }
        a:hover {
            background: #1abc9c;
            color: #ecf0f1;
            transform: scale(1.05);
        }
        .back-link {
            font-size: 16px;
            color: #e74c3c;
            text-decoration: underline;
        }
        .back-link:hover {
            color: #c0392b;
        }
    </style>
    
</body>
</html>