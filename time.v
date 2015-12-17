module date;    
   string dstr; 
   int f, t; 
    
   initial begin 
      $system("date > simv.date");    // Create temp file with current date 
      f = $fopen("simv.date", "r");   // Open file 
      t = $fgets(dstr, f);            // Read the date from the file into a string 
      $fclose(f);                     // Close the file 
      $display("Date is '%s'", dstr); // Display the current date 
     end 
endmodule