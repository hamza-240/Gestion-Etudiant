/**
 * Copyright (c) 2023 Votre Nom
 * MIT License
 */
package com.controller;

import com.conxDB.ConnexionDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/Delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {

            Connection con = null;
            PreparedStatement stmt = null;
           try {
               con= ConnexionDB.getConnection();
               String sql = "delete from etudiant where id= ?";
               stmt = con.prepareStatement(sql);
               stmt.setInt(1, Integer.parseInt(req.getParameter("id")));
               if (stmt.executeUpdate()>0) {
                   System.out.println("Suppression est fate :)");
                   resp.sendRedirect("index.jsp");
               }
           } catch (SQLException e) {
               throw new RuntimeException(e);
           }
        }else
            resp.sendRedirect("auth.jsp");
    }
}
