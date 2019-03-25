@echo off
rem targets current directory I think
::pushd %~dp0
::echo ######################################################################################### >> ..\remote_list.txt
::hostname >> ..\remote_list.txt
::ipconfig >> ..\remote_list.txt
::echo user list >> ..\remote_list.txt
::dir C:\Users >> ..\remote_list.txt
::echo remote setup finished
::pause
::echo # >> ..\remote_list.txt
::echo # >> ..\remote_list.txt
::
::net use M: /delete
net use M: \\ECESVW30401.engr.tamu.edu\Software /user:engr\coe-(USERNAME) (PASSWORD) && cd /d M:\Windows\Scripting\justin.matthews
start .\info_grab.bat /k
C:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh firewall set service type = remotedesktop mode = enable
net use M: /delete
::pause
::control sysdm.cpl