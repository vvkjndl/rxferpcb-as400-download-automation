This script will help you to download multiple files from AS400 without dealing with manual GUI transfers. Files are downloaded in Excel format (BIFF 8.0).

While you can create multiple transfer files and then run them in batch but it is a very time-consuming process to create a transfer file for individual files to be downloaded.

With this script you only have to create a single text file containing a list of all files to be downloaded.

![Text file input](https://raw.githubusercontent.com/vivekjindal/rxferpcb-ibmi-download-automation/master/images/screenshot1.png)

# Usage
- IBM i Access for Windows must be installed.
- 7-Zip must be installed. __(Optional)__
- Create a text (.txt) file on your desktop and enter the list of files. Save the file and close.
- Run the script and enter the name of the file you just saved without extension (.txt).
- Enter userid, password, library name and host/ip name; download will start.

![Script interaction](https://raw.githubusercontent.com/vivekjindal/rxferpcb-ibmi-download-automation/master/images/screenshot2.png)

Script will inform you which file is currently being downloaded; which one was downloaded successfully and which one failed.

Once the download completes, script will check if you have 7-Zip installed in your computer. If 7-Zip installation is found then script will zip the files and remove the downloaded files else it will skip the zip and deletion operations.

Script will print the start and end time so that you can get an idea about how long it took if the input text file contained a lot of files.

![Script operation](https://raw.githubusercontent.com/vivekjindal/rxferpcb-ibmi-download-automation/master/images/screenshot3.png)


# Limitations

Download process doesn't take advantage of multiple cores of CPU. So if you need to download 150 files and you have 4 CPU cores, it will be a good idea to split these files into 3 text files (50 each). Keep 1 core free for normal user operations.

**Note:** Make sure you have sufficient network bandwidth before you apply this approach.
