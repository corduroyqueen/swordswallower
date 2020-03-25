///Global "scr_textbox" Variables

global.txtCache = "";
global.txtIndex = 1; // For use in the "scr_textbox" script. (Don't mess with this)
global.display_txt = ""; // For use in the "scr_textbox" script. Printed letters on screen.
global.maxPrintTimer = 2; // How fast each indivual letter will print 
global.printTimer = 0; // ""
global.tboxActive = false; // Is the textbox active in the game? is someone speaking? (use this variable to pause events... or not)
global.placeholderTxt = ""; // For use in the "scr_textbox" script. (Don't mess with this)
global.temp_placeholderTxt = ""; // For use in the "scr_textbox" script. (Don't mess with this)

//For the automated dialogue boxes
global.timer = 0;
global.auto = false;
