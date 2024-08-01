<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Monthly Tasks/Hours Bar Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h2>Monthly Tasks/Hours Bar Chart for <%= username %></h2>	
    <canvas id="monthlyChart" width="400" height="400"></canvas>
    <script>
        fetch('MonthlyChartServlet')
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('monthlyChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data.labels,
                    datasets: [{
                        label: 'Tasks/Hours',
                        data: data.data,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });
    </script>
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
            padding-top:120px;
        }
        canvas {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 10px;
            margin-bottom: 60px; /* Margin to accommodate the fixed link */
            width: 400px; /* Set width of the canvas */
            height: 400px; /* Set height of the canvas */
        }
        a {
            color: #1abc9c;
            text-decoration: none;
            font-weight: bold;
            background: #34495e;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s ease, transform 0.3s ease;
            position: fixed;
            bottom: 0px; /* Distance from the bottom */
            left: 50%;
            transform: translateX(-50%);
        }
        a:hover {
            background: #1abc9c;
            color: #ecf0f1;
            transform: translateX(-50%) scale(1.05);
        }
    </style>
</body>
</html>
<%
    }
%>
