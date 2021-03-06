package com.tiffanyln;

import java.util.Scanner;

public class DiceGame {
    int points = 0;
    User player;

    /**
     * Set default parameters
     * @param money
     * @param bet
     */
    DiceGame(int money, int bet) {
        this.player = new User(money, bet);
    }

    /**
     * Play the game, roll the dice and check
     * for the win and lose conditions
     */
    void rollDice() {
        int roll = randomDicesValue();

        System.out.println("\nYou have " + this.player.money + "$ and you bet " + this.player.bet + "$");
        System.out.println("Roll: " + roll);
        if (points == 0) {
            switch (roll) {
                case 7:
                case 11:
                    System.out.println("You win!");
                    this.player.money += this.player.bet;
                    System.out.println("You now have " + this.player.money + "$");
                    break;
                case 2:
                case 3:
                case 12:
                    System.out.println("You Lose!");
                    this.player.money -= this.player.bet;
                    System.out.println("You now have " + this.player.money + "$");
                    break;
                default:
                    System.out.println("Adding to Points!");
                    points = roll;
                    System.out.println("You want to get: " + points);
                    rollDice();
                    break;
            }
        } else {
            if (roll == points) {
                System.out.println("You got your points!");
                this.player.money += this.player.bet;
                System.out.println("You now have " + this.player.money + "$");
            } else if (roll == 7) {
                System.out.println("You got 7! You lose :(");
                this.player.money -= this.player.bet;
                System.out.println("You now have " + this.player.money + "$");
            } else {
                System.out.println("You didn't get your points nor 7, let's go again!");
                rollDice();
            }

        }
    }

    /**
     * Returns a random int representative of the sum of
     * two dice rolls (found on stack overflow because laziness
     * with min and max added)
     * @return random number
     */
    static int randomDicesValue()
    {
        int max = 12;
        int min = 2;

        int range = Math.abs(max - min) + 1;
        return (int)(Math.random() * range) + (min <= max ? min : max);
    }

    static void displayIntro() {
        System.out.println("Welcome to the Crook!");
        System.out.println("Roll two dice. If you get 7 or 11, you win the bet. " +
                "\nIf you get 2, 3 or 12, you lose. Anything else gets becomes to your" +
                "\npoints and you have to re-roll to get that amount of points. You re-roll" +
                "\nuntil you get it or 7, in which case you lose. If you want to exit" +
                ", enter 'exit'");
        System.out.println("\nHow much money do you have on you?");
    }

    /**
     * Start the game. Creates the user and
     * sets base money and bet
     */
    static void startGame() {
        Scanner scan = new Scanner(System.in);

        displayIntro();

        int money = scan.nextInt();

        System.out.println("Excellent! How much will you bet?");
        int bet = scan.nextInt();

        DiceGame game = new DiceGame(money,bet);

        Boolean play = true;

        while (play) {
            game.rollDice();
            System.out.println("\nAlright, do you want to play again? Enter 'exit' if not.");
            String in = scan.next();

            if (in.matches("exit")) {
                play = false;
            } else {
                System.out.println("\nGreat! How much do you want to bet?");
                game.player.bet = scan.nextInt();
            }
        }
    }

    public static void main(String[] args) {
        startGame();
    }
}
