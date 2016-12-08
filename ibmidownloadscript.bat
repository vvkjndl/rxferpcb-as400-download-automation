@echo off

rem	#################################################################################################
rem		Author: 				FNFIS\e3025459
rem 	Script:					Script to download multiple files from IBM i with least efforts
rem	#################################################################################################


rem		Initiliaze file/folder variables
:filefoldersubroutine
set /P "inputfilename=Enter text file name on desktop containing list of files to download: "
IF EXIST %userprofile%\desktop\%inputfilename%.txt (echo.) ELSE (echo Incorrect file name. Please try again && goto filefoldersubroutine)
set "input=%userprofile%\desktop\%inputfilename%.txt"
mkdir %userprofile%\desktop\%inputfilename%
set "workingdir=%userprofile%\desktop\%inputfilename%"
set "filenameold=empty"


rem		Initialize authentication variables
set /P "userid=Enter userid: "
set /P "password=Enter password: "

rem		Initialize IBM i variables
set /P "libname=Enter library name: "
set /P "host=Enter Hostname/IP of LPAR: "

rem		Record start date/time
set "starttime=%date% %time%"

rem		Create a generic IBM i dtf file
echo [DataTransferFromAS400] > %workingdir%\ibmigeneric.dtf
echo Version=2.0 >> %workingdir%\ibmigeneric.dtf
echo [HostInfo] >> %workingdir%\ibmigeneric.dtf
echo Database=*SYSBAS >> %workingdir%\ibmigeneric.dtf
echo HostFile=%libname%/empty >> %workingdir%\ibmigeneric.dtf
echo HostName=%host% >> %workingdir%\ibmigeneric.dtf
echo [ClientInfo] >> %workingdir%\ibmigeneric.dtf
echo ASCIITruncation=1 >> %workingdir%\ibmigeneric.dtf
echo ConvType=5 >> %workingdir%\ibmigeneric.dtf
echo CrtOpt=1 >> %workingdir%\ibmigeneric.dtf
echo FDFFile=%workingdir%\empty.FDF >> %workingdir%\ibmigeneric.dtf
echo FDFFormat=1 >> %workingdir%\ibmigeneric.dtf
echo FileOps=503209343 >> %workingdir%\ibmigeneric.dtf
echo OutputDevice=2 >> %workingdir%\ibmigeneric.dtf
echo PCFile=%workingdir%\empty.xls >> %workingdir%\ibmigeneric.dtf
echo PCFileType=16 >> %workingdir%\ibmigeneric.dtf
echo SaveFDF=0 >> %workingdir%\ibmigeneric.dtf
echo [SQL] >> %workingdir%\ibmigeneric.dtf
echo EnableGroup=0 >> %workingdir%\ibmigeneric.dtf
echo GroupBy= >> %workingdir%\ibmigeneric.dtf
echo Having= >> %workingdir%\ibmigeneric.dtf
echo JoinBy= >> %workingdir%\ibmigeneric.dtf
echo MissingFields=0 >> %workingdir%\ibmigeneric.dtf
echo OrderBy= >> %workingdir%\ibmigeneric.dtf
echo SQLSelect= >> %workingdir%\ibmigeneric.dtf
echo Select=* >> %workingdir%\ibmigeneric.dtf
echo Where= >> %workingdir%\ibmigeneric.dtf
echo [Options] >> %workingdir%\ibmigeneric.dtf
echo DateFmt=MDY >> %workingdir%\ibmigeneric.dtf
echo DateSep=[/] >> %workingdir%\ibmigeneric.dtf
echo DecimalSep=. >> %workingdir%\ibmigeneric.dtf
echo IgnoreDecErr=1 >> %workingdir%\ibmigeneric.dtf
echo Lang=0 >> %workingdir%\ibmigeneric.dtf
echo LangID= >> %workingdir%\ibmigeneric.dtf
echo SortSeq=0 >> %workingdir%\ibmigeneric.dtf
echo SortTable= >> %workingdir%\ibmigeneric.dtf
echo TimeFmt=HMS >> %workingdir%\ibmigeneric.dtf
echo TimeSep=[:] >> %workingdir%\ibmigeneric.dtf
echo [HTML] >> %workingdir%\ibmigeneric.dtf
echo AutoSize=0 >> %workingdir%\ibmigeneric.dtf
echo AutoSizeKB=128 >> %workingdir%\ibmigeneric.dtf
echo CapAlign=0 >> %workingdir%\ibmigeneric.dtf
echo CapIncNum=0 >> %workingdir%\ibmigeneric.dtf
echo CapSize=6 >> %workingdir%\ibmigeneric.dtf
echo CapStyle=1 >> %workingdir%\ibmigeneric.dtf
echo Caption= >> %workingdir%\ibmigeneric.dtf
echo CellAlignN=0 >> %workingdir%\ibmigeneric.dtf
echo CellAlignT=0 >> %workingdir%\ibmigeneric.dtf
echo CellSize=6 >> %workingdir%\ibmigeneric.dtf
echo CellWrap=1 >> %workingdir%\ibmigeneric.dtf
echo Charset= >> %workingdir%\ibmigeneric.dtf
echo ConvInd=0 >> %workingdir%\ibmigeneric.dtf
echo DateTimeLoc=0 >> %workingdir%\ibmigeneric.dtf
echo IncDateTime=0 >> %workingdir%\ibmigeneric.dtf
echo OverWrite=1 >> %workingdir%\ibmigeneric.dtf
echo RowAlignGenH=0 >> %workingdir%\ibmigeneric.dtf
echo RowAlignGenV=0 >> %workingdir%\ibmigeneric.dtf
echo RowAlignHdrH=0 >> %workingdir%\ibmigeneric.dtf
echo RowAlignHdrV=0 >> %workingdir%\ibmigeneric.dtf
echo RowStyleGen=1 >> %workingdir%\ibmigeneric.dtf
echo RowSytleHdr=1 >> %workingdir%\ibmigeneric.dtf
echo TabAlign=0 >> %workingdir%\ibmigeneric.dtf
echo TabBW=1 >> %workingdir%\ibmigeneric.dtf
echo TabCP=1 >> %workingdir%\ibmigeneric.dtf
echo TabCS=1 >> %workingdir%\ibmigeneric.dtf
echo TabCols=2 >> %workingdir%\ibmigeneric.dtf
echo TabMap=1 >> %workingdir%\ibmigeneric.dtf
echo TabRows=2 >> %workingdir%\ibmigeneric.dtf
echo TabWidth=100 >> %workingdir%\ibmigeneric.dtf
echo TabWidthP=0 >> %workingdir%\ibmigeneric.dtf
echo Template= >> %workingdir%\ibmigeneric.dtf
echo TemplateTag= >> %workingdir%\ibmigeneric.dtf
echo Title= >> %workingdir%\ibmigeneric.dtf
echo UseTemplate=0 >> %workingdir%\ibmigeneric.dtf
echo [Properties] >> %workingdir%\ibmigeneric.dtf
echo AutoClose=0 >> %workingdir%\ibmigeneric.dtf
echo AutoRun=0 >> %workingdir%\ibmigeneric.dtf
echo Check4Untrans=0 >> %workingdir%\ibmigeneric.dtf
echo Convert65535=0 >> %workingdir%\ibmigeneric.dtf
echo DisSysName=0 >> %workingdir%\ibmigeneric.dtf
echo DispLongSchemaName=1 >> %workingdir%\ibmigeneric.dtf
echo Notify=1 >> %workingdir%\ibmigeneric.dtf
echo SQLStmt=0 >> %workingdir%\ibmigeneric.dtf
echo ShowWarnings=31 >> %workingdir%\ibmigeneric.dtf
echo StoreDecFAsChar=1 >> %workingdir%\ibmigeneric.dtf
echo UseAlias=1 >> %workingdir%\ibmigeneric.dtf
echo UseCompression=1 >> %workingdir%\ibmigeneric.dtf
echo UseSSL=2 >> %workingdir%\ibmigeneric.dtf
echo UserOption=0 >> %workingdir%\ibmigeneric.dtf

rem		Read the input file and call secondary function
for /F "delims=" %%a IN (%input%) do (call :sandrsubroutine %%a)
del %workingdir%\ibmigeneric.dtf

rem		Perform ZIP operation
echo.
echo.
echo.
echo Searching for 7-Zip 32-bit functionality
IF EXIST "%programfiles(x86)%\7-Zip\7z.exe" (echo 7-Zip 32-Bit found. && "%programfiles(x86)%\7-Zip"\7z.exe a -tzip -mx1 -mmt=on %userprofile%\desktop\%inputfilename%.zip %workingdir% && goto :end) else (echo ***7-Zip 32-Bit not found. Trying with 7-Zip 64-Bit.***)
echo.
IF EXIST "%programfiles%\7-Zip\7z.exe" (echo 7-Zip 64-Bit found. && "%programfiles%\7-Zip"\7z.exe a -tzip -mx1 -mmt=on %userprofile%\desktop\%inputfilename%.zip %workingdir%) else (echo *****7-Zip 64-Bit wasn't found either. Please do manual compression.*****)

:end
rem		Perform deletion
rem		***Commenting this out. It's too risky to delete the files in case ZIP operation fails.*** rmdir /S /Q %userprofile%\desktop\%inputfilename%

rem		Record end date/time
set "endtime=%date% %time%"

rem		Print start/end and date/time, and end the script
echo.
echo.
echo Script started at %starttime%.
echo Script completed at %endtime%.
pause
GOTO :eof

rem		Do the Magic!
:sandrsubroutine
set "filenamenew=%1"
echo Currently downloading %filenamenew%.
for /F "delims=" %%b in ('type "%workingdir%\ibmigeneric.dtf" ^& break ^> "%workingdir%\ibmigeneric.dtf" ') do (
	set "line=%%b"
	setlocal enabledelayedexpansion
	set "line=!line:%filenameold%=%filenamenew%!"
	>>"%workingdir%\ibmigeneric.dtf" echo(!line!
	endlocal
)

rem		Start downloading
rxferpcb.exe "%workingdir%"\ibmigeneric.dtf  %userid% %password% >> %userprofile%\desktop\%inputfilename%_scriptlogs.log
set "filenameold=%filenamenew%"
GOTO :eof