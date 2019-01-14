// "save_all_open_batch"
//
// This macro batch saves all the files open in the 
// session in to selected folder.

dir = getDirectory("Choose a Directory");

n=0;

for (i=1; i<=nImages; i++) { 
    selectImage(i);
    showProgress(n++, nImages);
    path = dir + getTitle;
    print(path);
    saveAs("Tiff", path);
    close();
} 
