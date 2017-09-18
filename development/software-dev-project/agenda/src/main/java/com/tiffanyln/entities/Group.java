package com.tiffanyln.entities;

import java.util.ArrayList;
import java.util.List;

public class Group {
    private int groupId;
    private String title;
    private String rgb;
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
        this(-1,"","#FF0364",-1);
        this.appointmentList = new ArrayList<>();
    }

    // Full constructor
    public Group(int groupId, String name, String rgb, int accountId) {
        this.groupId = groupId;
        this.title = name;
        this.rgb = rgb;
        this.accountId = accountId;
        this.appointmentList = new ArrayList<>();
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

    public String getRgb() {
        return rgb;
    }

    public void setRgb(String rgb) {
        this.rgb = rgb;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Group)) return false;

        Group group = (Group) o;

        if (getGroupId() != group.getGroupId()) return false;
        if (getAccountId() != group.getAccountId()) return false;
        if (!getTitle().equals(group.getTitle())) return false;
        if (!getRgb().equals(group.getRgb())) return false;
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
