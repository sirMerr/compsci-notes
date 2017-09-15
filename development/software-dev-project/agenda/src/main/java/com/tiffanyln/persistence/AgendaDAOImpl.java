package com.tiffanyln.persistence;

import com.sun.org.apache.regexp.internal.RE;
import com.tiffanyln.entities.Account;
import com.tiffanyln.entities.Appointment;
import com.tiffanyln.entities.Group;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * This class has the implementations for the Agenda,
 * including SQL queries.
 *
 * @author Tiffany Le-Nguyen
 * @version 0.1
 */
public class AgendaDAOImpl {
    private final String dbUrl= "jdbc:mysql://localhost:3306/AGENDADB?autoReconnect=true&useSSL=false";
    private final String dbUsername= "root";
    private final String dbPassword= "cookiedough";
    private final Logger log = LoggerFactory.getLogger(
            this.getClass().getName());

    // Default Constructor
    public AgendaDAOImpl() {
        super();
    }

    /* Find Methods */
    /**
     * Retrieve all accounts and make a list of accounts
     *
     * @return ArrayList of Account objects
     * @throws SQLException
     */
    public List<Account> findAll() throws SQLException {
        List<Account> rows = new ArrayList<>();

        String selectQuery = "SELECT id,lastName,firstName,email,port FROM account";
        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             // You must use PreparedStatements to guard against SQL Injection
             PreparedStatement pStatement = connection.prepareStatement(selectQuery);
             ResultSet resultSet = pStatement.executeQuery()) {
            while (resultSet.next()) {
                Account account = makeAccount(resultSet);
                findAllGroups(account);
                rows.add(account);
            }
        }
        return rows;
    }

    /**
     * Finds all groups for an account, and all appointments for each group,
     *
     * @param account
     * @return
     * @throws SQLException
     */
    public void findAllGroups(Account account) throws SQLException {
        String selectQuery = "SELECT id, account_id, rgb FROM group_record WHERE account_id = ?";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             PreparedStatement pStatement = connection.prepareStatement(selectQuery)) {
            pStatement.setInt(1, account.getAccountId());
            try (ResultSet resultSet = pStatement.executeQuery()) {
                while (resultSet.next()) {
                    account.getGroups().add(makeGroup(resultSet));
                }
            }
        }
    }

    /**
     * Finds all Appointments based on a group
     * @param group
     * @throws SQLException
     */
    public void findAllAppointments(Group group) throws SQLException {
        String selectQuery = "SELECT id, title, location, start_time, " +
                "end_time, details, whole_day, alarm_reminder, reminder_interval " +
                "FROM appointment WHERE group_id=?";

        try (Connection connection = DriverManager.getConnection(dbUrl,dbUsername, dbPassword);
             PreparedStatement pStatement = connection.prepareStatement(selectQuery)) {
            pStatement.setInt(1,group.getGroupId());
            try (ResultSet resultSet = pStatement.executeQuery()) {
                while (resultSet.next()) {
                    group.getAppointmentList().add(makeAppointment(resultSet));
                }
            }

        }
    }

    /* Make methods */
    /**
     * Initializes an Account object with a result set
     * @param rs
     * @return Account
     * @throws SQLException
     */
    public Account makeAccount(ResultSet rs) throws SQLException {
        Account account = new Account();
        account.setLastName(rs.getString("lastname"));
        account.setFirstName(rs.getString("firstname"));
        account.setAccountId(rs.getInt("account_id"));
        account.setPort(rs.getInt("port"));
        account.setEmail(rs.getString("email"));
//        account.setPassword(rs.getString("email_password"));
        return account;
    }

    /**
     * Initializes a Group object with a result set
     * @param rs
     * @return Group
     * @throws SQLException
     */
    public Group makeGroup(ResultSet rs) throws SQLException {
        Group group = new Group();
        group.setAccountId(rs.getInt("account_id"));
        group.setGroupId(rs.getInt("group_id"));
        group.setTitle(rs.getString("title"));
        group.setRgb(rs.getDouble("rgb"));
        return group;
    }

    /**
     * Initializes an Appointment object with a result set
     * @param rs
     * @return Appointment
     * @throws SQLException
     */
    public Appointment makeAppointment(ResultSet rs) throws SQLException {
        Appointment appointment = new Appointment();
        appointment.setAppointmentId(rs.getInt("appointment_id"));
        appointment.setAlarmReminder(rs.getBoolean("alarm_reminder"));
        appointment.setDetails(rs.getString("details"));
        appointment.setEndDate(rs.getTimestamp("end_date"));
        appointment.setStartDate(rs.getTimestamp("start_date"));
        appointment.setFullDay(rs.getBoolean("whole_day"));
        appointment.setGroupId(rs.getInt("group_id"));
        appointment.setTitle(rs.getString("title"));
        appointment.setLocation(rs.getString("location"));
        appointment.setReminderInterval(rs.getInt("reminder_interval"));

        return appointment;
    }

    /* Create methods */
    /**
     * Create a Account record
     *
     * @param account
     * @return number of records created, should be 0 or 1
     * @throws SQLException
     */
    public int create(Account account) throws SQLException {
        int records;

        String sql = "INSERT INTO account (lastname, firstname, email, email_password, port)" +
                "values (?, ?, ?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             // You must use PreparedStatements to guard against SQL Injection
             PreparedStatement pStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
            pStatement.setString(1, account.getLastName());
            pStatement.setString(2, account.getFirstName());
            pStatement.setString(3, account.getEmail());
            pStatement.setString(4, account.getPassword());
            pStatement.setInt(5, account.getPort());

            records = pStatement.executeUpdate();
            ResultSet rs = pStatement.getGeneratedKeys();
            int recordNum = -1;
            if (rs.next()) {
                recordNum = rs.getInt(1);
            }
            account.setAccountId(recordNum);
            log.debug("New record is " + account.toString());
        }
        return records;
    }

    /**
     * Create a Account record
     *
     * @param group
     * @return number of records created, should be 0 or 1
     * @throws SQLException
     */
    public int create(Group group) throws SQLException {
        int records;

        String sql = "INSERT INTO group_record (lastname, firstname, email, email_password, port)" +
                "values (?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             // You must use PreparedStatements to guard against SQL Injection
             PreparedStatement pStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
            pStatement.setString(1, group.getTitle());
            pStatement.setInt(2, group.getAccountId());
            pStatement.setString(3, group.getEmail());
            pStatement.setString(4, group.getPassword());
            pStatement.setInt(5, group.getPort());

            records = pStatement.executeUpdate();
            ResultSet rs = pStatement.getGeneratedKeys();
            int recordNum = -1;
            if (rs.next()) {
                recordNum = rs.getInt(1);
            }
            group.setAccountId(recordNum);
            log.debug("New record is " + group.toString());
        }
        return records;
    }
}
