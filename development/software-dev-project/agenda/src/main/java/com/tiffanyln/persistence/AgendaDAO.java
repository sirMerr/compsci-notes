package com.tiffanyln.persistence;

import com.tiffanyln.entities.Account;
import com.tiffanyln.entities.Appointment;
import com.tiffanyln.entities.Group;
import java.sql.SQLException;
import java.util.List;

/**
 * Interface for CRUD methods
 *
 * @author Tiffany Le-Nguyen
 * @version 0.1
 */
public interface AgendaDAO {

    // Create
    public int create(Account account) throws SQLException;

    public int create(Appointment appointment) throws SQLException;

    public int create(Group group) throws SQLException;

    // Read
    public List<Account> findAll() throws SQLException;

    public Account findById(int id) throws SQLException;

    public List<Appointment> findAllAppointments(int accountId) throws SQLException;

    public List<Appointment> findAllAppointments(int accountId, int groupId) throws SQLException;

    public Appointment findAppointmentById(int appointmentId) throws SQLException;

    public Group findGroupById(int appointmentId) throws SQLException;

    // Update

    public int update(Account account) throws SQLException;

    public int update(Appointment appointment) throws SQLException;

    public int update(Group group) throws SQLException;

    // Delete
    public int deleteAccount(int id) throws SQLException;

    public int deleteAppointment(int id) throws SQLException;

    public int deleteGroup(int id) throws SQLException;
}