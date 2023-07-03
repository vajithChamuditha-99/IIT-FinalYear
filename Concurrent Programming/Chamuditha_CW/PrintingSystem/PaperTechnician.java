import utils.CommonUtils;
import utils.TextDeco;

/*Thread*/
public class PaperTechnician extends Thread {
    private ServicePrinter printer;

    public PaperTechnician(String name, ThreadGroup threadGroup, ServicePrinter printer) {
        super(threadGroup, name);
        this.printer = printer;
    }

    @Override
    public void run() {
        for (int i = 0; i < 3; i++) {
            System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PAPER_TECHNICIAN) +
                    TextDeco.PAPER_TECHNICIAN + " Requested to Refill Papers (Attempt " + (i + 1) + ")" + TextDeco.endColor());
            printer.refillPaper();
            //sleep random milliseconds
            try {
                sleep(CommonUtils.getRandomSleepTime());
            } catch (InterruptedException e) {
                System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.TONER_TECHNICIAN) +
                        TextDeco.ANSI_RED + " Paper Technician > Something went wrong." + TextDeco.endColor());
            }
        }

        LaserPrinter laserPrinter = (LaserPrinter) printer;

        System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PAPER_TECHNICIAN) +
                TextDeco.PAPER_TECHNICIAN + " Paper replacements count: " + laserPrinter.noOfPapersReplaced()
                + "." + TextDeco.endColor());

        //finish attempting to refill 3 times
        System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.PAPER_TECHNICIAN) +
                TextDeco.PAPER_TECHNICIAN + " Finished the all Attempts" + TextDeco.endColor());
    }
}
