// "examine_fluor_batch"
//
// This macro batch processes all the files in a selected folder and any
// subfolders in that folder. It will change to the second channel, 
// automatically increase the contrast, and leave the image open for 
// further processing/saving.

requires("1.33s"); 
dir = getDirectory("Choose a Directory ");
setBatchMode(false);
count = 0;
countFiles(dir);
n = 0;
processFiles(dir);
//print(count+" files processed");

function countFiles(dir) {
    list = getFileList(dir);
    for (i=0; i<list.length; i++) {
        if (endsWith(list[i], "/"))
            countFiles(""+dir+list[i]);
        else
            count++;
   }
}

function processFiles(dir) {
    list = getFileList(dir);
    for (i=0; i<list.length; i++) {
        if (endsWith(list[i], "/"))
            processFiles(""+dir+list[i]);
        else {
            showProgress(n++, count);
            path = dir+list[i];
            processFile(path);
        }
    }
}

function processFile(path) {
    if (endsWith(path, ".tif")) {
        open(path);
        run("Next Slice [>]");
        //run("Channels Tool...");
        Stack.setActiveChannels("01");
        //run("Brightness/Contrast...");
        run("Enhance Contrast", "saturated=0.35");
    }
}
