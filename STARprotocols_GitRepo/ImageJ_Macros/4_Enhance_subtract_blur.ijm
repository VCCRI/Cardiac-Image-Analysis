input =  getDirectory("Choose a directory");
output= input + "/Processed/";  
list = getFileList(input);        
File.makeDirectory(output);

setBatchMode(true); 

for (i = 0; i < list.length; i++) {	
	  open(input+list[i]);
		run("Enhance Contrast...", "saturated=1");
		enhanced=getTitle;
	  	run("Subtract Background...", "rolling=20");
		subbed=getTitle;
		run("Gaussian Blur...", "sigma=2");
		blurred=getTitle;
		selectWindow(blurred);
		saveAs("tiff", output+getTitle); 
              run("Close All"); 
} 
setBatchMode(false); 
	


