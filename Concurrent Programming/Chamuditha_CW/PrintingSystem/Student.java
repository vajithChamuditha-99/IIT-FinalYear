import java.util.Random;

import utils.*;

/*Thread*/
public class Student extends Thread {
    private final Printer printer; //printer interface

    public Student(String name, ThreadGroup threadGroup, Printer printer) {
        super(threadGroup, name);
        this.printer = printer;
    }

    @Override
    public void run() {
        for (int i = 1; i <= 5; i++) {
            Document document = createRandomDocument(i);
            System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.STUDENT) + TextDeco.STUDENT +
                    document.getUserID() + " Requested to Print (" + document.getNumberOfPages() + " pages)" +
                    TextDeco.endColor());
            printer.printDocument(document);
            //sleep random milliseconds
            try {
                sleep(CommonUtils.getRandomSleepTime());
            } catch (InterruptedException e) {
                System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.TONER_TECHNICIAN) +
                        TextDeco.ANSI_RED + " Student > Something went wrong." + TextDeco.endColor());
            }
        }

        //Finished printing all documents
        System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.STUDENT) + TextDeco.STUDENT +
                this.getName() + " Printed All Documents." + TextDeco.endColor());
    }


    //create document with random length and name
    private Document createRandomDocument(int docNumber) {
        Random rand = new Random();
        int noOfPapers = rand.nextInt((10 - 1) + 1) + 1;
        String docName = "Document " + docNumber;
        return new Document(this.getName() + "-" + docName, docName, noOfPapers);
    }
}
