::This is to be called by remote_setup.bat and should be run off of the network drive
@echo off
pushd %~dp0
echo ###################################################################################### >> ..\remote_list.txt

hostname >> temphost
set /p name= < temphost
del temphost
del ..\Remote_List\%name%.txt

hostname >> ..\remote_list.txt
ipconfig >> ..\remote_list.txt
echo user list >> ..\remote_list.txt
dir C:\Users >> ..\remote_list.txt

echo # >> ..\remote_list.txt
echo # >> ..\remote_list.txt

move ..\remote_list.txt ..\Remote_List\%name%.txt

::
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
::netsh firewall set service type = remotedesktop mode = enable
::pause
::control sysdm.cpl
exit