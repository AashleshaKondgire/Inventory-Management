<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.revature.model.Product" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #fafafa;
            color: #2c3e50;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            color: #8e44ad; /* Deep purple for heading */
            margin-bottom: 30px;
            text-transform: uppercase;
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px; /* Increased spacing between cards */
            justify-content: center;
            max-width: 1200px;
        }

        .product-card {
            background: linear-gradient(135deg, #ecf0f1 0%, #bdc3c7 100%);
            border: 1px solid #e1e5e9;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 270px;
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .product-card:hover {
            transform: scale(1.05); /* Scale effect */
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2); /* Enhanced shadow */
        }

        .product-card h3 {
            color: #27ae60; /* Green color for product names */
            margin-bottom: 12px;
            font-size: 18px;
        }

        .product-card img {
            width: 120px;
            height: 120px;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .product-card p {
            font-size: 14px;
            margin-bottom: 8px;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
        }

        .action-buttons a {
            text-decoration: none;
            color: #fff;
            background-color: #3498db; /* Blue buttons */
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 13px;
            transition: background-color 0.3s ease;
        }

        .action-buttons a:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }

        .order-form {
            margin-top: 10px;
        }

        .order-form input {
            width: 80%;
            padding: 6px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #95a5a6;
        }

        .order-form button {
            color: #fff;
            background-color: #e74c3c; /* Red for order button */
            padding: 10px 15px;
            border: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .order-form button:hover {
            background-color: #c0392b; /* Darker red on hover */
        }

        .back-link {
            margin-top: 25px;
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background-color: #9b59b6; /* Purple buttons */
            padding: 12px 20px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
            background-color: #8e44ad; /* Darker purple on hover */
        }

        .back-link-group {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Product List</h1>
    
    <div class="product-container">
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
            <div class="product-card">
                <h3><%= product.getName() %></h3>
                <img src="<%= product.getImage() %>" alt="<%= product.getName() %>"/>
                <p><strong>Description:</strong> <%= product.getDescription() %></p>
                <p><strong>Quantity:</strong> <%= product.getQuantity() %></p>
                <p><strong>Price:</strong> $<%= product.getPrice() %></p>
                <p><strong>Category:</strong> <%= product.getCategory() != null ? product.getCategory().getName() : "N/A" %></p>
                <div class="action-buttons">
                    <a href="/products/edit/<%= product.getId() %>">Edit</a>
                    <a href="/products/delete/<%= product.getId() %>">Delete</a>
                </div>
                <form action="/products/<%= product.getId() %>/order" method="post" class="order-form">
                    <input type="number" name="quantity" min="1" max="<%= product.getQuantity() %>" placeholder="Quantity to order" required>
                    <button type="submit">Order</button>
                </form>
            </div>
        <%
                }
            } else {
        %>
            <div class="product-card">
                <p>No products found</p>
            </div>
        <%
            }
        %>
    </div>
    
    <div class="back-link-group">
        <a href="/products/add" class="back-link">Add Product</a>
        <a href="/orders" class="back-link">View Orders</a>
        <a href="/" class="back-link">Home</a>
    </div>
</body>
</html>
