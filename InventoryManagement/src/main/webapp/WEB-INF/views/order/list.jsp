<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.revature.model.Order" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7fa; /* Light cyan background */
            color: #212121; /* Dark text color */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            color: #00796b; /* Teal color for heading */
            margin-bottom: 20px;
            font-size: 2.5rem; /* Larger heading font */
        }

        .order-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px; /* Space between cards */
            max-width: 1200px;
        }

        .order-card {
            background-color: #ffffff; /* White card background */
            border: 2px solid #b2dfdb; /* Light teal border */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15); /* Stronger shadow */
            padding: 20px;
            width: 280px; /* Slightly wider card */
            text-align: center; /* Centered text */
            transition: transform 0.3s ease; /* Smooth transform effect */
        }

        .order-card:hover {
            transform: scale(1.08); /* Larger scale on hover */
        }

        .order-card h3 {
            color: #004d40; /* Dark teal for order ID */
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .order-card p {
            color: #616161; /* Grey for the text */
            font-size: 1rem;
        }

        img {
            max-width: 100%; /* Responsive image */
            height: auto; /* Auto height */
            border-radius: 5px; /* Rounded image corners */
            margin-top: 10px;
            border: 1px solid #004d40; /* Dark teal border */
        }

        .back-link {
            margin-top: 20px;
            text-decoration: none;
            color: #ffffff; /* White text color */
            background-color: #0288d1; /* Bright blue background */
            padding: 12px 20px; /* Larger padding */
            border-radius: 8px; /* More rounded corners */
            font-weight: bold;
            transition: background-color 0.4s ease; /* Transition effect */
        }

        .back-link:hover {
            background-color: #01579b; /* Darker blue on hover */
        }

        .back-link-container {
            display: flex;
            gap: 20px;
        }
    </style>
</head>
<body>
    <h1>Order List</h1>
    <div class="order-container">
        <%
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) {
        %>
            <div class="order-card">
                <h3>Order ID: <%= order.getId() %></h3>
                <p><strong>Product Name:</strong> <%= order.getProduct().getName() %></p>
                <p><strong>Quantity:</strong> <%= order.getQuantity() %></p>
                <p><strong>Status:</strong> <%= order.getStatus() %></p>
                <p><strong>Order Date:</strong> <%= order.getOrderDate() %></p>
                <img src="<%= order.getProductImage() %>" alt="Product Image"/>
            </div>
        <%
                }
            } else {
        %>
            <p>No orders found.</p>
        <%
            }
        %>
    </div>
    <div class="back-link-container">
        <a href="/products" class="back-link">Back to Products</a>
        <a href="/" class="back-link">Home</a>
    </div>
</body>
</html>
