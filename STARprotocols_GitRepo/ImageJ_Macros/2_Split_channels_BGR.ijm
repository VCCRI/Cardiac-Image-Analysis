    inputFolder= getDirectory(""); 
        print(inputFolder); 
        outputSplit= inputFolder + "/SplitChannel/";  
        
        images= getFileList(inputFolder); 
        File.makeDirectory(outputSplit);
         

        for (i=0; i<images.length; i++) { 
                setBatchMode(true); //batch mode 
                inputPath= inputFolder + images[i]; 
                open (inputPath); 
                imagesName=getTitle(); 
                print("Splitting Image: " + imagesName); 
                run("Split Channels"); 
                selectWindow("C1-" + imagesName); 
                saveAs("Tiff", outputSplit + "blue_" +imagesName);	
                close(); 
                selectWindow("C2-" + imagesName);
                saveAs("Tiff", outputSplit + "green_" +imagesName);	
                close(); 
                selectWindow("C3-" + imagesName);  
                saveAs("Tiff", outputSplit + "red_"+imagesName); 
                close();
                write("Conversion Complete"); 
        
} 
setBatchMode(false); 