input =  getDirectory("Choose a directory");
output= input + "/8bit/";  
list = getFileList(input);        
File.makeDirectory(output);

setBatchMode(true); 

for (i = 0; i < list.length; i++) {	
	  open(input+list[i]);
	  	run("8-bit");
		bit=getTitle;
		selectWindow(bit);
		saveAs("Tiff", output+getTitle); 
              run("Close All"); 
} 
setBatchMode(false); 
	


