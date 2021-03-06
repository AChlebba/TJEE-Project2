package com.example.jeedemo.web;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.jeedemo.service.PersonManager;

@WebServlet(urlPatterns = "/addPlayer")
public class AddPlayerServlet extends HttpServlet{
    @EJB
    private PersonManager personManager;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("player/add.jsp").forward(request, response);
    }
}
