<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="Login">
    </form>
        <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #2c3e50;
            color: #ecf0f1; 
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        h2 {
            text-align: center;
            color: #1abc9c;
            padding:10px;
        }
        form {
            background: #34495e;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            width: 350px;
            max-width: 100%;
            border: 2px solid #1abc9c;
        }
        label {
            display: block;
            margin-bottom: 15px;
            font-size: 18px;
            color: #ecf0f1;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 25px;
            border: none;
            border-radius: 8px;
            background: #2c3e50;
            color: #ecf0f1;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: #95a5a6;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #1abc9c;
            border: none;
            border-radius: 8px;
            color: #ecf0f1;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
        }
        input[type="submit"]:hover {
            background: #16a085;
            transform: scale(1.05);
        }
    </style>
    
</body>
</html>
