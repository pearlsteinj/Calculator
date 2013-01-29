Calculator - Joshua Pearlstein


The Calculator will consist of:
 	- a Label to display the current state of the calculator is
 	- Buttons 0-9 
 	- Operator Buttons: +,-,*,/,., +-
 	- Parenthesis Buttons
 	- A "clear" Button to reset the calculator
 	- An "Enter" Button to compute the answer

The input will be read from the button handlers and be stored in an array, when the "enter" button is
pushed, the program will execute the operations in the array according the rules of order of operations 
and parenthesis. That answer will then be displayed on the label. Before being entered into the array,
the method will ensure that it is in the proper formatting. (i.e. 2 operators not pushed in a row)

Each operation will have its own method and way of being represented in the array.