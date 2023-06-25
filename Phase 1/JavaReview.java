import java.io.*;
import java.util.*;

public class JavaReview {
    public static void main(String[] args){
        try {
            //Create a file to write results to
            FileWriter outfile = new FileWriter("Results.txt");

            //Read an input file
            File infile = new File("phase1.txt");
            Scanner input = new Scanner(infile);

            //Read the file line by line
            while (input.hasNextLine()){

                String line = input.nextLine();
                if(line.length() == 0){
                    outfile.write("\n");
                }else{
                    outfile.write(processLine(line));
                }
            }
            outfile.close();
            input.close();
        }catch(FileNotFoundException e){
            System.out.println(e.getMessage());
        }catch(IOException e){
            System.out.println(e.getMessage());
        }
    }

    public static String processLine(String line){
        String output;

        ArrayList<String> cleanValues = new ArrayList<String>();
        

        String[] values = line.split("\\|");
        
        for(String value : values){
            if(isInteger(value.trim())){
                cleanValues.add("Number");
            }else{
                cleanValues.add("String");
            }
        }
        output = String.join(",", cleanValues);
        output += "\n";
        return output;
    }

    public static boolean isInteger(String str){
        try{
            Integer.parseInt(str);
            return true;
        }catch (NumberFormatException e){
            return false;
        }
    }
}