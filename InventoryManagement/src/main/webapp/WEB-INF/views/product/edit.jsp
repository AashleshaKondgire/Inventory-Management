<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eaeef1;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 30px;
        }

        h1 {
            color: #3e64ff; /* Brighter blue color for heading */
            margin-bottom: 25px;
            text-shadow: 1px 1px 5px rgba(62, 100, 255, 0.3);
            font-size: 2rem;
        }

        form {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            padding: 25px;
            width: 450px;
            display: flex;
            flex-direction: column;
            gap: 20px; /* Space between form elements */
            border: 2px solid #3e64ff; /* Blue border for form */
        }

        label {
            font-weight: bold;
            margin-bottom: 8px;
            color: #1a202c; /* Darker text color */
        }

        input[type="text"],
        input[type="number"] {
            border: 1px solid #cbd5e0; /* Light gray border */
            border-radius: 8px;
            padding: 12px;
            font-size: 15px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            width: 100%;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #3e64ff; /* Blue border on focus */
            box-shadow: 0 0 8px rgba(62, 100, 255, 0.5);
            outline: none;
        }

        button {
            background-color: #ff5722; /* Vibrant orange color */
            color: #ffffff;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            font-size: 16px;
        }

        button:hover {
            background-color: #e64a19; /* Darker orange on hover */
            transform: translateY(-2px); /* Slight lift on hover */
        }

        .back-link {
            margin-top: 20px;
            text-decoration: none;
            color: #ffffff;
            background-color: #2d3748; /* Dark gray */
            padding: 12px 20px;
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .back-link:hover {
            background-color: #1a202c; /* Darker gray on hover */
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <h1>Edit Product</h1>
    <form action="/products/edit/${product.id}" method="post">
        <label>Name:</label>
        <input type="text" name="name" value="${product.name}" required>
        
        <label>Description:</label>
        <input type="text" name="description" value="${product.description}">

        <label>Quantity:</label>
        <input type="number" name="quantity" value="${product.quantity}" required>
        
        <label>Price:</label>
        <input type="number" step="0.01" name="price" value="${product.price}" required>

        <label>Image URL:</label>
        <input type="text" name="image" value="${product.image}"> <!-- Input for image URL -->
        
        <button type="submit">Update Product</button>
    </form>
    <a href="/products" class="back-link">Back to List</a>
</body>
</html>
