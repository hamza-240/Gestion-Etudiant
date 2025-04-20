package com.conxDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexionDB {
    private final static String DB_URL = "jdbc:mysql://localhost:3306/jee_etudiant";
    private final static String USER = "root";
    private final static String PASS = "Benaissa2003!";

    public static Connection getConnection() {
        Connection con = null;
        try {

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
