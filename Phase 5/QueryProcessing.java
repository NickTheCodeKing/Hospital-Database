import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class QueryProcessing {

    public static void main(String[] args) {
        String fileName = "nurse.txt";
        List<String[]> nurses = readNursesFromFile(fileName);
        double totalSalary = 0;
        for (String[] nurseData : nurses) {
            totalSalary += Double.parseDouble(nurseData[2].trim());
        }
        double averageSalary = totalSalary / nurses.size();
        List<String[]> lowSalaryNurses = new ArrayList<>();
        for (String[] nurseData : nurses) {
            double salary = Double.parseDouble(nurseData[2].trim());
            if (salary < averageSalary) {
                lowSalaryNurses.add(nurseData);
            }
        }
        System.out.printf("%-10s %-20s %-15s %-15s\n", "N_ID", "N_Name", "N_Salary", "N_SupervisorID");
        for (String[] nurseData : lowSalaryNurses) {
            System.out.printf("%-10s %-20s %-15s %-15s\n", nurseData[0].trim(), nurseData[1].trim(), nurseData[2].trim(), nurseData[3].trim());
        }
    }

    private static List<String[]> readNursesFromFile(String fileName) {
        List<String[]> nurses = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] nurseData = line.split(",");
                nurses.add(nurseData);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return nurses;
    }

}