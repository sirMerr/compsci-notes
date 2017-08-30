package com.tiffanyln;

public class User {
    int money = 0;
    int bet = 0;

    /**
     * Set default parameters
     * @param money
     * @param bet
     */
    User(int money, int bet) {
        this.money = money;
        this.bet = bet;
    }

    // setters
    private void setMoney(int money) {
        this.money = money;
    }

    private void setBet(int bet) {
        this.bet = bet;
    }

    // getters
    private int getMoney(int money) {
        return this.money;
    }

    private int getBet() {
        return this.bet;
    }
}
