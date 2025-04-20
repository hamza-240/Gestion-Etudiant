<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Variables CSS */
        :root {
            --primary-color: #4CAF50;
            --primary-hover: #45a049;
            --secondary-color: #f44336;
            --secondary-hover: #da190b;
            --background-color: #f4f6f9;
            --card-color: #ffffff;
            --text-color: #333333;
            --border-color: #e0e0e0;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background-color);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-form {
            background-color: var(--card-color);
            border-radius: 15px;
            box-shadow: var(--shadow);
            padding: 2rem;
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.5s ease;
        }

        .login-form h2 {
            color: var(--text-color);
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .login-form input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            font-size: 1rem;
            color: var(--text-color);
            transition: var(--transition);
            margin-bottom: 1rem;
        }

        .login-form input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .remember-me input {
            width: auto;
            margin-right: 0.5rem;
        }

        .remember-me label {
            font-size: 0.9rem;
            color: var(--text-color);
        }

        .login-form button {
            width: 100%;
            padding: 0.8rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
        }

        .login-form button:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
        }

        .login-form button:active {
            transform: translateY(0);
        }

        /* Animation pour le formulaire */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .login-form {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
<!-- Formulaire de connexion -->
<div class="login-form">
    <h2>Connexion</h2>
    <form action="login" method="POST">
        <input type="text" name="username" placeholder="Nom d'utilisateur" required>
        <input type="password" name="password" placeholder="Mot de passe" required>
        <div class="remember-me">
            <input type="checkbox" name="rememberMe" id="rememberMe">
            <label for="rememberMe">Se souvenir de moi</label>
        </div>
        <button type="submit">Se connecter</button>
    </form>
</div>
</body>
</html>