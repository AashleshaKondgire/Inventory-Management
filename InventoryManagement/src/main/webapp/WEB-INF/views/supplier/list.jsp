<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.revature.model.Supplier" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier List</title>
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

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }

        table {
            width: 100%;
            margin: 20px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .create-link {
            display: block;
            margin: 20px auto;
            text-align: center;
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .create-link:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Supplier List</h1>
    <a class="create-link" href="/suppliers/new">Create New Supplier</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Actions</th>
        </tr>
        <%
            List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
            if (suppliers != null && !suppliers.isEmpty()) {
                for (Supplier supplier : suppliers) {
        %>
        <tr>
            <td><%= supplier.getId() %></td>
            <td><%= supplier.getName() %></td>
            <td><%= supplier.getContact() %></td>
            <td>
                <a href="/suppliers/<%= supplier.getId() %>/edit">Edit</a>
                <a href="/suppliers/<%= supplier.getId() %>/delete">Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No suppliers found.</td>
        </tr>
        <%
            }
        %>
    </table>
    
      <a href="/">Back to Home</a>
</body>
</html>
