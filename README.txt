NAME
	
	rename.sh rename file

SYNOPSIS
	
	./rename.sh [OPTION]... [FILE]...

DESCRIPTION

	This command is used to rename files or directories in many ways

OPTIONS

	-t 
		Renames files or directories put as parameter to downcase

	-T 
		Renames files or directories put as parameter to Upcase

	-n 
		Removes Extension from files put in parameter

	-N
		Removes Spaces from file or directory names	put in parameter

	-d
		Adds _d to folders put in parameter

	-s 
		Adds extension to file put in parameter

	-g
		Shows Graphical Menu

	-m			
		Shows textual menu

	-v
		Shows author names and info

	-h --help
		Shows the readmefile

NOTES
	
	If the file dosen't need to be renamed a message will pop-up saying that the file was not renamed

	If your file name has Spaces put it in " "

	Filenames with spaces can cause errors

	When adding an extension to a file with an extension it will just add another extension to it without removing the old one		

Example

	$./rename.sh -t FILE FOLDER
		renames FILE And FOLER to file and folder respectively

	$./rename.sh -s file txt
		file becomes file.txt		

WARNING
	
	using this to renmae files from root can cause various problems to your system
