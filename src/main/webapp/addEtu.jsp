<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String login = null;
    if (session.getAttribute("user") != null) {
        login = (String) session.getAttribute("user");
    } else {
        response.sendRedirect("auth.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un étudiant</title>
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
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem;
            color: var(--text-color);
        }

        .container {
            background-color: var(--card-color);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 2.5rem;
            width: 100%;
            max-width: 500px;
            position: relative;
            animation: slideUp 0.5s ease;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border-radius: var(--radius) var(--radius) 0 0;
        }

        h1 {
            font-size: 1.875rem;
            font-weight: 700;
            margin-bottom: 0.75rem;
            text-align: center;
            color: var(--text-color);
        }

        .user-info {
            background: var(--card-color);
            padding: 0.75rem 1.5rem;
            border-radius: var(--radius);
            font-size: 0.875rem;
            color: var(--text-color);
            box-shadow: var(--shadow);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 2rem;
        }

        .user-info::before {
            content: '👤';
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

        input, select {
            width: 100%;
            padding: 0.875rem 1rem;
            border: 2px solid var(--border-color);
            border-radius: var(--radius);
            font-size: 1rem;
            color: var(--text-color);
            transition: var(--transition);
            background-color: #f8fafc;
        }

        input:focus, select:focus {
            outline: none;
            border-color: var(--primary-color);
            background-color: #ffffff;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%232563eb'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 1.5em;
            padding-right: 2.5rem;
        }

        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        button {
            flex: 1;
            padding: 0.875rem;
            border: none;
            border-radius: var(--radius);
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
        }

        .btn-submit {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-submit:hover {
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

        .logout {
            margin-top: 1.5rem;
            color: var(--text-secondary);
            text-decoration: none;
            font-size: 0.875rem;
            transition: var(--transition);
        }

        .logout:hover {
            color: var(--secondary-color);
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

            .container {
                padding: 1.5rem;
            }

            .button-group {
                flex-direction: column-reverse;
            }

            .user-info {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Ajouter un étudiant</h1>
    <div class="user-info">
        <%= login %>
    </div>

    <form method="POST" action="addEtudiant" id="studentForm">
        <div class="form-group">
            <label for="nom">Nom complet</label>
            <input
                    type="text"
                    id="nom"
                    name="nom"
                    required
                    pattern="[A-Za-zÀ-ÿ\s-]+"
                    title="Veuillez entrer un nom valide"
                    placeholder="Entrez le nom complet">
        </div>

        <div class="form-group">
            <label for="date_naissance">Date de naissance</label>
            <input
                    type="date"
                    id="date_naissance"
                    name="date_naissance"
                    required>
        </div>

        <div class="form-group">
            <label for="sexe">Sexe</label>
            <select id="sexe" name="sexe" required>
                <option value="">Sélectionnez une option</option>
                <option value="M">Homme</option>
                <option value="F">Femme</option>
            </select>
        </div>

        <div class="button-group">
            <button type="button" class="btn-cancel" onclick="window.location.href='index.jsp'">Annuler</button>
            <button type="submit" class="btn-submit">Ajouter l'étudiant</button>
        </div>
    </form>
</div>

<a href="logout" class="logout">Se déconnecter</a>

<script>
    document.getElementById('studentForm').addEventListener('submit', function(e) {
        const dateNaissance = new Date(document.getElementById('date_naissance').value);
        const aujourdHui = new Date();
        const age = aujourdHui.getFullYear() - dateNaissance.getFullYear();

        if (age < 16 || age > 100) {
            e.preventDefault();
            alert('L\'âge doit être compris entre 16 et 100 ans.');
        }
    });
</script>
</body>
</html>