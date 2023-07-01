package com.company;

public class Main {

    public static void main(String[] args) {
        BankAccount account = new BankAccount("Acc01", 20000);
        CarrierMindedWife cmw = new CarrierMindedWife(account);
        HouseBasedHusband hbh = new HouseBasedHusband(account);
        Thread cmwThread = new Thread(cmw, cmw.getName());
        Thread hbhThread = new Thread(hbh, hbh.getName());
        hbhThread.start();
        cmwThread.start();
    }
}
