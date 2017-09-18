package com.tiffanyln.persistence;

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
     * @throws SQLException when unsuccessful
     */
    public List<Account> findAllAccounts() throws SQLException {
        List<Account> accounts = new ArrayList<>();

        String selectQuery = "SELECT id,lastName,firstName,email, email_password, port FROM account";
        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             // You must use PreparedStatements to guard against SQL Injection
             PreparedStatement pStatement = connection.prepareStatement(selectQuery);
             ResultSet resultSet = pStatement.executeQuery()) {
            while (resultSet.next()) {
                Account account = makeAccount(resultSet);
                findAllGroups(account);
                log.debug("Account in all accounts : " + account.toString());
                accounts.add(account);
            }
        }
        return accounts;
    }

    public Account findAccountById(int id) throws SQLException {
        Account account = new Account();
        log.debug("Id: " + id);

        String selectQuery= "SELECT id, lastName, firstName, email, email_password, port FROM ACCOUNT WHERE id=?";

        try (Connection connection = DriverManager.getConnection(dbUrl,dbUsername, dbPassword);
             PreparedStatement pStatement = connection.prepareStatement(selectQuery)){
            pStatement.setInt(1,id);

            try(ResultSet resultSet = pStatement.executeQuery()){
                if (resultSet.next()) {
                    account = makeAccount(resultSet);
                    findAllGroups(account);

                    log.debug("New Account: " + account.toString());
                }
            }
        }

        return account;
    }

    public Group findGroupById(int id) throws SQLException {
        Group group = new Group();

        String selectQuery= "SELECT id, rgb_hex, name, account_id FROM GROUP_RECORD WHERE id=?";

        try (Connection connection = DriverManager.getConnection(dbUrl,dbUsername, dbPassword);
             PreparedStatement pStatement = connection.prepareStatement(selectQuery)){
            pStatement.setInt(1,id);

            try (ResultSet resultSet = pStatement.executeQuery()){
                if (resultSet.next()) {
                    group = makeGroup(resultSet);
                    findAllAppointments(group);
                }
            }
        }

        return group;
    }

    public Appointment findAppointmentById(int id) throws SQLException {
        Appointment appointment = new Appointment();

        String selectQuery= "SELECT id, title, location, start_time, " +
                "end_time, details, whole_day, alarm_reminder, reminder_interval " +
                "FROM APPOINTMENT WHERE id=?";

        try (Connection connection = DriverManager.getConnection(dbUrl,dbUsername, dbPassword);
             PreparedStatement pStatement = connection.prepareStatement(selectQuery)){
            pStatement.setInt(1,id);

            try (ResultSet resultSet = pStatement.executeQuery()){
                if (resultSet.next()) {
                    appointment = makeAppointment(resultSet);
                }
            }
        }

        return appointment;
    }

    /**
     * Finds all groups for an account, and all appointments for each group,
     *
     * @param account Account
     * @throws SQLException when unsuccessful
     */
    public List<Group> findAllGroups(Account account) throws SQLException {
        String selectQuery = "SELECT id, account_id, name, rgb_hex FROM GROUP_RECORD WHERE account_id = ?";
        ArrayList<Group> groups = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             PreparedStatement pStatement = connection.prepareStatement(selectQuery)) {
            pStatement.setInt(1, account.getAccountId());
            try (ResultSet resultSet = pStatement.executeQuery()) {
                while (resultSet.next()) {
                        log.debug("makeGroup: " + makeGroup(resultSet));
                        account.getGroups().add(makeGroup(resultSet));

                        groups.add(makeGroup(resultSet));
                        log.debug("Account with groups: " + account.toString());
                }
            }
        }
        log.debug("Groups: " + groups);
        return groups;
    }

    /**
     * Finds all Appointments based on a group
     * @param group Group
     * @throws SQLException when unsuccessful
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
     * @param rs Resultset
     * @return Account
     * @throws SQLException when unsuccessful
     */
    public Account makeAccount(ResultSet rs) throws SQLException {
        Account account = new Account();
        account.setLastName(rs.getString("lastname"));
        account.setFirstName(rs.getString("firstname"));
        account.setAccountId(rs.getInt("id"));
        account.setPort(rs.getInt("port"));
        account.setEmail(rs.getString("email"));
        account.setPassword(rs.getString("email_password"));
        return account;
    }

    /**
     * Initializes a Group object with a result set
     * @param rs Resultset
     * @return Group
     * @throws SQLException when unsuccessful
     */
    public Group makeGroup(ResultSet rs) throws SQLException {
        Group group = new Group();
        group.setAccountId(rs.getInt("account_id"));
        group.setGroupId(rs.getInt("id"));
        group.setTitle(rs.getString("name"));
        group.setRgb(rs.getString("rgb_hex"));

        log.debug("Made group" + group.toString());
        return group;
    }

    /**
     * Initializes an Appointment object with a result set
     * @param rs Resultset
     * @return Appointment
     * @throws SQLException when unsuccessful
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
     * @param account Account
     * @return number of records created, should be 0 or 1
     * @throws SQLException
     */
    public int create(Account account) throws SQLException {
        int records;

        String sql = "INSERT INTO ACCOUNT (lastname, firstname, email, email_password, port)" +
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
            log.debug("New Account is " + account.toString());
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

        String sql = "INSERT INTO GROUP_RECORD (name, account_id, rgb_hex)" +
                "values (?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             // You must use PreparedStatements to guard against SQL Injection
             PreparedStatement pStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
            pStatement.setString(1, group.getTitle());
            pStatement.setInt(2, group.getAccountId());
            pStatement.setString(3, group.getRgb());

            records = pStatement.executeUpdate();
            ResultSet rs = pStatement.getGeneratedKeys();
            int recordNum = -1;
            if (rs.next()) {
                recordNum = rs.getInt(1);
            }
            group.setGroupId(recordNum);
            log.debug("New Group is " + group.toString());
        }
        return records;
    }

    public int create(Appointment appointment) throws SQLException {
        int records;

        String sql = "INSERT INTO APPOINTMENT (title, group_id, location, start_time, end_time, details, alarm_reminder, reminder_interval)" +
                "values (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             // You must use PreparedStatements to guard against SQL Injection
             PreparedStatement pStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pStatement.setString(1, appointment.getTitle());
            pStatement.setInt(2, appointment.getGroupId());
            pStatement.setString(3, appointment.getLocation());
            pStatement.setTimestamp(4, appointment.getStartDate());
            pStatement.setTimestamp(5, appointment.getEndDate());
            pStatement.setString(6, appointment.getLocation());
            pStatement.setString(7, appointment.getLocation());
            pStatement.setString(8, appointment.getLocation());


            records = pStatement.executeUpdate();
            ResultSet rs = pStatement.getGeneratedKeys();
            int recordNum = -1;
            if (rs.next()) {
                recordNum = rs.getInt(1);
            }
            appointment.setAppointmentId(recordNum);
            log.debug("New Appointment is " + appointment.toString());
        }
        return records;
    }

    /* Delete methods*/

    /**
     * Deletes an appointment
     * @param id appointment id
     * @return int if successful
     * @throws SQLException when unsuccessful
     */
    public int deleteAppointment(int id) throws SQLException {
        int records;

        String deleteSql= "DELETE FROM APPOINTMENT WHERE id=?";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             PreparedStatement pStatement = connection.prepareStatement(deleteSql, Statement.RETURN_GENERATED_KEYS)) {
            pStatement.setInt(1, id);

            records = pStatement.executeUpdate();
            log.debug("Deleted appointment with id " + id);
        }

        return records;
    }

    /**
     * This method delete a group and related tables.
     * This cascades so linked appointments also delete.
     * @param id group id
     * @return 1 if it succeeds, -1 if it doesn't
     * @throws SQLException if it fails
     */
    public int deleteGroup(int id) {
        int records;

        String deleteSql= "DELETE FROM GROUP_RECORD WHERE id=?";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             PreparedStatement pStatement = connection.prepareStatement(deleteSql, Statement.RETURN_GENERATED_KEYS)) {
            pStatement.setInt(1, id);

            records = pStatement.executeUpdate();
        } catch (SQLException err) {
            log.error("Unable to delete group with id=" + id);
            return -1;
        }

        return records;
    }

    /**
     * This method deletes an account and linked tables.
     * This cascades, so linked groups and appointments also delete.
     * @param id
     * @return
     * @throws SQLException
     */
    public int deleteAccount(int id) {
        int records;

        String deleteSql= "DELETE FROM ACCOUNT WHERE id=?";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             PreparedStatement pStatement = connection.prepareStatement(deleteSql, Statement.RETURN_GENERATED_KEYS)) {
            pStatement.setInt(1, id);

            records = pStatement.executeUpdate();
        } catch (SQLException err) {
            log.error("Unable to delete account with id=" + id);
            return -1;
        }

        return records;
    }

    /* Update methods */

    public int updateAccount(Account account) {
        int records;

        String updateQuery= "UPDATE ACCOUNT SET firstname=?, lastname=?, email=?, email_password=?, port=? WHERE id=?";

        try (Connection connection = DriverManager.getConnection(dbUrl,dbUsername, dbPassword);
             PreparedStatement pStatement = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS)){
            pStatement.setString(1,account.getFirstName());
            pStatement.setString(2,account.getLastName());
            pStatement.setString(3,account.getEmail());
            pStatement.setString(4,account.getPassword());
            pStatement.setInt(5,account.getPort());
            pStatement.setInt(6,account.getAccountId());

            records = pStatement.executeUpdate();
            log.debug("Updated account is " + account.toString());
        } catch(SQLException err) {
            log.error("Unable to update account with id=" + account.getAccountId());
            return -1;
        }

        return records;
    }

    public int updateGroup(Group group) throws SQLException {
        int records;

        String updateQuery = "UPDATE GROUP_RECORD SET name=?, account_id=?, rgb_hex=? WHERE id=?";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             // You must use PreparedStatements to guard against SQL Injection
             PreparedStatement pStatement = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);) {
            pStatement.setString(1, group.getTitle());
            pStatement.setInt(2, group.getAccountId());
            pStatement.setString(3, group.getRgb());

            records = pStatement.executeUpdate();
            log.debug("Updated group is " + group.toString());

        }
        return records;
    }

    public int updateAppointment(Appointment appointment) throws SQLException {
        int records;

        String sql = "UPDATE APPOINTMENT SET title=?, group_id=?, location=?, start_time=?, end_time=?, details=?, alarm_reminder=?, reminder_interval=?" +
                "WHERE id=?";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             // You must use PreparedStatements to guard against SQL Injection
             PreparedStatement pStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pStatement.setString(1, appointment.getTitle());
            pStatement.setInt(2, appointment.getGroupId());
            pStatement.setString(3, appointment.getLocation());
            pStatement.setTimestamp(4, appointment.getStartDate());
            pStatement.setTimestamp(5, appointment.getEndDate());
            pStatement.setString(6, appointment.getLocation());
            pStatement.setString(7, appointment.getLocation());
            pStatement.setString(8, appointment.getLocation());
            pStatement.setInt(9, appointment.getAppointmentId());

            records = pStatement.executeUpdate();
            log.debug("Updated Appointment is " + appointment.toString());
        }
        return records;
    }
}
