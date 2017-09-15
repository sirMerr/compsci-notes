package com.tiffanyln.entities;

import java.util.List;

public class Group {
    private int groupId;
    private String title;
    private double rgb;
    private int accountId;
    private List<Appointment> appointmentList;

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public List<Appointment> getAppointmentList() {
        return appointmentList;
    }

    public void setAppointmentList(List<Appointment> appointmentList) {
        this.appointmentList = appointmentList;
    }

    // Default constructor
    public Group() {
        this(-1,"",-1,-1);
    }

    // Full constructor
    public Group(int groupId, String name, double rgb, int accountId) {
        this.groupId = groupId;
        this.title = name;
        this.rgb = rgb;
        this.accountId = accountId;
    }

    // Getters and setters (not for accountId)
    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String name) {
        this.title = name;
    }

    public double getRgb() {
        return rgb;
    }

    public void setRgb(double rgb) {
        this.rgb = rgb;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Group)) return false;

        Group group = (Group) o;

        if (getGroupId() != group.getGroupId()) return false;
        if (Double.compare(group.getRgb(), getRgb()) != 0) return false;
        if (getAccountId() != group.getAccountId()) return false;
        if (getTitle() != null ? !getTitle().equals(group.getTitle()) : group.getTitle() != null) return false;
        return getAppointmentList() != null ? getAppointmentList().equals(group.getAppointmentList()) : group.getAppointmentList() == null;
    }

    @Override
    public String toString() {
        return "Group{" +
                "groupId=" + groupId +
                ", name='" + title + '\'' +
                ", rgb=" + rgb +
                ", accountId=" + accountId +
                ", appointmentList=" + appointmentList +
                '}';
    }
}
