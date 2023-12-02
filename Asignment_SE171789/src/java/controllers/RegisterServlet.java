/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import user.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.User;
import user.UserError;

/**
 *
 * @author Admin
 */
public class RegisterServlet extends HttpServlet {

    private static final String ERROR = "register.jsp";
    private static final String SUCCESS = "LoginServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            String id = request.getParameter("txtusername");
            String name = request.getParameter("txtfullname");
            String role = request.getParameter("txtrole");
            String password = request.getParameter("txtpassword");
            String confirm = request.getParameter("confirm");
              UserDao dao = new UserDao();
                boolean checkValidation = true;
            // Define the username pattern
            if (id.length() > 10 || id.length() < 2) {
                userError.setUserIDError("UserID [2,10]");
                checkValidation = false;
            }
            if (name.length() > 20 || name.length() < 5) {
                userError.setFullNameError("fullName [5,20]");
                checkValidation = false;
            }
            if (!confirm.equals(password)) {
                userError.setConfirmError("Password khong trung");
                checkValidation = false;
            }
            if (checkValidation) {
                User user = new User(id, name, role, password);
//                boolean checkInsert= dao.insert(user);
                boolean checkInsert = dao.insertUser(id, name, role, password);

                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Unknow error!");
                }

            } else {
                request.setAttribute("USER_ERROR", userError);

            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserIDError("Trung userID roi kia");
                request.setAttribute("USER_ERROR", userError);
            }
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
