
package controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mylib.Constants;
import mylib.DBUtils;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import user.User;
import user.UserDao;
import user.UserGoogleDTO;

/**
 *
 * @author YEN HOANG
 */
public class LoginGoogle extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String PAGE = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;

        try {
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            UserGoogleDTO userGmail = getUserInfo(accessToken);

            String[] userGG = userGmail.getEmail().split("@");
            String userID = userGG[0];
            String fullName = userGG[0];
            String password = userGG[0];

            UserDao dao = new UserDao();
            boolean checkExisted = dao.checkExisted(userID);

            if (checkExisted) {
                
                User loginUser = dao.checkLogin(userID, password);

                if (loginUser == null) {
                    request.setAttribute("ERROR", "Incorrect userID or password");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", loginUser);

                    String roleID = loginUser.getRole();

                    if (roleID.equals("US")) {
                        url = PAGE;
                        request.setAttribute("loginUser", userID);
                    } else if (roleID.equals("AD")) {
                        url = PAGE;
                        request.setAttribute("loginUser", userID);
                    } else {
                        request.setAttribute("ERROR", "Your role is not supported!");
                    }
                }
            } else {
                String role = "US";
                boolean checkInsert = dao.insertUser(userID, fullName, role, password);
                User loginUser = new User(userID, fullName, role, password);
                if (checkInsert) {
                    HttpSession session = request.getSession();

                    session.setAttribute("LOGIN_USER", loginUser);
                    url = PAGE;
                    request.setAttribute("loginUser", userID);
                } else {
                    request.setAttribute("ERROR", "Unknown error!");
                }
            }
        } catch (Exception e) {
            log("Error at LoginGoogle: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class
        );
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class
        );

        return googlePojo;
    }

    public void saveUserToDatabase(UserGoogleDTO user) throws Exception {
        try {
            Connection connection = DBUtils.makeConnection();
            if (connection != null) {
                String sql = "INSERT INTO tblUsers (id, fullName,password,roleID) VALUES (?,?,1,US)";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, user.getId());
                preparedStatement.setString(2, user.getName());
                preparedStatement.setString(3, user.getEmail());

                preparedStatement.executeUpdate();

                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            Logger.getLogger(LoginGoogle.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            Logger.getLogger(LoginGoogle.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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
