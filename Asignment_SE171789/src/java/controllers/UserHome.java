/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.User;
import user.UserDao;

/**
 *
 * @author YEN HOANG
 */
public class UserHome extends HttpServlet {

    private static final String US_PAGE = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = US_PAGE;
        try {
            String us = request.getParameter("txtusername");
            String password = request.getParameter("txtpassword");
            UserDao dao = new UserDao();
            User loginUser = dao.checkLogin(us, password);

            if (loginUser == null) {
                request.setAttribute("ERROR", "Incorrect userID or password");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("fullName", loginUser.getName());
                session.setAttribute("userID", loginUser.getId());
                session.setAttribute("***", loginUser.getPassword());
                session.setAttribute("loginUser", loginUser);
                if (loginUser.getRole().equalsIgnoreCase("US")) {
                    url = US_PAGE;
                } else {
                    request.setAttribute("ERROR", "Your role is not support");
                }
            }
        } catch (Exception e) {
            log("Error at LoginServlet: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
