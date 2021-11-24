run("Bio-Formats Macro Extensions")
    inputFolder= getDirectory(""); 
        print(inputFolder); 
        outputSplit= inputFolder + "/SplitChannel_3/";  
        
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
                run("8-bit");
                run("Enhance Contrast...", "saturated=1");
	  			run("Subtract Background...", "rolling=20");
				run("Gaussian Blur...", "sigma=2");
				saveAs("Tiff", outputSplit + "green_" +imagesName);
                close(); 
                selectWindow("C2-" + imagesName);
                run("8-bit");
                run("Enhance Contrast...", "saturated=1");
	  			run("Subtract Background...", "rolling=20");
				run("Gaussian Blur...", "sigma=2");
                saveAs("Tiff", outputSplit + "red_" +imagesName);	
                close(); 
                selectWindow("C3-" + imagesName);  
                run("8-bit");
                run("Enhance Contrast...", "saturated=1");
	  			run("Subtract Background...", "rolling=20");
				run("Gaussian Blur...", "sigma=2");
                saveAs("Tiff", outputSplit + "blue_"+imagesName); 
                close();
                write("Conversion Complete"); 
        
} 
setBatchMode(false); 