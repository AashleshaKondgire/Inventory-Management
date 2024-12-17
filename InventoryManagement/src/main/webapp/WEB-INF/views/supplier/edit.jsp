<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.revature.model.Supplier" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Supplier</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Edit Supplier</h1>
   <form action="/suppliers/edit/${supplier.id}" method="post">
    <input type="hidden" name="_method" value="put"> <!-- For PUT mapping -->
    <input type="hidden" name="id" value="${supplier.id}"> <!-- Include the ID in the form data -->
    
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="${supplier.name}" required>
    
    <label for="contact">Contact:</label>
    <input type="text" id="contact" name="contact" value="${supplier.contact}" required>
    
    <button type="submit">Update Supplier</button>
</form>

    
    
    <a href="/suppliers">Back to Supplier List</a>
</body>
</html>
