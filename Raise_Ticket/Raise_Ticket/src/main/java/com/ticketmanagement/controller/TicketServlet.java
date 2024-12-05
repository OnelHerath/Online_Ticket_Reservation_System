package com.ticketmanagement.controller;

import com.ticketmanagement.dao.TicketDAO;
import com.ticketmanagement.model.Ticket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/")
public class TicketServlet extends HttpServlet {
    private TicketDAO ticketDAO;

    public void init() {
        ticketDAO = new TicketDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertTicket(request, response);
                    break;
                case "/delete":
                    deleteTicket(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateTicket(request, response);
                    break;
                default:
                    listTickets(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    //display list of tickets
    private void listTickets(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Ticket> listTickets = ticketDAO.getAllTickets();
        request.setAttribute("listTickets", listTickets);
        request.getRequestDispatcher("viewdetails.jsp").forward(request, response);
    }

    //create new ticket
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    //edit the ticket
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ticket existingTicket = ticketDAO.getTicketById(id);
        request.setAttribute("ticket", existingTicket);
        request.getRequestDispatcher("editticket.jsp").forward(request, response);
    }

    //insert a new ticket
    private void insertTicket(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String reservationId = request.getParameter("reservationId");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String message = request.getParameter("message");
        Ticket newTicket = new Ticket(reservationId, fullName, email, phoneNumber, message);
        ticketDAO.insertTicket(newTicket);
        response.sendRedirect("list");
    }

    //update the ticket
    private void updateTicket(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String reservationId = request.getParameter("reservationId");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String message = request.getParameter("message");

        Ticket ticket = new Ticket(reservationId, fullName, email, phoneNumber, message);
        ticket.setId(id);
        ticketDAO.updateTicket(ticket);
        response.sendRedirect("list");
    }

    
    //delete the ticket
    private void deleteTicket(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ticketDAO.deleteTicket(id);
        response.sendRedirect("list");
    }
}