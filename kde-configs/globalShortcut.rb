#!/usr/bin/env ruby
# The above statement must be used for scripts as the first line in the script
#We have to make our own function in order to check  the whether the user input is a number.  This is because the input gotten  from gets without using a to_x command is naturally a string

#Require  is only loaded once per file, Load is loaded everytime it is called. What you use depending on the case usage, since loads can be used to refresh any changes in a file, while require can ignore any changes in file since its in memory already and isn't going to be refreshed. 
#There are two ways you can do it. Load requires the full file name .rb, while  require only needs the  name of the file without the extension.
#Require  requires the path to the file, or alternatively  be preceded by a './' to look in the current directory UNLESS you use require_relative, upon which only the filename is needed
require './validity'
#load 'validity.rb'
#Use Include or extend to  use  the functions from validity. The difference between extend and include is that include only applies to instances of a class while extend can be used for including those modules in the class but not an instance of a class
#Remember, an instance of a class is an instance object that must be declared by .new. 
#Now the difference between an instance and class method, a class method is used within the class to itself  and can only be used by athe class, while a instance method is used after a new instance obj is created by .new
#So for example, If you were to include  a module you can only access it  with a class using .new.(class name), while with extend you don't need to create a new instance to use it since it is used as a class method.
#in this case,  include and extend could both be used. However, if we were to declare this as a class, we could only use the validity module in another program using this class if we created a new instance if we used include, or just calling it with className.module if we used extend
extend Validity
#An Array to hold user arguments
widgets=[]
#If you are  going to use sytem commands and list the out put, use puts + backticks (``), or system("cmd")
puts `cat ~/.config/kglobalshortcutsrc | grep 'Activate Application Launcher'`
#Asking the user for inputs
puts "What are the widget numbers that you would like to remove? (Enter q to quit)\n"
option=gets.downcase.chomp#Get the user input and downcase it if possible, I'm not converting to int here because we need to check if the user input is to quit or an int
until option== 'q' #Until the user decides to quit
     unless isintnum?(option) #Check if the user input is a num
          puts "Input is not an integer number"
     else
          if option!='q' #if the input is a num  and not the command to quit
               widgets.push(option.to_i) #number gets pushed to the widgets array
          end
     end
option=gets.downcase.chomp #get user input,.
end
puts "#{widgets}"
