import utils.CommonUtils;
import utils.TextDeco;

/*shared printer implementation as a monitor*/
public class LaserPrinter implements ServicePrinter {

    //declaring private variables
    private final int printerID;
    private int remainingPaperLevel;
    private int remainingTonerLevel;
    private int documentsPrinted;
    private int noOfTonersReplaced;
    private int noOfPapersReplaced;
    private final ThreadGroup studentThreadGroup;

    //constructor
    public LaserPrinter(String name, int id, ThreadGroup studentThreadGroup) {
        this.printerID = id;
        this.remainingPaperLevel = 10;
        this.remainingTonerLevel = 50;
        this.documentsPrinted = 0;
        this.noOfTonersReplaced = 0;
        this.noOfPapersReplaced = 0;
        this.studentThreadGroup = studentThreadGroup;
    }

    public int getNoOfTonersReplaced() {
        return noOfTonersReplaced;
    }

    public int noOfPapersReplaced() {
        return noOfPapersReplaced;
    }


    //Returns the current state of the printer
    @Override
    public String toString() {
        return new String("Laser Printer[ " +
                "PrinterID: " + printerID + ", " +
                "Paper Level: " + remainingPaperLevel + ", " +
                "Toner Level: " + remainingTonerLevel + "," +
                "Documents Printed: " + documentsPrinted + "," +
                "No of Toners Replaced: " + noOfTonersReplaced +
                "]");
    }


    //Method that allows Students to print documents
    @Override
    public synchronized void printDocument(Document document) {
        //Critical section
        while (remainingPaperLevel < document.getNumberOfPages() || remainingTonerLevel < document.getNumberOfPages()) {
            //Obligatory-Guarded
            try { //release monitor //current thread goes to waiting state
                wait();
                //after getting 'notify()', re-acquire monitor to check if paper/toner is now sufficient
            } catch (InterruptedException e) {
                System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                        + "Student: something went wrong");
            }

        }

        //Thread has delegated the Guard i.e: OK to print
        if (remainingPaperLevel >= document.getNumberOfPages() && remainingTonerLevel >= document.getNumberOfPages()) {
            remainingPaperLevel -= document.getNumberOfPages();
            remainingTonerLevel -= document.getNumberOfPages();
            documentsPrinted++;
            noOfPapersReplaced++;
            System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                    + "Printed " + document.getUserID() + TextDeco.endColor());
            System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                    + "Current State of Printer: " + toString() + TextDeco.endColor());
            notifyAll();
            //monitor released by student
        }
    }


    //Allow paper technician to refill the paper tray
    @Override
    public synchronized void refillPaper() { //monitor method type "Miscellaneous"
        //critical section

        while ((remainingPaperLevel + SheetsPerPack) > Full_Paper_Tray) {//guard
            try {
                if (checkProcessFinished()) {
                    System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                            + "All Printing Over! No Need To Refill Papers. " + TextDeco.endColor());
                    break;
                } else {
                    System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                            + "Cannot Refill Papers Now, Please Wait.. " + TextDeco.endColor());
                    //release monitor and wait for 5seconds
                    wait(5000);
                    //try to re-acquire monitor
                }
            } catch (InterruptedException e) {
                System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.ANSI_RED
                        + " Laser Printer - Refill Papers > Something went wrong." + TextDeco.endColor());
            }
        }

        if ((remainingPaperLevel + SheetsPerPack) <= Full_Paper_Tray) {
            System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                    + "Papers Refilled!" + TextDeco.endColor());
            remainingPaperLevel += SheetsPerPack;
            System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                    + "Current State of Printer: " + toString() + TextDeco.endColor());
            notifyAll();
            //Monitor released by paperTechnician
        }
    }


    //Allow the toner technician to replace the toner cartridge
    @Override
    public synchronized void replaceTonerCartridge() { //monitor method type "Miscellaneous"
        //critical section
        while ((remainingTonerLevel >= Minimum_Toner_Level) && !checkProcessFinished()) {//Guard
            try {
                System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                        + "Cannot Replace Cartridge Now, Please Wait.. " + TextDeco.endColor());
                //release monitor and wait for 5sec
                wait(5000);
            } catch (InterruptedException e) {
                System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.ANSI_RED
                        + " Laser Printer - Replace Toner > Something went wrong." + TextDeco.endColor());
            }
        }

        if (remainingTonerLevel < Minimum_Toner_Level) {
            System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                    + "Toner Replaced!. " + TextDeco.endColor());

            remainingTonerLevel = Full_Toner_Level;
            noOfTonersReplaced++;
            System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                    + "Current State of Printer: " + toString() + TextDeco.endColor());
        } else if (checkProcessFinished()) {
            System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PRINTER) + TextDeco.PRINTER
                    + "All Printing Over! No Need To Replace Toner. " + TextDeco.endColor());
        }
    }


    /*This method is used to determine if all the threads in a group of student threads have terminated.
    If they have, the "checkProcessFinished" flag is set to True. This is done to prevent deadlocks that the technician
    threads may encounter if they remain in a waiting state after all documents have been printed.
    This method ensures that the program can terminate properly*/
    private boolean checkProcessFinished() {
        return this.studentThreadGroup.activeCount() == 0;
    }
}