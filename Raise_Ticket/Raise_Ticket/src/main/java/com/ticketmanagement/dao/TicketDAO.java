package com.ticketmanagement.dao;

import com.ticketmanagement.model.Ticket;
import com.ticketmanagement.util.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketDAO {

	//insert data function
    public void insertTicket(Ticket ticket) throws SQLException {
        String sql = "INSERT INTO tickets (reservation_id, full_name, email, phone_number, message) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, ticket.getReservationId());
            pstmt.setString(2, ticket.getFullName());
            pstmt.setString(3, ticket.getEmail());
            pstmt.setString(4, ticket.getPhoneNumber());
            pstmt.setString(5, ticket.getMessage());
            pstmt.executeUpdate();
        }
    }

    
    //retrieve and display data function
    public List<Ticket> getAllTickets() throws SQLException {
        List<Ticket> tickets = new ArrayList<>();
        String sql = "SELECT * FROM tickets ORDER BY created_at DESC";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setId(rs.getInt("id"));
                ticket.setReservationId(rs.getString("reservation_id"));
                ticket.setFullName(rs.getString("full_name"));
                ticket.setEmail(rs.getString("email"));
                ticket.setPhoneNumber(rs.getString("phone_number"));
                ticket.setMessage(rs.getString("message"));
                ticket.setCreatedAt(rs.getTimestamp("created_at"));
                tickets.add(ticket);
            }
        }
        return tickets;
    }

    //retrieve specific data though id
    public Ticket getTicketById(int id) throws SQLException {
        String sql = "SELECT * FROM tickets WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Ticket ticket = new Ticket();
                    ticket.setId(rs.getInt("id"));
                    ticket.setReservationId(rs.getString("reservation_id"));
                    ticket.setFullName(rs.getString("full_name"));
                    ticket.setEmail(rs.getString("email"));
                    ticket.setPhoneNumber(rs.getString("phone_number"));
                    ticket.setMessage(rs.getString("message"));
                    ticket.setCreatedAt(rs.getTimestamp("created_at"));
                    return ticket;
                }
            }
        }
        return null;
    }

    //update data function
    public void updateTicket(Ticket ticket) throws SQLException {
        String sql = "UPDATE tickets SET reservation_id = ?, full_name = ?, email = ?, phone_number = ?, message = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, ticket.getReservationId());
            pstmt.setString(2, ticket.getFullName());
            pstmt.setString(3, ticket.getEmail());
            pstmt.setString(4, ticket.getPhoneNumber());
            pstmt.setString(5, ticket.getMessage());
            pstmt.setInt(6, ticket.getId());
            pstmt.executeUpdate();
        }
    }

    
    //delete data function
    public void deleteTicket(int id) throws SQLException {
        String sql = "DELETE FROM tickets WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}