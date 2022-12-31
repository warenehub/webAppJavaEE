package com.post;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import conn.ConnexionBD;

/**
 * Servlet implementation class PostArticle
 */
@WebServlet("/PostArticle")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
	maxFileSize = 1024 * 1024 * 10,
	maxRequestSize = 1024 * 1024 * 50)

public class PostArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostArticle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String nom = request.getParameter("nom");
		Part part = request.getPart("photo");
		String fileName = extractFileName(part);
		String savePath = "C:\\Users\\HP-PC\\eclipse-workspace\\artisan\\src\\main\\webapp\\images"+ File.separator + fileName;
		//sFile fileSaveDir = new File(savePath);
		
		part.write(savePath);		
		Connection conn = ConnexionBD.seConnecter();
		try {
			PreparedStatement ps = conn.prepareStatement("INSERT INTO article(nom,nomImage,chemain)VALUES(?,?,?)");
			ps.setString(1, nom);
			ps.setString(2, fileName);
			ps.setString(3, savePath);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Bloc catch généré automatiquement
			e.printStackTrace();
			out.println(e);
		}
		
		request.setAttribute("erreur","Oeuvre ajouté avec succes !");
		
		this.getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
	}

	private String extractFileName(Part part) {
		// TODO Stub de la méthode généré automatiquement
		String retour = "";
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for(String s : items) {
			if(s.trim().startsWith("filename")) {
				retour = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return retour;
	}

}
