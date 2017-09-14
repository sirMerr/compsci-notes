package com.tiffanyln.entities;

import java.sql.Timestamp;

/**
 * This class models an appointment.
 * Users can make appointments for their agenda, which
 * are also grouped
 *
 * @author Tiffany Le-Nguyen
 * @version 0.1
 */
public class Appointment {
    private int groupId;
    private int appointmentId;
    private String title;
    private String location;
    private Timestamp startDate;
    private Timestamp endDate;
    private String details;
    private Boolean fullDay;
    private Boolean alarmReminder;
    private int reminderInterval;

    public Appointment(int groupId, int appointmentId, String title, String location, Timestamp startDate, Timestamp endDate, String details, Boolean fullDay, Boolean alarmReminder, int reminderInterval) {
        this.groupId = groupId;
        this.appointmentId = appointmentId;
        this.title = title;
        this.location = location;
        this.startDate = startDate;
        this.endDate = endDate;
        this.details = details;
        this.fullDay = fullDay;
        this.alarmReminder = alarmReminder;
        this.reminderInterval = reminderInterval;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Boolean getFullDay() {
        return fullDay;
    }

    public void setFullDay(Boolean fullDay) {
        this.fullDay = fullDay;
    }

    public Boolean getAlarmReminder() {
        return alarmReminder;
    }

    public void setAlarmReminder(Boolean alarmReminder) {
        this.alarmReminder = alarmReminder;
    }

    public int getReminderInterval() {
        return reminderInterval;
    }

    public void setReminderInterval(int reminderInterval) {
        this.reminderInterval = reminderInterval;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Appointment)) return false;

        Appointment that = (Appointment) o;

        if (getGroupId() != that.getGroupId()) return false;
        if (getAppointmentId() != that.getAppointmentId()) return false;
        if (getReminderInterval() != that.getReminderInterval()) return false;
        if (!getTitle().equals(that.getTitle())) return false;
        if (getLocation() != null ? !getLocation().equals(that.getLocation()) : that.getLocation() != null)
            return false;
        if (!getStartDate().equals(that.getStartDate())) return false;
        if (!getEndDate().equals(that.getEndDate())) return false;
        if (getDetails() != null ? !getDetails().equals(that.getDetails()) : that.getDetails() != null) return false;
        if (getFullDay() != null ? !getFullDay().equals(that.getFullDay()) : that.getFullDay() != null) return false;
        return getAlarmReminder() != null ? getAlarmReminder().equals(that.getAlarmReminder()) : that.getAlarmReminder() == null;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "groupId=" + groupId +
                ", appointmentId=" + appointmentId +
                ", title='" + title + '\'' +
                ", location='" + location + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", details='" + details + '\'' +
                ", fullDay=" + fullDay +
                ", alarmReminder=" + alarmReminder +
                ", reminderInterval=" + reminderInterval +
                '}';
    }
}
