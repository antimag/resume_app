@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\RailsInstaller\Ruby2.2.0\bin\ruby.exe" "D:/workspace/assignment/resume/vendor/bundle/ruby/2.2.0/bin/htmldiff" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\RailsInstaller\Ruby2.2.0\bin\ruby.exe" "%~dpn0" %*