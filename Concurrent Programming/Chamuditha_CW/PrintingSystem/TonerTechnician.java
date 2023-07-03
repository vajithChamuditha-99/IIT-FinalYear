import utils.*;

/*Thread*/
public class TonerTechnician extends Thread {
    private final ServicePrinter printer;

    public TonerTechnician(String name, ThreadGroup threadGroup, ServicePrinter printer) {
        super(threadGroup, name);
        this.printer = printer;
    }

    @Override
    public void run() {
        for (int i = 0; i < 3; i++) {
            System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.TONER_TECHNICIAN) +
                    TextDeco.TONER_TECHNICIAN + " Cartridge replacement requested > (Attempt " + (i + 1) + ")" +
                    TextDeco.endColor());
            printer.replaceTonerCartridge();
            //sleep random milliseconds
            try {
                sleep(CommonUtils.getRandomSleepTime());
            } catch (InterruptedException e) {
                System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.TONER_TECHNICIAN) +
                        TextDeco.ANSI_RED + " Toner Technician > Something went wrong." + TextDeco.endColor());
            }
        }

        LaserPrinter laserPrinter = (LaserPrinter) printer;

        System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.TONER_TECHNICIAN) +
                TextDeco.TONER_TECHNICIAN + " Cartridge replacements count: " + laserPrinter.getNoOfTonersReplaced()
                + "." + TextDeco.endColor());

        //finish attempting to Toner replace 3 times
        System.out.println(CommonUtils.getTimeNow() + TextDeco.colorText(TextDeco.TONER_TECHNICIAN) +
                TextDeco.TONER_TECHNICIAN + " Finished the all Attempts." + TextDeco.endColor());
    }
}