import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;

public class Theatre {
    private static final int ROW1_SEATS = 12;
    private static final int ROW2_SEATS = 16;
    private static final int ROW3_SEATS = 20;
    private static final ArrayList<Ticket> tickets = new ArrayList<>();

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {

        int[][] seatingArea = new int[3][];
        seatingArea[0] = new int[ROW1_SEATS];
        seatingArea[1] = new int[ROW2_SEATS];
        seatingArea[2] = new int[ROW3_SEATS];

        System.out.println("Welcome to the New Theatre");

        int option = -1;
        while (option != 0) {
            System.out.println("\nPlease select an option:");
            System.out.println("1) Buy a ticket");
            System.out.println("2) Print seating area");
            System.out.println("3) Cancel ticket");
            System.out.println("4) List available seats");
            System.out.println("5) Save to file");
            System.out.println("6) Load from file");
            System.out.println("7) Print ticket information and total price");
            System.out.println("8) Sort tickets by price");
            System.out.println("0) Quit");

            option = scanner.nextInt();
            switch (option) {
                case 0:
                    System.out.println("Thank you for using the New Theatre program.");
                    break;
                case 1:
                    buy_ticket(seatingArea, tickets);
                    break;
                case 2:
                    print_seating_area(seatingArea);
                    break;
                case 3:
                    cancel_ticket(seatingArea);
                    break;
                case 4:
                    show_availabale(seatingArea);
                    break;
                case 5:
                    save_to_file(seatingArea);
                    break;
                case 6:
                    load_from_file(seatingArea);
                    break;
                case 7:
                    show_tickets_info(tickets);
                    break;
                case 8:
                    sort_tickets(tickets);
                    break;
                default:
                    System.out.println("Invalid option selected. Please try again.");
                    break;
            }
        }
    }

    private static void buy_ticket(int[][] seats, ArrayList<Ticket> tickets) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Buying a ticket...");

        // ask for row number
        System.out.print("Enter row number (1-3): ");
        int row = scanner.nextInt() - 1;

        // check if row number is valid
        if (row < 0 || row > 2) {
            System.out.println("Invalid row number. Try again.");
            return;
        }

        // ask for seat number
        System.out.print("Enter seat number (1-" + seats[row].length + "): ");
        int seat = scanner.nextInt() - 1;

        // check if seat number is valid
        if (seat < 0 || seat >= seats[row].length) {
            System.out.println("Invalid seat number. Try again.");
            return;
        }

        // check if seat is already occupied
        if (seats[row][seat] == 1) {
            System.out.println("Sorry, this seat is already occupied.");
            return;
        }

        // ask for person information
        scanner.nextLine(); // consume the newline character
        System.out.print("Enter person's first name: ");
        String firstName = scanner.nextLine();
        System.out.print("Enter person's last name: ");
        String lastName = scanner.nextLine();
        System.out.print("Enter person's email: ");
        String email = scanner.nextLine();

        // create new person object
        Person person = new Person(firstName, lastName, email);

        // calculate ticket price
        int price = 0;
        if (seat < ROW1_SEATS) {
            price = 100;
        } else if (seat < ROW1_SEATS + ROW2_SEATS) {
            price = 80;
        } else {
            price = 60;
        }

        // mark seat as occupied
        seats[row][seat] = 1;

        // create new ticket object
        Ticket ticket = new Ticket(row, seat, price, person);

        // add ticket to array list of tickets
        tickets.add(ticket);

        System.out.println("Ticket purchased successfully!");
    }


    public static void print_seating_area(int[][] seating_plan) {
        System.out.println("       ***********");
        System.out.println("       *  STAGE  *");
        System.out.println("       ***********");

        int number = 3;
        int count = number;
        for (int k = 0; k <= number - 1; k++) {
            for (int i = 1; i <= count; i++)
                System.out.print(" " + " ");
            int spaceCount = 4 * k + 12;
            count--;
            for (int i = 0; i < spaceCount; i++)
                if (seating_plan[k][i] == 0) {
                    System.out.print("O");
                    if (i == (spaceCount - 1) / 2) {
                        System.out.print(" ");
                    }
                } else {
                    System.out.print("X");
                    if (i == (spaceCount - 1) / 2) {
                        System.out.print(" ");
                    }
                }
            System.out.println();

        }
    }

    public static void cancel_ticket(int[][] seats) {
        Scanner input = new Scanner(System.in);

        System.out.print("Enter the row number of the seat to cancel: ");
        int row = input.nextInt();

        System.out.print("Enter the seat number of the seat to cancel: ");
        int seat = input.nextInt();

        // Check that the row and seat numbers are valid
        if (row < 1 || row > 3 || seat < 1 || seat > seats[row - 1].length) {
            System.out.println("Invalid row or seat number.");
            return;
        }

        // Check if the seat is already available
        if (seats[row - 1][seat - 1] == 0) {
            System.out.println("Seat is already available.");
            return;
        }

        // Cancel the ticket by making the seat available
        seats[row - 1][seat - 1] = 0;

        System.out.println("Ticket canceled successfully.");
    }

    public static void show_availabale(int[][] seats) {
        for (int i = 0; i < 3; i++) {
            int row = i + 1;
            System.out.print("Seats available in row " + row + ": ");
            for (int j = 0; j < seats[i].length; j++) {
                if (seats[i][j] == 0) {
                    System.out.print(j + 1 + " ");
                }
            }
            System.out.println();
        }
    }

    public static void save_to_file(int[][] seats) {
        try {
            PrintWriter writer = new PrintWriter(new File("seats.txt"));
            for (int[] seat : seats) {
                for (int i : seat) {
                    writer.print(i + " ");
                }
                writer.println();
            }
            writer.close();
            System.out.println("Seats saved to file.");
        } catch (IOException e) {
            System.out.println("Error saving seats to file.");
            e.printStackTrace();
        }
    }

    public static void load_from_file(int[][] seatingPlan) {
        try {
            File file = new File("seats.txt");
            Scanner scanner = new Scanner(file);

            for (int i = 0; i < seatingPlan.length; i++) {
                for (int j = 0; j < seatingPlan[i].length; j++) {
                    seatingPlan[i][j] = scanner.nextInt();
                }
            }

            System.out.println("Seating plan loaded from file.");
            scanner.close();

        } catch (FileNotFoundException e) {
            System.out.println("File not found.");
        }
    }

    private static void show_tickets_info(ArrayList<Ticket> tickets) {
        double totalPrice = 0;
        System.out.println("TICKET INFORMATION:");
        for (Ticket ticket : tickets) {
            ticket.print();
            totalPrice += ticket.getPrice();
        }
        System.out.printf("Total price: £%.2f\n", totalPrice);
    }

    private static void sort_tickets(ArrayList<Ticket> tickets) {
        ArrayList<Ticket> sortedTickets = new ArrayList<>(tickets);
        Collections.sort(sortedTickets, new Comparator<Ticket>() {
            public int compare(Ticket t1, Ticket t2) {
                return t1.getPrice() - t2.getPrice();
            }
        });
        System.out.println("Sorted tickets by price (cheapest first):");
        for (Ticket ticket : sortedTickets) {
            ticket.print(); // print ticket info
        }
    }


}