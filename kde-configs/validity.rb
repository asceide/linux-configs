#To check if an input string is a number or not
module Validity
    def isintnum?(userInput) #Checking interger numbers
        userInput= userInput.to_s unless userInput.is_a? String #converts the user input into a string unless it is a String already
        /\A[+-]?\d+?\z/.match userInput #Using Regex to check the user string. "/" indicates the start of a regex.  "\A  indicates the start, and \z the end of a string. 
   end#[+-]? is checking to see if there is zero or one of + or -. \d+? is checking if there is one or more digit

   def isfloatnum?(userInput) #checking if the number is a floating point number
        userInput= userInput.to_s unless userInput.is_a? String
        /\A[+-]?\d+(\.\d+)?\z/.match userInput #The only difference here is +(\.\d+). the \.\ is checking if there is zero or one of a period,. Put together its checking if there is zero or one of a dot followed by one or more digits
    end
end

