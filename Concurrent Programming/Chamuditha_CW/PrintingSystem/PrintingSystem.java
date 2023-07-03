import utils.CommonUtils;

public class PrintingSystem {
    public static void main(String[] args) {

        //create thread group for students
        ThreadGroup students = new ThreadGroup("students");
        //create thread group for technicians
        ThreadGroup technicians = new ThreadGroup("technicians");

        //create instance of the Laser printer shared object
        LaserPrinter printer = new LaserPrinter("LP1", 001, students);

        //4 student threads
        Student student1 = new Student("Student 01", students, printer);
        Student student2 = new Student("Student 02", students, printer);
        Student student3 = new Student("Student 03", students, printer);
        Student student4 = new Student("Student 04", students, printer);

        //1 paper technician
        PaperTechnician paperTechnician = new PaperTechnician("Paper Technician", technicians, printer);
        //1 Toner Technician
        TonerTechnician tonerTechnician = new TonerTechnician("Toner Technician", technicians, printer);

        //Start all threads
        student1.start();
        student2.start();
        student3.start();
        student4.start();
        paperTechnician.start();
        tonerTechnician.start();
        try {
            //this makes sure that each thread is terminated, before printing the terminated  message.
            student1.join();
            student2.join();
            student3.join();
            student4.join();
            tonerTechnician.join();
            paperTechnician.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("\n\n" + CommonUtils.getTimeNow() + " All tasks completed. Printing printer status...\n");

        System.out.print("==================================================\n" +
                "                PRINTER SUMMARY                  \n" +
                "=================================================\n\n");
        System.out.println(printer.toString());
        System.out.println("\n=================================================");
    }

}
