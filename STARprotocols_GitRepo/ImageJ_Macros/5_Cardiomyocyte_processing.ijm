input =  getDirectory("Choose a directory");
output= input + "/CMinverted/";  
list = getFileList(input);        
File.makeDirectory(output);

setBatchMode(true); 

for (i = 0; i < list.length; i++) {	
	  open(input+list[i]);
	  	run("Grays");
		gray=getTitle;
	  	run("Invert");
		inverted=getTitle;
		run("Unsharp Mask...", "radius=3 mask=0.5");
		sharpened=getTitle;
		run("Enhance Contrast...", "saturated=50");
		enhanced=getTitle;
		run("RGB Color");
		rgb=getTitle;
		selectWindow(rgb);
		saveAs("Tiff", output+getTitle); 
              run("Close All"); 
} 
setBatchMode(false); 
	


