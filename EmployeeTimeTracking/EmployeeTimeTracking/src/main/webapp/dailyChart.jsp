<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Daily Tasks/Hours Pie Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h2>Daily Tasks/Hours Pie Chart for <%= username %></h2>
    <canvas id="dailyChart" width="400" height="400"></canvas>
    <script>
        fetch('DailyChartServlet')
        .then(response => response.json())
        .then(data => {
            console.log('Data received:', data);
            const labels = Object.keys(data);
            const values = Object.values(data);
            if (labels.length === 0 || values.length === 0) {
                console.warn('No data available for the chart.');
                return;
            }
            const ctx = document.getElementById('dailyChart').getContext('2d');
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Tasks/Hours',
                        data: values,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                }
            });
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
    </script>
    <a href="dashboard.jsp">Back to Dashboard</a>
     <style>
        body {
            font-family: Arial, sans-serif;
            background: #2c3e50;
            color: #ecf0f1;
            margin: 0;
            padding-top:100px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }
        h2 {
            color: #1abc9c;
            margin-bottom: 0px;
            padding:20px;
            margin-top:10px;
        }
        canvas {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 10px;
            margin-bottom: 20px;
            width: 300px; /* Reduced size */
            height: 300px; /* Reduced size */
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
            bottom: 0; /* Distance from the bottom */
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
