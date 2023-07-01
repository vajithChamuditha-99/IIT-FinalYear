package com.company;

public class HouseBasedHusband implements Runnable {
    private String name;
    private BankAccount account;

    public HouseBasedHusband(BankAccount account) {
        super();
        this.name = "House based husband";
        this.account = account;
    }

    public String getName() {
        return name;
    }

    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            double bal = account.withdraw(20000);
        }
    }
}
