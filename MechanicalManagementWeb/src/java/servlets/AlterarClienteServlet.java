/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.Cliente;
import daos.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bruno
 */
@WebServlet(name = "AlterarClienteServlet", urlPatterns = {"/AlterarClienteServlet"})
public class AlterarClienteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Alterar Cliente</title>");
            out.println("<link rel=\"stylesheet\" href=\"Estilo/estilo.css\" type=\"text/css\" media=\"screen\">");
            out.println("</head>");
            out.println("<body>");

            Cliente cliente = new Cliente();
            cliente.setCodCliente(Integer.parseInt(request.getParameter("codCliente")));
            cliente.setNome(request.getParameter("nome"));
            cliente.setCpf(request.getParameter("cpf"));
            cliente.setRg(request.getParameter("rg"));

            ClienteDAO clienteDAO = new ClienteDAO();
            try {
                clienteDAO.alterarCliente(cliente);
                response.sendRedirect("visualizarCliente.jsp");
            } catch (SQLException ex) {
                out.println("<div align=\"center\">");
                out.println("<h1>CPF já existente no sistema!</h1>");
                out.println("<fieldset style=\"width: 40%\"><legend>Links</legend>");
                out.println("<a href=\"cliente.jsp?codCliente="+cliente.getCodCliente()+"\">Voltar</a>");
                out.println("</fieldset>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
