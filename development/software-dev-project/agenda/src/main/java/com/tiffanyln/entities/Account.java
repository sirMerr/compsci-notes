package com.tiffanyln.entities;

/**
 * This class models a user
 *
 * @author Tiffany Le-Nguyen
 * @version 0.1
 */
public class Account {
    private int accountId;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private int port;

    // Getters and setters
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    // Constructor
    public Account(int accountId, String firstName, String lastName, String email, String password, int port) {
        super();
        this.accountId = accountId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.port = port;
    }

    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", port=" + port +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Account)) return false;

        Account account = (Account) o;

        if (getAccountId() != account.getAccountId()) return false;
        if (getPort() != account.getPort()) return false;
        if (!getFirstName().equals(account.getFirstName())) return false;
        if (!getLastName().equals(account.getLastName())) return false;
        if (!getEmail().equals(account.getEmail())) return false;
        return getPassword().equals(account.getPassword());
    }

    @Override
    public int hashCode() {
        return getPassword().hashCode();
    }
}
