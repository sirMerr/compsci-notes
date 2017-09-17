import com.tiffanyln.entities.Account;
import com.tiffanyln.persistence.AgendaDAOImpl;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

import static org.junit.Assert.assertEquals;

/**
 * Testing database
 * @author Tiffany Le-Nguyen
 * @version 0.1
 */
public class TestDatabase {
    private final String dbUrl= "jdbc:mysql://localhost:3306/AGENDADB?autoReconnect=true&useSSL=false";
    private final String dbUsername= "root";
    private final String dbPassword= "cookiedough";

    private final Logger log = LoggerFactory.getLogger(
            this.getClass().getName());

    /**
     * This will test if the expected number of records are in the database
     *
     * @throws SQLException
     */
    @Test
    public void testFindAllAccounts() throws SQLException {
        AgendaDAOImpl agendaDAO = new AgendaDAOImpl();
        List<Account> accounts = agendaDAO.findAllAccounts();
        // Nothing to do with the test
        displayAll(accounts);

        assertEquals("# of accounts", 5, accounts.size());
    }

    /**
     * This will insert aan account, retrieve the just inserted account and compare
     * the inserted and retrieved objects
     *
     * @throws SQLException
     */
    @Test
    public void testCreate() throws SQLException {
        AgendaDAOImpl accountDAO = new AgendaDAOImpl();

        // Instantiate new Account
        Account a1 = new Account();
        a1.setFirstName("Bob");
        a1.setLastName("Smith");
        a1.setEmail("bob.smith@gmail.com");
        a1.setPassword("123");
        a1.setPort(15);

        // Create Account
        accountDAO.create(a1);

        // Check if insert worked
        Account a2 = accountDAO.findById(a1.getAccountId());
        assertEquals("A record was not created", a1, a2);
    }

    /**
     * A utility method for displaying all the records
     *
     * @param accounts list of Account
     */
    private void displayAll(List<Account> accounts) {
        // Loop through each account, display and return it
        accounts.stream().map(account -> {
            System.out.println("" + account);
            return account;
        }).forEach(account -> {
            // Loop through each group, display and return it
            account.getGroups().stream().map(group -> {
                System.out.println("" + group);
                return group;
            }).forEach(group -> {
                // Loop through each appointment and display them
                group.getAppointmentList().forEach(appointment -> {
                    System.out.println("" + appointment);
                });
            });
        });
    }

    /**
     * This routine recreates the database before every test. This makes sure
     * that a destructive test will not interfere with any other test. Does not
     * support stored procedures.
     *
     * This routine is courtesy of Bartosz Majsak, the lead Arquillian developer
     * at JBoss
     */
    @Before
    public void seedDatabase() {
        log.info("Seeding Database");
        final String seedDataScript = loadAsString("CreateAgendaTables.sql");
        try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword)) {
            for (String statement : splitStatements(new StringReader(
                    seedDataScript), ";")) {
                connection.prepareStatement(statement).execute();
            }
        } catch (SQLException e) {
            throw new RuntimeException("Failed seeding database", e);
        }
    }


    /**
     * The following methods support the seedDatabase method
     * @param path of file
     * @return input
     */
    private String loadAsString(final String path) {
        try (InputStream inputStream = Thread.currentThread()
                .getContextClassLoader().getResourceAsStream(path);
             Scanner scanner = new Scanner(inputStream);) {
            return scanner.useDelimiter("\\A").next();
        } catch (IOException e) {
            throw new RuntimeException("Unable to close input stream.", e);
        }
    }

    /**
     * The following methods support the seedDatabase method
     * @param reader Reader
     * @param statementDelimiter delimiter character (always ;)
     * @return
     */
    private List<String> splitStatements(Reader reader,
                                         String statementDelimiter) {
        // New buffer and prep
        final BufferedReader bufferedReader = new BufferedReader(reader);
        final StringBuilder sqlStatement = new StringBuilder();
        final List<String> statements = new LinkedList<>();

        try {
            String line;
            // While there are more lines, split statements
            // and format
            while ((line = bufferedReader.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty() || isComment(line)) {
                    continue;
                }
                sqlStatement.append(line);
                if (line.endsWith(statementDelimiter)) {
                    statements.add(sqlStatement.toString());
                    sqlStatement.setLength(0);
                }
            }
            return statements;
        } catch (IOException e) {
            throw new RuntimeException("Failed parsing sql", e);
        }
    }

    /**
     * The following methods support the splitStatements method
     * @param line strings of a line in the file
     * @return true if it's a comment
     */
    private boolean isComment(final String line) {
        return line.startsWith("--") || line.startsWith("//")
                || line.startsWith("/*");
    }

}
