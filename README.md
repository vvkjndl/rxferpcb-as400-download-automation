This script will help you too download multiple files from AS400 without the pain of dealing with manual GUI transfers.

While you can create multiple transfer files and then run them in batch but it is very time-consuming to create a transfer file for individual files to be downloaded. With this script you only have to create a single text file containing a list of all files to be downloaded.  
![Text file input](https://raw.githubusercontent.com/vivekjindal/rxferpcb-ibmi-download-automation/master/images/screenshot1.png)

# Usage
1. IBM i Access for Windows must be installed.
2. 7-Zip must be installed. __(Optional)__
2. Create a text (.txt) file on your desktop and enter list of files. Save the file.
3. Run the script and enter the name of the file you just saved without extension (.txt).
4. Enter userid, password, library name and host/ip name. Download will start.  
![Script interaction](https://raw.githubusercontent.com/vivekjindal/rxferpcb-ibmi-download-automation/master/images/screenshot2.png)

Script will inform you which file is currently being downloaded. Which was downloaded successfully and which one failed.

Once the download completes script will check if you have 7-Zip installed in your computer. If 7-Zip installation is found then script will zip the files and remove the downloaded files else it will skip the zip and delete operations.

Script will print the start and end time so that you can get an idea about how long it took if the input text file contained a lot of files.  
![Script operation](https://raw.githubusercontent.com/vivekjindal/rxferpcb-ibmi-download-automation/master/images/screenshot3.png)


# Limitations

Download process doesn't take advantage of multiple cores of CPU. So if you need to download 150 files and you have 4 CPU cores, it will be a great idea to split these files in 3 text files (50 each). Keep 1 core free for normal user operations.
