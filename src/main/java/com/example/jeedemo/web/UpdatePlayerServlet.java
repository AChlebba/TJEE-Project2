package com.example.jeedemo.web;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.jeedemo.service.PersonManager;

@WebServlet(urlPatterns = "/updatePlayer/*")
public class UpdatePlayerServlet extends HttpServlet{

	@EJB
	private PersonManager personManager;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String link = request.getPathInfo();
		request.setAttribute("editedPlayer",
				personManager.getPersonById(Long.parseLong(link.substring(link.lastIndexOf("/") + 1, link.length()))));
		request.getRequestDispatcher("/player/edit.jsp").forward(request, response);
	}

}
