/**
 * Copyright (c) 2023 Votre Nom
 * MIT License
 */
package com.controller;

import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.conxDB.ConnexionDB;
import java.io.IOException;

public class LoginServlet extends HttpServlet {


    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username =req.getParameter("username");
        String password =req.getParameter("password");
        try {
           Connection conn =  ConnexionDB.getConnection();
           String sql = "select * from user where login=? and password=?";
           PreparedStatement s = conn.prepareStatement(sql);
           s.setString(1,username);
           s.setString(2,password);
           ResultSet rs = s.executeQuery();
           if (rs.next()){
               session.setAttribute("user",username);
               session.setAttribute("password",password);
               resp.sendRedirect("index.jsp");
           }else
               resp.sendRedirect("auth.jsp");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("auth.jsp").forward(req, resp);
    }
}
