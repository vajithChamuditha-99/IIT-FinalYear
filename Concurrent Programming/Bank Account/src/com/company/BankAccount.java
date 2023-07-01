package com.company;

public class BankAccount {
    private String accountNo;
    private double balance;

    public BankAccount(String accountNo, double balance) {
        super();
        this.accountNo = accountNo;
        this.balance = balance;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public synchronized double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public synchronized double deposit(double amount) {
        balance += amount;
        System.out.println("Balance after deposit : " + balance);
        return balance;
    }

    public synchronized double withdraw(double amount) {
        if (balance >= amount) {
            balance -= amount;
            System.out.println("Balance after withdraw : " + balance);
        } else {
            throw new IllegalArgumentException();
        }
        return balance;
    }
}
