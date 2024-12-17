<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.revature.model.Category" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category List</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e3f2fd; /* Light blue background */
            color: #343a40; /* Dark grey text color */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            color: #0d6efd; /* Primary blue for heading */
            margin-bottom: 20px;
            font-size: 2.5em;
            font-weight: 700; /* Bold heading */
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* Soft shadow */
        }

        .button {
            background-color: #0d6efd; /* Primary blue button color */
            color: white; /* White text color */
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 25px;
            transition: background-color 0.3s, transform 0.3s;
            margin: 10px;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        .button:hover {
            background-color: #0056b3; /* Darker blue on hover */
            transform: translateY(-3px); /* Slight lift effect */
        }

        .card-container {
            display: flex;
            flex-wrap: wrap; /* Cards in row, wrap if needed */
            justify-content: center;
            gap: 20px; /* Spacing between cards */
            margin-top: 20px;
        }

        .card {
            background-color: #ffffff; /* White card background */
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* Shadow effect */
            padding: 20px;
            width: 300px;
            text-align: center;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px); /* Lift effect on hover */
        }

        .card h2 {
            color: #0d6efd; /* Primary blue for card titles */
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .card p {
            color: #6c757d; /* Muted text for details */
            font-size: 1em;
            margin-bottom: 15px;
        }

        .action-link {
            margin-right: 15px;
            text-decoration: none;
            color: #0d6efd; /* Primary blue for action links */
            font-weight: bold;
        }

        .action-link:hover {
            color: #0056b3; /* Darker blue on hover */
        }

        @media (max-width: 600px) {
            .card {
                width: 100%; /* Full width on small screens */
            }

            h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <h1>Category List</h1>
    
    <div class="card-container">
        <%
        List<Category> categories = (List<Category>) request.getAttribute("categories");
        if (categories != null) {
            for (Category category : categories) {
        %>
        <div class="card">
            <h2><%= category.getName() %></h2>
            <p>Category ID: <%= category.getId() %></p>
            <a href="/categories/edit/<%= category.getId() %>" class="action-link">Edit</a>
            <a href="/categories/delete/<%= category.getId() %>" 
               class="action-link" 
               onclick="return confirm('Are you sure you want to delete this category?');">Delete</a>
        </div>
        <%
            }
        } else {
        %>
        <div>
            <p>No categories found</p>
        </div>
        <%
        }
        %>
    </div>
    
    <div>
        <br><br>
        <a href="/categories/add" class="button">Add Category</a>
        <a href="/" class="button">Home</a>
    </div>
</body>
</html>
