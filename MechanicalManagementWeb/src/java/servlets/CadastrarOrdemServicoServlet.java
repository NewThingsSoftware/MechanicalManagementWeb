/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.OrdemServico;
import daos.OrdemServicoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.beans.editors.IntEditor;

/**
 *
 * @author Bruno
 */
@WebServlet(name = "CadastrarOrdemServicoServlet", urlPatterns = {"/CadastrarOrdemServicoServlet"})
public class CadastrarOrdemServicoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CadastrarOrdemServicoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                OrdemServico ordemServico = new OrdemServico();
                ordemServico.setData(new java.sql.Date(
                        new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("data")).getTime()));
                ordemServico.setDescricao(request.getParameter("descricao"));
                ordemServico.setCodVeiculo(Integer.parseInt(request.getParameter("veiculo")));
                ordemServico.setCodMecanico(Integer.parseInt(request.getParameter("mecanico")));
                OrdemServicoDAO ordemServicoDAO = new OrdemServicoDAO();
                ordemServicoDAO.incluirOrdemServico(ordemServico);
                
                response.sendRedirect("visualizarOrdemServico.jsp");
                
            } catch (ParseException ex) {
                out.println("<h1>Data informada com formato errado</h1>");
                out.println("<br />");
                out.println("<a href=\"criaOrdemServico.jsp\">Voltar para o cadastro</a>");
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
