// "examine_fluor_open_batch"
//
// This macro batch processes all the files open in the session and 
// It will change to the second channel, automatically increase the 
// contrast, and leave the image open for further processing/saving.
// Intended usage: manually flipping sections

n=0

for (i=1; i<=nImages; i++) { 
    selectImage(i);
    showProgress(n++, nImages); 
    processFile(); 
} 

function processFile() {
    run("Next Slice [>]");
    //run("Channels Tool...");
    Stack.setActiveChannels("01");
    //run("Brightness/Contrast...");
    run("Enhance Contrast", "saturated=0.35");
}
