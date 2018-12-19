// "save_all_open_batch"
//
// This macro batch processes all the files open in the session and 
// It will change to the second channel, automatically increase the 
// contrast, and leave the image open for further processing/saving.
// Intended usage: manually flipping sections

requires("1.33s"); 
dir = getDirectory("Choose a Directory ");

n=0;

for (i=1; i<=nImages; i++) { 
    selectImage(i);
    print(n);
    showProgress(n++, nImages);
    print(path);
    path = dir + getTitle;
    print(path);
    processFile(path); 
} 

function processFile(path) {
    saveAs("Tiff", path);
    close();
}
