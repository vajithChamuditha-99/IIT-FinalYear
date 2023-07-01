package com.company;

public class CarrierMindedWife implements Runnable {

    private String name;
    private BankAccount account;

    public CarrierMindedWife(BankAccount account) {
        super();
        this.name = "Carrier minded wife";
        this.account = account;
    }

    public String getName() {
        return name;
    }

    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            double bal = account.deposit(20000);
        }
    }
}
