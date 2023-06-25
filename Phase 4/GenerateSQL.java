import java.io.*;
import java.util.*;

public class GenerateSQL {
    public static void main(String[] args){
        
        if(args.length > 0){
            
            //Gets name of table from command line.
            String table = args[0];
            try {
                
                //Create a file to write results to
                FileWriter outfile = new FileWriter(table + ".sql");

                //Read an input file
                File infile = new File(table + ".txt");
                Scanner input = new Scanner(infile);

                //Read the file line by line
                while (input.hasNextLine()){

                    String line = input.nextLine();
                    if(line.length() == 0){
                        outfile.write("\n");
                    }else{
                        outfile.write(processLine(line, table));
                    }
                }
                outfile.write("\nCOMMIT");
                outfile.close();
                input.close();
            }catch(FileNotFoundException e){
                System.out.println(e.getMessage());
            }catch(IOException e){
                System.out.println(e.getMessage());
            }
        }else{
            System.out.println("No table name given in command line arguments.\nPlease enter table name.");
        }
    }

    public static String processLine(String line, String tableName){
        String output;

        ArrayList<String> cleanValues = new ArrayList<String>();
        

        String[] values = line.split(",");
        
        for(String value : values){
            cleanValues.add(numStringOrNULL(value));
        }
        output = String.join(", ", cleanValues);
        return "INSERT INTO " + tableName + " VALUES" + "(" + output + ");" + "\n";
    }

    public static boolean isInteger(String str){
        try{
            Integer.parseInt(str);
            return true;
        }catch (NumberFormatException e){
            return false;
        }
    }

    public static String numStringOrNULL(String string){
        if(isInteger(string.trim())){
            return string.trim();
        }else if(string.trim().equals("NULL")){
            return string.trim();
        }else{
            return "'" + string.trim() + "'";
        }
    }
}