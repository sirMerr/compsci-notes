package com.tiffanyln.persistence;

import com.tiffanyln.entities.Account;
import com.tiffanyln.entities.Appointment;
import com.tiffanyln.entities.Group;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

    /**
     * Retrieve all accounts and make a list of accounts
     *
     * @return ArrayList of Account objects
     * @throws SQLException
     */
    @Override
    public List<Account> findAll() throws SQLException {
        List<Account> rows = new ArrayList<>();

        String selectQuery = "SELECT accountId,lastName,firstName,email,port FROM account";
        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
             // You must use PreparedStatements to guard against SQL Injection
             PreparedStatement pStatement = connection.prepareStatement(selectQuery);
             ResultSet resultSet = pStatement.executeQuery()) {
            while (resultSet.next()) {
                Account gamer = makeAccount(resultSet);
                findAllGames(gamer);
                rows.add(gamer);
            }
        }
        return rows;
    }

    public Account makeAccount(ResultSet rs) {

    }
}
