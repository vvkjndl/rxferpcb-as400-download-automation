@echo off

:: ################################################################################################
:: Script Repository URL:	https://github.com/vivekjindal/rxferpcb-as400-download-automation
:: ################################################################################################


:: script configuration
:config
set /P "filename=Enter text file name on your desktop containing list of files to download: "
set "workpath=%userprofile%\desktop"
IF EXIST %workpath%\%filename%.txt (echo.) ELSE (echo File name didn't match. Try again && goto config)
mkdir %workpath%\%filename% > nul 2> nul
set /P "userid=Enter userid: "
set /P "password=Enter password: "
set /P "libname=Enter library name: "
set /P "hostname=Enter Hostname/IP of LPAR: "
set "filestring1=empty"
echo.

:: record start date/time
set "starttime=%date% %time%"

:: create IBM i dtf file
echo [DataTransferFromAS400] > %workpath%\%filename%\%filename%.dtf
echo Version=2.0 >> %workpath%\%filename%\%filename%.dtf
echo [HostInfo] >> %workpath%\%filename%\%filename%.dtf
echo Database=*SYSBAS >> %workpath%\%filename%\%filename%.dtf
echo HostFile=%libname%/%filestring1% >> %workpath%\%filename%\%filename%.dtf
echo HostName=%hostname% >> %workpath%\%filename%\%filename%.dtf
echo [ClientInfo] >> %workpath%\%filename%\%filename%.dtf
echo ASCIITruncation=1 >> %workpath%\%filename%\%filename%.dtf
echo ConvType=5 >> %workpath%\%filename%\%filename%.dtf
echo CrtOpt=1 >> %workpath%\%filename%\%filename%.dtf
echo FDFFile=%workpath%\%filename%\%filestring1%.fdf >> %workpath%\%filename%\%filename%.dtf
echo FDFFormat=1 >> %workpath%\%filename%\%filename%.dtf
echo FileOps=503209343 >> %workpath%\%filename%\%filename%.dtf
echo OutputDevice=2 >> %workpath%\%filename%\%filename%.dtf
echo PCFile=%workpath%\%filename%\%filestring1%.xls >> %workpath%\%filename%\%filename%.dtf
echo PCFileType=16 >> %workpath%\%filename%\%filename%.dtf
echo SaveFDF=0 >> %workpath%\%filename%\%filename%.dtf
echo [SQL] >> %workpath%\%filename%\%filename%.dtf
echo EnableGroup=0 >> %workpath%\%filename%\%filename%.dtf
echo GroupBy= >> %workpath%\%filename%\%filename%.dtf
echo Having= >> %workpath%\%filename%\%filename%.dtf
echo JoinBy= >> %workpath%\%filename%\%filename%.dtf
echo MissingFields=0 >> %workpath%\%filename%\%filename%.dtf
echo OrderBy= >> %workpath%\%filename%\%filename%.dtf
echo SQLSelect= >> %workpath%\%filename%\%filename%.dtf
echo Select=* >> %workpath%\%filename%\%filename%.dtf
echo Where= >> %workpath%\%filename%\%filename%.dtf
echo [Options] >> %workpath%\%filename%\%filename%.dtf
echo DateFmt=MDY >> %workpath%\%filename%\%filename%.dtf
echo DateSep=[/] >> %workpath%\%filename%\%filename%.dtf
echo DecimalSep=. >> %workpath%\%filename%\%filename%.dtf
echo IgnoreDecErr=1 >> %workpath%\%filename%\%filename%.dtf
echo Lang=0 >> %workpath%\%filename%\%filename%.dtf
echo LangID= >> %workpath%\%filename%\%filename%.dtf
echo SortSeq=0 >> %workpath%\%filename%\%filename%.dtf
echo SortTable= >> %workpath%\%filename%\%filename%.dtf
echo TimeFmt=HMS >> %workpath%\%filename%\%filename%.dtf
echo TimeSep=[:] >> %workpath%\%filename%\%filename%.dtf
echo [HTML] >> %workpath%\%filename%\%filename%.dtf
echo AutoSize=0 >> %workpath%\%filename%\%filename%.dtf
echo AutoSizeKB=128 >> %workpath%\%filename%\%filename%.dtf
echo CapAlign=0 >> %workpath%\%filename%\%filename%.dtf
echo CapIncNum=0 >> %workpath%\%filename%\%filename%.dtf
echo CapSize=6 >> %workpath%\%filename%\%filename%.dtf
echo CapStyle=1 >> %workpath%\%filename%\%filename%.dtf
echo Caption= >> %workpath%\%filename%\%filename%.dtf
echo CellAlignN=0 >> %workpath%\%filename%\%filename%.dtf
echo CellAlignT=0 >> %workpath%\%filename%\%filename%.dtf
echo CellSize=6 >> %workpath%\%filename%\%filename%.dtf
echo CellWrap=1 >> %workpath%\%filename%\%filename%.dtf
echo Charset= >> %workpath%\%filename%\%filename%.dtf
echo ConvInd=0 >> %workpath%\%filename%\%filename%.dtf
echo DateTimeLoc=0 >> %workpath%\%filename%\%filename%.dtf
echo IncDateTime=0 >> %workpath%\%filename%\%filename%.dtf
echo OverWrite=1 >> %workpath%\%filename%\%filename%.dtf
echo RowAlignGenH=0 >> %workpath%\%filename%\%filename%.dtf
echo RowAlignGenV=0 >> %workpath%\%filename%\%filename%.dtf
echo RowAlignHdrH=0 >> %workpath%\%filename%\%filename%.dtf
echo RowAlignHdrV=0 >> %workpath%\%filename%\%filename%.dtf
echo RowStyleGen=1 >> %workpath%\%filename%\%filename%.dtf
echo RowSytleHdr=1 >> %workpath%\%filename%\%filename%.dtf
echo TabAlign=0 >> %workpath%\%filename%\%filename%.dtf
echo TabBW=1 >> %workpath%\%filename%\%filename%.dtf
echo TabCP=1 >> %workpath%\%filename%\%filename%.dtf
echo TabCS=1 >> %workpath%\%filename%\%filename%.dtf
echo TabCols=2 >> %workpath%\%filename%\%filename%.dtf
echo TabMap=1 >> %workpath%\%filename%\%filename%.dtf
echo TabRows=2 >> %workpath%\%filename%\%filename%.dtf
echo TabWidth=100 >> %workpath%\%filename%\%filename%.dtf
echo TabWidthP=0 >> %workpath%\%filename%\%filename%.dtf
echo Template= >> %workpath%\%filename%\%filename%.dtf
echo TemplateTag= >> %workpath%\%filename%\%filename%.dtf
echo Title= >> %workpath%\%filename%\%filename%.dtf
echo UseTemplate=0 >> %workpath%\%filename%\%filename%.dtf
echo [Properties] >> %workpath%\%filename%\%filename%.dtf
echo AutoClose=1 >> %workpath%\%filename%\%filename%.dtf
echo AutoRun=1 >> %workpath%\%filename%\%filename%.dtf
echo Check4Untrans=0 >> %workpath%\%filename%\%filename%.dtf
echo Convert65535=0 >> %workpath%\%filename%\%filename%.dtf
echo DisSysName=1 >> %workpath%\%filename%\%filename%.dtf
echo DispLongSchemaName=1 >> %workpath%\%filename%\%filename%.dtf
echo Notify=1 >> %workpath%\%filename%\%filename%.dtf
echo SQLStmt=0 >> %workpath%\%filename%\%filename%.dtf
echo ShowWarnings=0 >> %workpath%\%filename%\%filename%.dtf
echo StoreDecFAsChar=1 >> %workpath%\%filename%\%filename%.dtf
echo UseAlias=1 >> %workpath%\%filename%\%filename%.dtf
echo UseCompression=1 >> %workpath%\%filename%\%filename%.dtf
echo UseSSL=0 >> %workpath%\%filename%\%filename%.dtf
echo UserOption=2 >> %workpath%\%filename%\%filename%.dtf

:: read the file and call file replace function
for /F "delims=" %%a IN (%workpath%\%filename%.txt) do (call :replacefilename %%a)

:: record end date/time
set "endtime=%date% %time%"

:: perform cleanup and zip operation
del %workpath%\%filename%\%filename%.dtf > nul 2> nul
del %workpath%\%filename%\%filename%.log > nul 2> nul
del %workpath%\%filename%.zip > nul 2> nul
echo. && echo.
echo Checking if 7-Zip is installed...
IF EXIST "%programfiles(x86)%\7-Zip\7z.exe" ("%programfiles(x86)%\7-Zip"\7z.exe a -tzip -mx1 -mmt=on %workpath%\%filename%.zip %workpath%\%filename%\* && goto :zipend)
IF EXIST "%programfiles%\7-Zip\7z.exe" ("%programfiles%\7-Zip"\7z.exe a -tzip -mx1 -mmt=on %workpath%\%filename%.zip %workpath%\%filename%\* && goto :zipend)
echo 7-Zip installation not found.
goto nozipend

:: end the script
:zipend
rd /S /Q %workpath%\%filename%
:nozipend
echo. && echo.
echo Script started at %starttime%.
echo Script completed at %endtime%.
echo.
pause
goto :eof

:: peform the string replacement
:replacefilename
set "filestring2=%1"
echo.
echo Currently downloading %filestring2%.
for /F "delims=" %%b IN ('type "%workpath%\%filename%\%filename%.dtf" ^& break ^> "%workpath%\%filename%\%filename%.dtf"') do (
    set "line=%%b"
    setlocal enabledelayedexpansion
    set "line=!line:%filestring1%=%filestring2%!"
    >>"%workpath%\%filename%\%filename%.dtf" echo(!line!
    endlocal
)

:: start downloading
rxferpcb.exe %workpath%\%filename%\%filename%.dtf %userid% %password% > %workpath%\%filename%\%filename%.log
findstr /L /C:SUCCESSFUL %workpath%\%filename%\%filename%.log > nul
if %ERRORLEVEL%==1 (echo Download failed.) else (echo Download Successful.)
set "filestring1=%filestring2%"
GOTO :eof
