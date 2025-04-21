/**
 * Copyright (c) 2023 Votre Nom
 * MIT License
 */
package com.conxDB;

import io.github.cdimascio.dotenv.Dotenv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexionDB {
    private final static String DB_URL = "jdbc:mysql://localhost:3306/jee_etudiant";
    private final static String USER = "root";
    private  static String PASS ;

    public static Connection getConnection() {
        Connection con = null;
        try {
            // Charger les variables d'environnement à partir du fichier .env
            Dotenv dotenv = Dotenv.load();

            // Récupérer le mot de passe de la base de données
            PASS = dotenv.get("DB_PASSWORD");

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL,USER,PASS);
            System.out.println("✅ Connexion réussie !");
        } catch (ClassNotFoundException e) {
            System.out.println("❌ Erreur : Pilote JDBC non trouvé !");
            e.printStackTrace();  // Affiche l'erreur complète

        } catch (SQLException e) {
            System.out.println("❌ Erreur de connexion à la base de données !");
            e.printStackTrace();  // Affiche l'erreur SQL détaillée
        }
        return con;
    }
}
