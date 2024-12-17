<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.revature.model.Category" %>
<%@ page import="com.revature.Service.CategoryService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Category</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff; /* Soft light blue background */
            color: #2c3e50; /* Dark blue-grey text color */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            color: #2ecc71; /* Green color for heading */
            font-size: 28px;
            margin-bottom: 20px;
        }

        form {
            background-color: #ffffff; /* White form background */
            border: 2px solid #2ecc71; /* Green border */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Shadow effect */
            padding: 25px;
            width: 320px; /* Fixed width for form */
            display: flex;
            flex-direction: column;
            gap: 20px; /* Space between form elements */
        }

        label {
            font-weight: 600;
            color: #2c3e50; /* Dark blue-grey label color */
        }

        input[type="text"] {
            padding: 12px;
            border: 1px solid #bdc3c7; /* Light grey border */
            border-radius: 5px; /* Rounded input corners */
            transition: border-color 0.3s;
            font-size: 16px;
        }

        input[type="text"]:focus {
            border-color: #2ecc71; /* Green border on focus */
            outline: none;
            box-shadow: 0 0 5px rgba(46, 204, 113, 0.5); /* Subtle green glow effect */
        }

        button {
            background-color: #2ecc71; /* Green button color */
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-weight: bold;
        }

        button:hover {
            background-color: #27ae60; /* Darker green on hover */
        }

        .back-link {
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background-color: #e74c3c; /* Red background for the back button */
            padding: 12px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
            font-weight: bold;
            font-size: 14px;
        }

        .back-link:hover {
            background-color: #c0392b; /* Darker red on hover */
        }
    </style>
</head>
<body>
    <h1>Edit Category</h1>

    <%
        // Retrieve the category object from the request attribute
        Category category = (Category) request.getAttribute("category");
    %>

    <form action="/categories/<%= category.getId() %>" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= category.getName() %>" required>
        <button type="submit">Update Category</button>
    </form>

    <a href="/categories" class="back-link">Back to List</a>
</body>
</html>
