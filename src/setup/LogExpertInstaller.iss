; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define AppName "LogExpert"
#define AppVersion "1.9.0"
#define AppURL "https://github.com/zarunbal/LogExpert"
#define AppExeName "LogExpert.exe"

; Path of the inno setup file
#define AppPath SourcePath
#define SetupName "LogExpert.Installer"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{9C6E17B8-912C-45F9-9E7F-49CEAD8D6D7A}
AppName={#AppName}

; Version Information
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}

AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={pf}\{#AppName}
DefaultGroupName={#AppName}
AllowNoIcons=yes

LicenseFile=..\..\LICENSE
;InfoBeforeFile=..\..\CHANGELOG.md
;InfoAfterFile=..\..\README.md
OutputDir=..\..\bin\

OutputBaseFilename={#SetupName}.{#SetupSetting("AppVersion")}
SetupIconFile={#AppPath}..\LogExpert\Resources\logexpert.ico
Compression=lzma2/normal
SolidCompression=yes

; GUI Style, classic or modern
WizardStyle=modern
UsePreviousAppDir=True
DisableWelcomePage=False
ShowTasksTreeLines=True
AlwaysShowGroupOnReadyPage=True
AlwaysShowDirOnReadyPage=True

; needs to be set to false, so reinstalls still show the folder selection
DisableDirPage=False

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\..\bin\Release\LogExpert.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\bin\Release\Licenses\*"; DestDir: "{app}\Licenses\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\bin\Release\plugins\*"; DestDir: "{app}\plugins\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\bin\Release\pluginsx86\*"; DestDir: "{app}\pluginsx86\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\..\bin\Release\ColumnizerLib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\bin\Release\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\bin\Release\LogExpert.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\bin\Release\NLog.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\bin\Release\Start.cmd"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\bin\Release\WeifenLuo.WinFormsUI.Docking.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#AppName}"; Filename: "{app}\{#AppExeName}"
Name: "{group}\{cm:UninstallProgram,{#AppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#AppName}"; Filename: "{app}\{#AppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#AppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
#include "ExtraFunctions.iss"

function InitializeSetup(): Boolean;
var 
    dotNetInstalled: Boolean;
begin
    //check for .net Version 4+ before the installation starts
    dotNetInstalled:=true;
    if not(IsDotNetDetected('v4.7.2',0)) then
    begin
       MsgBox('Microsoft .NET Framework 4.7.2 or higher is required.'#13#13
              'Please update your .net Framework installation!', mbInformation, MB_OK);
       dotNetInstalled := false;
    end;
  result:= dotNetInstalled;
end;