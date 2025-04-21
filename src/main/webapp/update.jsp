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
    String nom = null;
    String date = null;
    String sexe = null;
    int id = 0;
    if (session.getAttribute("user") != null) {
        login = session.getAttribute("user").toString();
        nom = (String) request.getAttribute("nom");
        date = (String) request.getAttribute("date");
        sexe = (String) request.getAttribute("sexe");
        id = Integer.parseInt((String) request.getAttribute("id"));
    } else {
        response.sendRedirect("auth.jsp");
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un étudiant</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
            color: var(--text-color);
        }

        .update-container {
            background-color: var(--card-color);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 2.5rem;
            width: 100%;
            max-width: 500px;
            position: relative;
            animation: slideUp 0.5s ease;
        }

        .update-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border-radius: var(--radius) var(--radius) 0 0;
        }

        .form-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .form-header h1 {
            font-size: 1.875rem;
            font-weight: 700;
            margin-bottom: 0.75rem;
            color: var(--text-color);
        }

        .form-header p {
            color: var(--text-secondary);
            font-size: 1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: var(--text-color);
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 0.875rem 1rem;
            border: 2px solid var(--border-color);
            border-radius: var(--radius);
            font-size: 1rem;
            color: var(--text-color);
            transition: var(--transition);
            background-color: #f8fafc;
        }

        input[type="text"]:focus,
        input[type="date"]:focus {
            outline: none;
            border-color: var(--primary-color);
            background-color: #ffffff;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        input[type="text"]::placeholder,
        input[type="date"]::placeholder {
            color: var(--text-secondary);
        }

        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2.5rem;
        }

        .btn {
            flex: 1;
            padding: 0.875rem;
            border: none;
            border-radius: var(--radius);
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            text-align: center;
            text-decoration: none;
        }

        .btn-update {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-update:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
        }

        .btn-cancel {
            background-color: var(--secondary-color);
            color: white;
        }

        .btn-cancel:hover {
            background-color: var(--secondary-hover);
            transform: translateY(-2px);
        }

        .user-info {
            position: fixed;
            top: 1rem;
            right: 1rem;
            background: var(--card-color);
            padding: 0.75rem 1.5rem;
            border-radius: var(--radius);
            font-size: 0.875rem;
            color: var(--text-color);
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .user-info::before {
            content: '👤';
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 640px) {
            body {
                padding: 1rem;
            }

            .update-container {
                padding: 1.5rem;
            }

            .button-group {
                flex-direction: column-reverse;
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

<div class="update-container">
    <div class="form-header">
        <h1>Modifier un étudiant</h1>
        <p>Mettez à jour les informations de l'étudiant</p>
    </div>

    <form method="POST" action="UpdateEtudiant">
        <input type="hidden" name="id" value="<%= id %>">

        <div class="form-group">
            <label for="nom">Nom complet</label>
            <input type="text" id="nom" name="nom" value="<%= nom %>" placeholder="Entrez le nom complet" required>
        </div>

        <div class="form-group">
            <label for="sexe">Sexe</label>
            <input type="text" id="sexe" name="sexe" value="<%= sexe %>" placeholder="M ou F" required>
        </div>

        <div class="form-group">
            <label for="date">Date de naissance</label>
            <input type="date" id="date" name="date" value="<%= date %>" required>
        </div>

        <div class="button-group">
            <button type="button" class="btn btn-cancel" onclick="window.location.href='index.jsp'">Annuler</button>
            <button type="submit" class="btn btn-update">Mettre à jour</button>
        </div>
    </form>
</div>
</body>
</html>