package utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class CommonUtils {

    public static long getRandomSleepTime() {
        Random rand = new Random();
        return rand.nextInt((1000 - 1) + 1) + 1;
    }

    public static String getTimeNow() {
        return new SimpleDateFormat("HH.mm.ss.SSS").format(new Date()) + ":";
    }
}
