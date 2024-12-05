package com.ticketmanagement.model;

import java.sql.Timestamp;

public class Ticket {
    private int id;
    private String reservationId;
    private String fullName;
    private String email;
    private String phoneNumber;
    private String message;
    private Timestamp createdAt;

    // Constructors
    public Ticket() {}

    public Ticket(String reservationId, String fullName, String email, String phoneNumber, String message) {
        this.reservationId = reservationId;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.message = message;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReservationId() {
        return reservationId;
    }

    public void setReservationId(String reservationId) {
        this.reservationId = reservationId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}