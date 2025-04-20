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
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         HttpSession session = req.getSession(false);
         if (session != null) {
             Connection conn=null;
             PreparedStatement ps=null;
             ResultSet rs=null;
             try {
                 conn= ConnexionDB.getConnection();
                 String sql="select * from etudiant where id = ?";
                 ps=conn.prepareStatement(sql);
                 ps.setString(1,req.getParameter("id"));
                 rs=ps.executeQuery();
                 if(rs.next()) {


                     req.setAttribute("nom", rs.getString("nom"));
                     req.setAttribute("sexe", rs.getString("sexe"));
                     req.setAttribute("date", rs.getString("date_naissance"));
                     req.setAttribute("id", req.getParameter("id"));
                     req.getRequestDispatcher("update.jsp").forward(req, resp);
                 }else
                     resp.sendRedirect("index.jsp");
             } catch (SQLException e) {
                 throw new RuntimeException(e);
             }
         }else
             resp.sendRedirect("auth.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            Connection conn=null;
            PreparedStatement ps=null;
            ResultSet rs=null;
            try {
                conn= ConnexionDB.getConnection();
                String sql = "update etudiant set nom=?,sexe=?,date_naissance=? where id=?";
                ps=conn.prepareStatement(sql);
                ps.setString(1,req.getParameter("nom"));
                ps.setString(2,req.getParameter("sexe"));
                ps.setString(3,req.getParameter("date"));
                ps.setString(4,req.getParameter("id"));
                if (ps.executeUpdate()>0){
                    System.out.println("update success :) ");
                    resp.sendRedirect("index.jsp");
                }else {
                    System.out.println("update fail :) ");
                    resp.sendRedirect("index.jsp");
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else
            resp.sendRedirect("auth.jsp");
    }
}
