package com.tiffanyln.entities;

public class Group {
    private int groupId;
    private String name;
    private double rgb;
    private int accountId;

    // Default constructor
    public Group(int groupId, String name, int accountId) {
        this.groupId = groupId;
        this.name = name;
        this.accountId = accountId;
    }

    // Full constructor
    public Group(int groupId, String name, double rgb, int accountId) {
        this.groupId = groupId;
        this.name = name;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        if (accountId != group.accountId) return false;
        return getName().equals(group.getName());
    }

    @Override
    public String toString() {
        return "Group{" +
                "groupId=" + groupId +
                ", name='" + name + '\'' +
                ", rgb=" + rgb +
                ", accountId=" + accountId +
                '}';
    }
}
