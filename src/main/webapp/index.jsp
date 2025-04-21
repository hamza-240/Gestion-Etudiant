<!--
/**
* Copyright (c) 2023 Votre Nom
* MIT License
*/
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@page import="com.controller.LoginServlet" %>
<%@ page import="com.conxDB.ConnexionDB" %>
<%
    String login = null;
    if (session.getAttribute("user") != null) {
        login = session.getAttribute("user").toString();
    } else {
        response.sendRedirect("auth.jsp");
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --secondary-color: #dc2626;
            --secondary-hover: #b91c1c;
            --success-color: #16a34a;
            --success-hover: #15803d;
            --background-color: #f1f5f9;
            --card-color: #ffffff;
            --text-color: #1e293b;
            --text-secondary: #64748b;
            --border-color: #e2e8f0;
            --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --radius: 12px;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        body {
            font-family: system-ui, -apple-system, sans-serif;
            background-color: var(--background-color);
            min-height: 100vh;
            padding: 2rem;
            color: var(--text-color);
        }

        .dashboard {
            max-width: 1200px;
            margin: 0 auto;
            padding-top: 3rem;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .header-content h1 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .header-content p {
            color: var(--text-secondary);
        }

        .user-info {
            position: fixed;
            top: 1rem;
            right: 1rem;
            background: var(--card-color);
            padding: 0.75rem 1.5rem;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .user-info::before {
            content: '👤';
        }

        .content-card {
            background: var(--card-color);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1.5rem;
        }

        th {
            background-color: #f8fafc;
            padding: 1rem;
            text-align: left;
            font-weight: 600;
            color: var(--text-color);
            border-bottom: 2px solid var(--border-color);
        }

        td {
            padding: 1rem;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-secondary);
        }

        tr:hover {
            background-color: #f8fafc;
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            padding: 0.5rem 1rem;
            border-radius: var(--radius);
            font-weight: 500;
            text-decoration: none;
            transition: var(--transition);
            cursor: pointer;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
        }

        .btn-danger {
            background-color: var(--secondary-color);
            color: white;
        }

        .btn-danger:hover {
            background-color: var(--secondary-hover);
            transform: translateY(-1px);
        }

        .btn-success {
            background-color: var(--success-color);
            color: white;
        }

        .btn-success:hover {
            background-color: var(--success-hover);
            transform: translateY(-1px);
        }

        .stats {
            background: var(--card-color);
            padding: 1rem;
            border-radius: var(--radius);
            margin-bottom: 1.5rem;
            box-shadow: var(--shadow);
        }

        .stats p {
            color: var(--text-secondary);
            font-size: 1.1rem;
        }

        .footer-actions {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
            }

            .action-buttons {
                flex-direction: column;
                width: 100%;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }

            .user-info {
                position: static;
                margin-bottom: 1rem;
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
<div class="user-info">
    <%= login %>
</div>

<div class="dashboard">
    <div class="header">
        <div class="header-content">
            <h1>Tableau de bord</h1>
            <p>Bienvenue, <%= login %></p>
        </div>
    </div>

    <div class="stats">
        <%
            int nbEtu = 0;
        %>
        <p>Gestion des étudiants</p>
    </div>

    <div class="content-card">
        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Date de Naissance</th>
                    <th>Sexe</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    String sql = "SELECT * FROM etudiant";
                    Connection con = ConnexionDB.getConnection();
                    Statement s = null;
                    ResultSet rs = null;
                    try {
                        s = con.createStatement();
                        rs = s.executeQuery(sql);
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("id") %></td>
                    <td><%= rs.getString("nom") %></td>
                    <td><%= rs.getString("date_naissance") %></td>
                    <td><%= rs.getString("sexe") %></td>
                    <td>
                        <div class="action-buttons">
                            <a href="Update?id=<%= rs.getString("id") %>" class="btn btn-primary">Modifier</a>
                            <a href="Delete?id=<%= rs.getString("id") %>" class="btn btn-danger">Supprimer</a>
                        </div>
                    </td>
                </tr>
                <%
                        }
                        Statement s2 = con.createStatement();
                        ResultSet rs2 = s2.executeQuery("SELECT COUNT(*) FROM etudiant");
                        if (rs2.next()) {
                            nbEtu = rs2.getInt(1);
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    } finally {
                        if (rs != null) rs.close();
                        if (s != null) s.close();
                        if (con != null) con.close();
                    }
                %>
                </tbody>
            </table>
        </div>

        <div class="stats">
            <p>Nombre total d'étudiants : <strong><%= nbEtu %></strong></p>
        </div>

        <div class="footer-actions">
            <a href="ajouter" class="btn btn-success">Ajouter un étudiant</a>
            <a href="logout" class="btn btn-danger">Se déconnecter</a>
        </div>
    </div>
</div>
</body>
</html>