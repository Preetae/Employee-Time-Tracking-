<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= session.getAttribute("username") %></h2>
    <%
        if ("Admin".equals(role)) {
    %>
    <a href="adminPage.jsp">Admin Page</a><br>
    <%
        } else {
    %>
    <a href="taskPage.jsp">Task Management</a><br>
    <a href="associtaterPage.jsp">View Associater</a>
    <%
        }
    %>
    <a href="LogoutServlet">Logout</a>
   
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
        a {
            display: block;
            margin: 10px 0;
            font-size: 18px;
            color: #ecf0f1;
            text-decoration: none;
            background: #34495e;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s, transform 0.3s;
            width:160px;
        }
        a:hover {
            background: #1abc9c;
            transform: scale(1.05);
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
<%
    }
%>
