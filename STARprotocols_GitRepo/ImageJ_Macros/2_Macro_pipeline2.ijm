run("Bio-Formats Macro Extensions")
    inputFolder= getDirectory(""); 
        print(inputFolder); 
        outputSplit= inputFolder + "/SplitChannel_2/";  
        
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
				saveAs("Tiff", outputSplit + "blue_" +imagesName);
                close(); 
                selectWindow("C2-" + imagesName);
                run("8-bit");
                run("Enhance Contrast...", "saturated=1");
	  			run("Subtract Background...", "rolling=20");
				run("Gaussian Blur...", "sigma=2");
				run("Grays");
			  	run("Invert");
				run("Unsharp Mask...", "radius=3 mask=0.5");
				run("Enhance Contrast...", "saturated=50");
				run("RGB Color");
                saveAs("Tiff", outputSplit + "green_" +imagesName);	
                close(); 
                selectWindow("C3-" + imagesName);  
                run("8-bit");
                run("Enhance Contrast...", "saturated=1");
	  			run("Subtract Background...", "rolling=20");
				run("Gaussian Blur...", "sigma=2");
                saveAs("Tiff", outputSplit + "red_"+imagesName); 
                close();
                write("Conversion Complete"); 
        
} 
setBatchMode(false); 