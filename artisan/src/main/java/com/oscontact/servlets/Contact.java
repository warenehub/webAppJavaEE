package com.oscontact.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.ConnexionBD;

/**
 * Servlet implementation class Contact
 */
@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Contact() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		String nom = request.getParameter("nom");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		if(nom.equals("")) {
			request.setAttribute("erreur","Veillez entrer votre nom");
		}else if(email.equals("")) {
			request.setAttribute("erreur","Veillez entrer votre email");
		}else if(message.equals("")) {
			request.setAttribute("erreur","Veillez entrer votre message");
		}else {
			request.setAttribute("erreur", nom);
			
			Connection conn = ConnexionBD.seConnecter();
			try {
				PreparedStatement ps = conn.prepareStatement("INSERT INTO contact(nom,email,message)VALUES(?,?,?)");
				ps.setString(1, nom);
				ps.setString(2, email);
				ps.setString(3, message);
				
				ps.executeUpdate();
				request.setAttribute("erreur", "Message envoyé avec succes !");
			} catch (SQLException e) {
				// TODO Bloc catch généré automatiquement
				e.printStackTrace();
			}
		}
		
		this.getServletContext().getRequestDispatcher("/contact.jsp").forward(request, response);
	}

}
