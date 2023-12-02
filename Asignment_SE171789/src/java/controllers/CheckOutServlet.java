/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import order.OrderDao;
import user.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class CheckOutServlet extends HttpServlet {



    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    //b1: check login
                    HttpSession session=request.getSession();
                    User us=(User) session.getAttribute("loginUser");
                    if(us==null){
                         response.sendRedirect("login.jsp");
                    }
                    else{
                        //b2: lay user id cua ng login
                        String userid=us.getId();
                        HashMap<String, Integer> cart=(HashMap<String, Integer>) session.getAttribute("cart");
                        //b3: chen 1 recored vao bang order
                        //b4: lay orderid cua b3
                        //b5: duyet cart de chen orderdetail
                        int kq=OrderDao.insertOrder(userid, cart);
                        //b6: xoa gio hang trong session
                        session.removeAttribute("cart");
                        response.sendRedirect("Cartdetail.jsp");
                    }
                }catch(Exception e){
                            e.printStackTrace();                            
    }

  
}
}
