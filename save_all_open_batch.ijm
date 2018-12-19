// "save_all_open_batch"
//
// This macro batch processes all the files open in the session and 
// It will change to the second channel, automatically increase the 
// contrast, and leave the image open for further processing/saving.
// Intended usage: manually flipping sections

requires("1.33s"); 
dir = getDirectory("Choose a Directory ");

function countFiles(dir) {
    list = getFileList(dir);
    for (i=0; i<list.length; i++) {
        if (endsWith(list[i], "/"))
            countFiles(""+dir+list[i]);
        else
            count++;
   }
}

n=0

for (i=1; i<=nImages; i++) { 
    selectImage(i);
    showProgress(n++, nImages);
    path = dir + getTitle;
    processFile(path); 
} 

function processFile(path) {
    saveAs("Tiff", path);
    close();
}