<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Light background */
            color: #333; /* Dark text color */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            color: #007bff; /* Blue color for heading */
            margin-bottom: 20px;
        }

        .link-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px; /* Space between links */
        }

        .link-button {
            text-decoration: none;
            color: #ffffff; /* White text color */
            background-color: #007bff; /* Blue color for buttons */
            padding: 10px 20px;
            border-radius: 5px; /* Rounded corners */
            transition: background-color 0.3s ease; /* Transition effect */
        }

        .link-button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <h1>Welcome to the Inventory Management System</h1>
    <div class="link-container">
        <a href="/categories" class="link-button">View Categories</a>
        <a href="/products" class="link-button">View Products</a>
        <a href="/suppliers" class="link-button">View Suppliers</a>
        <!-- Add more links as needed -->
    </div>
</body>
</html>
