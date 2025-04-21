/**
 * Copyright (c) 2023 Votre Nom
 * MIT License
 */
package com.controller;

import com.conxDB.ConnexionDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

public class AddEtudiant extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("addEtu.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session != null) {
            String nom = req.getParameter("nom");
            String date = req.getParameter("date_naissance");
            String sexe =req.getParameter("sexe");
            Connection con = null;
            PreparedStatement pst = null;
            try {
                con= ConnexionDB.getConnection();
                String sql="insert into etudiant  (nom, date_naissance, sexe) values(?,?,?)";
                PreparedStatement s = con.prepareStatement(sql);

                s.setString(1, nom);
                s.setString(2, date);
                s.setString(3, sexe);
                if (s.executeUpdate()>0){
                    System.out.println("✅ insertion réussie !");
                    resp.sendRedirect("index.jsp");
                }else {
                    System.out.println("❌ Erreur : insertion échoué :(");
                    resp.sendRedirect("addEtu.jsp");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        else
            resp.sendRedirect("auth.jsp");
    }
}
