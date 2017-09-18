package com.tiffanyln.entities;

import java.util.ArrayList;
import java.util.List;

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
    private List<Group> groups;

    // Getters and setters
    public List<Group> getGroups() {
        return groups;
    }

    public void setGroups(List<Group> groups) {
        this.groups = groups;
    }
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

    public Account() {
        this(-1, "","", "","", -1 );
        this.groups = new ArrayList<>();
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
        this.groups = new ArrayList<>();
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
                ", groups=" + groups +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Account)) return false;

        Account account = (Account) o;

        if (getAccountId() != account.getAccountId()) return false;
        if (getPort() != account.getPort()) return false;
        if (getFirstName() != null ? !getFirstName().equals(account.getFirstName()) : account.getFirstName() != null)
            return false;
        if (getLastName() != null ? !getLastName().equals(account.getLastName()) : account.getLastName() != null)
            return false;
        if (!getEmail().equals(account.getEmail())) return false;
        if (!getPassword().equals(account.getPassword())) return false;
        return getGroups() != null ? getGroups().equals(account.getGroups()) : account.getGroups() == null;
    }

    @Override
    public int hashCode() {
        return getPassword().hashCode();
    }
}
