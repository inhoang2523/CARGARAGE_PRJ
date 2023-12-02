/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private static final String HOME_PAGE = "ViewCar";
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String LOGIN = "login";
    private static final String LOGIN_CONTROLLER = "LoginServlet";
    private static final String FIND = "find";
    private static final String SEARCH_CONTROLLER = "SearchCarServlet";
    private static final String LOAD = "load";
    private static final String MANAGECAR_CONTROLLER = "ManageCar";
    private static final String SEARCH = "txtsearch";
    private static final String SEARCH_USER = "SearchUser";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteServlet";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateServlet";
    private static final String UPDATE_CART = "Change";
    private static final String UPDATE_SERVLET = "UpdateQuantityServlet";
    private static final String CREATE = "create";
    private static final String REGISTER_CONTROLLER = "RegisterServlet";
    private static final String ADD = "addtocart";
    private static final String ADD_CONTROLLER = "AddToCartServlet";
    private static final String VIEW = "viewcar";
    private static final String VIEW_CAR = "ViewCarServlet";
    private static final String ORDER = "order";
    private static final String VIEW_HISTORY = "ViewHistoryServlet";
    private static final String VIEW_DETAIL_CART = "viewdetailcart";
    private static final String VIEW_CART = "CartDetail.jsp";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveCarServlet";
    private static final String CHECKOUT = "checkout";
    private static final String CHECKOUT_CONTROLLER = "checkout.jsp";
    private static final String VIEW_HOME = "search";
    private static final String VIEW_CAR_CONTROLLER = "ViewCar";
    private static final String USER = "user";
    private static final String USER_CONTROLLER = "UserHome";
    private static final String LOGIN_GG="Login with google";
    private static final String LOGIN_GG_CONTROLLER="https://accounts.google.com/o/oauth2/auth?scope=email"
            +"&redirect_uri=http://localhost:8080/Ass/LoginGoogle"
            +"&response_type=code" 
            +"&client_id=1062736715012-kbdbqvhjn2j188fqf0mjs8nlsebr8eq5.apps.googleusercontent.com&approval_prompt=force";
    
    
    
  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String ac = request.getParameter("action");
            if (ac == null) {
                url = HOME_PAGE;
            } else if (LOGIN.equals(ac)) {
                url = LOGIN_CONTROLLER;
            } else if (FIND.equals(ac)) {
                url = SEARCH_CONTROLLER;
            } else if (SEARCH.equals(ac)) {
                url = SEARCH_USER;
            } else if (LOAD.equals(ac)) {
                url = MANAGECAR_CONTROLLER;
            } else if (DELETE.equals(ac)) {
                url = DELETE_CONTROLLER;
            } else if (UPDATE.equals(ac)) {
                url = UPDATE_CONTROLLER;
            } else if (CREATE.equals(ac)) {
                url = REGISTER_CONTROLLER;
            } else if (ADD.equals(ac)) {
                url = ADD_CONTROLLER;
            } else if (VIEW.equals(ac)) {
                url = VIEW_CAR;
            } else if (ORDER.equals(ac)) {
                url = VIEW_HISTORY;
            } else if (VIEW_DETAIL_CART.equals(ac)) {
                url = VIEW_CART;
            } else if (REMOVE.equals(ac)) {
                url = REMOVE_CONTROLLER;
            } else if (CHECKOUT.equals(ac)) {
                url = CHECKOUT_CONTROLLER;
            } else if (VIEW_HOME.equals(ac)) {
                url = VIEW_CAR_CONTROLLER;
            } else if (UPDATE_CART.equals(ac)) {
                url = UPDATE_SERVLET;
            } else if (USER.equals(ac)) {
                url = USER_CONTROLLER;
            } else if (LOGIN_GG.equals(ac)) {
                  response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", LOGIN_GG_CONTROLLER);
            } else {
                request.setAttribute("ERROR", "Your ACTION is not support!");
            }

            }catch (Exception e) {
            e.printStackTrace();
        }finally {
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
