setlocal

set ROOT=%~dp0
set CODEGEN_TPLDIR=%ROOT%Templates

rem set the required repository environment variables

set RPSMFIL=%ROOT%LockingRepository\bin\Debug\rpsmain.ism
set RPSTFIL=%ROOT%LockingRepository\bin\Debug\rpstext.ism

set OPTS=-e -r

set structures=locks locks_options locks_traceback

rem Data library
codegen %OPTS% -s %structures% -t Symphony_Data_v3_2 -o %ROOT%LockViewer\Model -n LockViewer.Model

endlocal

