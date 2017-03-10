[Setup]
AppName=Payroll
AppVerName=Payroll Ver 1.2.20
AppPublisher=www.Yolk-it.com
AllowCancelDuringInstall = yes
DefaultDirName={pf}\Payroll
DefaultGroupName=Yolk
Compression = lzma
SolidCompression = yes
OutputBaseFilename=Setup Payroll V 1.2.20
AllowNoIcons = yes
AlwaysRestart = no
AlwaysShowComponentsList = no
DisableProgramGroupPage = yes
AppendDefaultDirName = yes
CreateUninstallRegKey = yes
DisableStartupPrompt = yes
LanguageDetectionMethod=none
ShowLanguageDialog=no
Uninstallable = yes
UninstallFilesDir={app}\uninst
UninstallDisplayIcon={app}\unpayroll.exe,0
WindowVisible = no
AppCopyright=Copyright © 2015 Yolk
FlatComponentsList = yes
PrivilegesRequired = admin
VersionInfoVersion=1.2.20
SetupIconFile=Setup.ico
WizardImageFile=lighting.bmp
WizardSmallImageFile=yolk.bmp



[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: installmysql; Description: "Install MySQL"; GroupDescription: "Install Database:"; Flags: checkedonce

[Icons]
Name: {group}\Payroll; Filename: {app}\Payroll.exe; WorkingDir: {app}
Name: {userdesktop}\Payroll; Filename: {app}\Payroll.exe; WorkingDir: {app}; Tasks: desktopicon
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\Payroll; Filename: {app}\Payroll.exe; WorkingDir: {app}; Tasks: quicklaunchicon

[Files]

;Visual Basic Runtime
Source: \\192.168.100.3\Setup\VB6\VB6STKIT.DLL; DestDir: {sys}; Flags: uninsneveruninstall onlyifdoesntexist
Source: \\192.168.100.3\Setup\VB6\COMCAT.DLL; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
;Source: F:\MY PROJECT\ocx&dll\VB6\stdole2.tlb; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regtypelib
Source: \\192.168.100.3\Setup\VB6\asycfilt.dll; DestDir: {sys}; Flags: uninsneveruninstall onlyifdoesntexist
Source: \\192.168.100.3\Setup\VB6\olepro32.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\VB6\oleaut32.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\VB6\msvbvm60.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist


;file-file MySQL
Source: "\\192.168.100.3\Setup\MySQL Server 5.1\bin\*"; DestDir: "{pf}\MySQL\MySQL Server 5.1\bin"; Flags: ignoreversion; Tasks: installmysql
Source: "\\192.168.100.3\Setup\MySQL Server 5.1\share\*"; DestDir: "{pf}\MySQL\MySQL Server 5.1\share"; Flags: ignoreversion recursesubdirs; Tasks: installmysql
Source: "C:\Documents and Settings\All Users\Application Data\MySQL\MySQL Server 5.1\data\ibdata1"; DestDir: "{pf}\MySQL\MySQL Server 5.1\data"; Flags: ignoreversion recursesubdirs uninsneveruninstall; Tasks: installmysql
Source: "C:\Documents and Settings\All Users\Application Data\MySQL\MySQL Server 5.1\data\yolkpayroll\*"; DestDir: "{pf}\MySQL\MySQL Server 5.1\data\yolkpayroll"; Flags: ignoreversion recursesubdirs uninsneveruninstall; Tasks: installmysql
Source: "C:\Documents and Settings\All Users\Application Data\MySQL\MySQL Server 5.1\data\mysql\*"; DestDir: "{pf}\MySQL\MySQL Server 5.1\data\mysql"; Flags: ignoreversion recursesubdirs uninsneveruninstall; Tasks: installmysql
Source: "\\192.168.100.3\Setup\MySQL Server 5.1\*"; DestDir: "{pf}\MySQL\MySQL Server 5.1"; Flags: ignoreversion; Tasks: installmysql

;daftar file MySQL ODBC 5.1
Source: "\\192.168.100.3\Setup\MySQLodbc\myodbc5.dll"; DestDir: "{sys}"; Flags: onlyifdoesntexist
Source: "\\192.168.100.3\Setup\MySQLodbc\myodbc5S.dll"; DestDir: "{sys}"; Flags: onlyifdoesntexist
Source: "\\192.168.100.3\Setup\MySQLodbc\myodbc5.lib"; DestDir: "{sys}"; Flags: onlyifdoesntexist
Source: "\\192.168.100.3\Setup\MySQLodbc\myodbc5S.lib"; DestDir: "{sys}"; Flags: onlyifdoesntexist
Source: "\\192.168.100.3\Setup\MySQLodbc\myodbc-installer.exe"; DestDir: "{sys}"; Flags: onlyifdoesntexist


Source: \\192.168.100.3\Setup\mysql.exe; DestDir: {sys}; Flags: onlyifdoesntexist
Source: \\192.168.100.3\Setup\mysqldump.exe; DestDir: {sys}; Flags: onlyifdoesntexist


;file Project

Source: \\192.168.100.3\Setup\Set\Payroll\Payroll.exe; DestDir: {app}; Flags: ignoreversion
Source: \\192.168.100.3\Setup\Set\Payroll\Report\*.*; DestDir: {app}\Report; Flags: ignoreversion recursesubdirs
Source: \\192.168.100.3\Setup\Set\Payroll\Res\*.*; DestDir: {app}\Res; Flags: ignoreversion recursesubdirs
Source: \\192.168.100.3\Setup\Set\Payroll\calendarmultipleschedulessample.xtp_cal; DestDir: {app}; Flags: ignoreversion
;Source: F:\MY PROJECT\On progress\SimplePOS\POS1.exe; DestDir: {app}; Flags: ignoreversion
;Source: F:\MY PROJECT\On progress\SimplePOS\image\*.*; DestDir: {app}\image; Flags: ignoreversion recursesubdirs
;Source: F:\MY PROJECT\On progress\SimplePOS\Res\*.*; DestDir: {app}\Res; Flags: ignoreversion recursesubdirs
;Source: F:\MY PROJECT\Yolk\Alat-Kontraktor\Styles\*.*; DestDir: {app}\Styles; Flags: ignoreversion recursesubdirs
              

Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\dao360.dll; DestDir: {dao}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSCOMCTL.OCX; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist

Source: \\192.168.100.3\Setup\ocx&dll\ocxCT\comct232.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxCT\comctl32.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxCT\MSADODC.OCX; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxCT\MSCHRT20.OCX; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxCT\MSCOMCTL.OCX; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxCT\MSDATGRD.OCX; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxCT\MSSTDFMT.DLL; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxCT\MSWINSCK.OCX; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist

Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSINET.OCX; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\COMCT332.OCX; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\comdlg32.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\CRPAIG80.DLL; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\CRPE32.DLL; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\ExpSrv.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MFC42.DLL; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\mscomct2.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\msexch40.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\msexcl40.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\msflxgrd.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSJet40.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSJInt40.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSJtEr40.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSJtEs40.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\msltus40.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\mspbde40.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSRD2x40.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSRD3x40.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MsRepl40.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\mstext40.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSVCRT.DLL; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSWDat10.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\MSWStr10.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\msxbde40.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\p2BBND.DLL; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\VB5DB.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\VBAJet32.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\todl7.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist

;CR
Source: \\192.168.100.3\Setup\ocx&dll\CR\craxdrt.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\crpaig32.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\crviewer.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\Crxlat32.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\Crystl32.OCX; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\Implode.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\oleaut32.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\olepro32.dll; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\p2bbde.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\P2bbnd.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\p2bdao.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\p2ctdao.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\p2irdao.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\p2sifmx.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\P2smon.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\p2sodbc.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\p2soledb.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\p2sora7.dll; DestDir: {sys}; Flags:  sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\p2ssql.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\p2ssyb10.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\SSCSDK32.DLL; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\CR\export\*; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist


Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\txtangka.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
;Source: F:\MY PROJECT\ocx&dll\ocxLeasing\Codejock.CommandBars.v13.0.0.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\ocxLeasing\Codejock.SkinFramework.v13.0.0.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\vsflex8.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\vsflex8l.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\Codejock.Controls.v15.0.1.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\Codejock.CommandBars.v15.0.1.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\Codejock.Calendar.v15.0.1.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\Codejock.Calendar.Unicode.v15.0.1.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
;Source: \\192.168.100.3\Setup\ocx&dll\Codejock.Calendar.x64.v15.0.1.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\Codejock.SkinFramework.v15.0.1.ocx; DestDir: {sys}; Flags: uninsneveruninstall sharedfile regserver onlyifdoesntexist
Source: \\192.168.100.3\Setup\ocx&dll\Codejock.Calendar.v15.0.1.lic; DestDir: {sys}; Flags: ignoreversion
Source: \\192.168.100.3\Setup\ocx&dll\msado15.dll; DestDir: {sys}; Flags: sharedfile onlyifdoesntexist
;Source: "calibri_0.ttf"; DestDir: "{fonts}"; FontInstall: "Calibri"; Flags: onlyifdoesntexist uninsneveruninstall
;Source: "calibrib_0.ttf"; DestDir: "{fonts}"; FontInstall: "Calibri"; Flags: onlyifdoesntexist uninsneveruninstall
;Source: "calibrii_0.ttf"; DestDir: "{fonts}"; FontInstall: "Calibri"; Flags: onlyifdoesntexist uninsneveruninstall
;Source: "calibriz_0.ttf"; DestDir: "{fonts}"; FontInstall: "Calibri"; Flags: onlyifdoesntexist uninsneveruninstall



[INI]
Filename: "{pf}\MySQL\MySQL Server 5.1\my.ini"; Section: mysqld; Key: basedir; String: "{pf}\MySQL\MySQL Server 5.1"; Tasks: installmysql
Filename: "{pf}\MySQL\MySQL Server 5.1\my.ini"; Section: mysqld; Key: datadir; String: "{pf}\MySQL\MySQL Server 5.1\data"; Tasks: installmysql

[Run]
;install service MySQL
Filename: "{pf}\MySQL\MySQL Server 5.1\bin\mysqld.exe"; Parameters: "install ""MySQL"""; StatusMsg: "Sedang menginstall service MySQL ..."; Flags: runhidden; MinVersion: 0,5.01.2600sp2; Tasks: installmysql

;jalankan service MySQL
Filename: {sys}\net.exe; Parameters: "start ""MySQL"""; StatusMsg: "Sedang menjalankan service MySQL ..."; Flags: runhidden; MinVersion: 0.0,4.0.1381; Tasks: installmysql


;mendaftarkan port default mysql (3306) ke firewall
Filename: "{sys}\netsh.exe"; Parameters: "firewall add portopening TCP 3306 ""Port MySQL"""; StatusMsg: "Sedang mendaftarkan port MySQL ..."; Flags: runhidden; MinVersion: 0,5.01.2600sp2
Filename: "{sys}\netsh.exe"; Parameters: "firewall set service type = fileandprint mode = enable"; StatusMsg: "Mengaktifkan File and Printer Sharing ..."; Flags: runhidden; MinVersion: 0,5.01.2600sp2

;mengganti password default root (blank). ex : 26110711
;Filename: "{app}\mysql\bin\mysqladmin.exe"; Parameters: "-uroot password 26110711"; StatusMsg: "Mengganti password root"; Flags: runhidden; MinVersion: 0,5.01.2600sp2


;set agar user root bisa login dari mesin lain (kalo diperlukan)
Filename: "{pf}\MySQL\MySQL Server 5.1\bin\mysql.exe"; Parameters: "-uroot -pL1v326110711 -e ""GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY 'L1v326110711'"""; Flags: runhidden; MinVersion: 0,5.01.2600sp2
Filename: "{pf}\MySQL\MySQL Server 5.1\bin\mysql.exe"; Parameters: "-uroot -pL1v326110711 -e ""FLUSH PRIVILEGES"""; Flags: runhidden; MinVersion: 0,5.01.2600sp2

;membuat database kosong
Filename: "{pf}\MySQL\MySQL Server 5.1\bin\mysql.exe"; Parameters: "-uroot -pL1v326110711 -e ""CREATE DATABASE ABC"""; Flags: runhidden; MinVersion: 0,5.01.2600sp2

;install driver myodbc
Filename: "{sys}\myodbc-installer.exe"; Parameters: "-d -a -n ""MySQL ODBC 5.1 Driver"" -t ""DRIVER=myodbc5.dll;SETUP=myodbc5S.dll"""; StatusMsg: "Tunggu sedang mendaftarkan driver MySQL Connector ODBC 5.1.5"; Flags: runhidden

[UninstallRun]
Filename: {sys}\net.exe; Parameters: "stop ""MySQL"""; StatusMsg: "Menghentikan Service MySQL ..."; Flags: runhidden; MinVersion: 0.0,4.0.1381
Filename: "{pf}\MySQL\MySQL Server 5.1\bin\mysqld.exe"; Parameters: "remove ""MySQL"""; StatusMsg: "Sedang menghapus service MySQL ..."; Flags: runhidden; MinVersion: 0,5.01.2600sp2
Filename: "{sys}\myodbc-installer.exe"; Parameters: "-d -r -n ""MySQL ODBC 5.1 Driver"""; StatusMsg: "Tunggu sedang menghapus driver MySQL Connector ODBC 5.1.5"; Flags: runhidden

