@echo off
cd /d %~dp0
set ZT=[˯��/����]
set ZT0=[�ػ�]
set ZX=OVER1
set ZX0=OVER2
set P=[������]
:begin
cls
title ִ��%ZT%���趨

set /a TH0=%time:~0,2%
if %TH0% LSS 10 (
set TH0=10%TH0%) else (
set /a TH0=1%TH0%
)
set /a TM0=1%time:~3,2%
set /a TH2=%TH0%
set /a TM2=%TM0%+30
if %TM2% GEQ 160 set /a TH2=%TH2%+1&set /a TM2=%TM2%-60
if %TH2% GEQ 124 set /a TH2=%TH2%-24
set /a TH3=%TH0%+1
set /a TM3=%TM0%
if %TM3% GEQ 160 set /a TH3=%TH3%+1&set /a TM3=%TM3%-60
if %TH3% GEQ 124 set /a TH3=%TH3%-24
set /a TH4=%TH0%+1
set /a TM4=%TM0%+30
if %TM4% GEQ 160 set /a TH4=%TH4%+1&set /a TM4=%TM4%-60
if %TH4% GEQ 124 set /a TH4=%TH4%-24
set /a TH5=%TH0%+2
set /a TM5=%TM0%
if %TM5% GEQ 160 set /a TH5=%TH5%+1&set /a TM5=%TM5%-60
if %TH5% GEQ 124 set /a TH5=%TH5%-24
set /a TH6=%TH0%+2
set /a TM6=%TM0%+30
if %TM6% GEQ 160 set /a TH6=%TH6%+1&set /a TM6=%TM6%-60
if %TH6% GEQ 124 set /a TH6=%TH6%-24
set /a TH7=%TH0%+3
set /a TM7=%TM0%
if %TM7% GEQ 160 set /a TH7=%TH7%+1&set /a TM7=%TM7%-60
if %TH7% GEQ 124 set /a TH7=%TH7%-24
set /a TH8=%TH0%+3
set /a TM8=%TM0%+30
if %TM8% GEQ 160 set /a TH8=%TH8%+1&set /a TM8=%TM8%-60
if %TH8% GEQ 124 set /a TH8=%TH8%-24

echo ��ѡ��ƻ�����%ZT%��
echo [1]=0:30��Ԥ����[%TH2:~1%:%TM2:~1%]ִ��
echo [2]=1:00��Ԥ����[%TH3:~1%:%TM3:~1%]ִ��
echo [3]=1:30��Ԥ����[%TH4:~1%:%TM4:~1%]ִ��
echo [4]=2:00��Ԥ����[%TH5:~1%:%TM5:~1%]ִ��
echo [5]=2:30��Ԥ����[%TH6:~1%:%TM6:~1%]ִ��
echo [6]=3:00��Ԥ����[%TH7:~1%:%TM7:~1%]ִ��
echo [7]=3:30��Ԥ����[%TH8:~1%:%TM8:~1%]ִ��
echo [8]=�Զ���ʱ��
echo ---------------------------------
echo [9]=����%ZT0%�ƻ�
echo [0]=��������[˯��]��[����]
echo ---------------------------------
echo ע:Ԥ��ʱ����[%TH0:~1,2%:%TM0:~1,2%]��ʼ����
set choice=����
set /p choice=
if %choice%==1 set /a H=100 & set /a M=130&goto run
if %choice%==2 set /a H=101 & set /a M=100&goto run
if %choice%==3 set /a H=101 & set /a M=130&goto run
if %choice%==4 set /a H=102 & set /a M=100&goto run
if %choice%==5 set /a H=102 & set /a M=130&goto run
if %choice%==6 set /a H=103 & set /a M=100&goto run
if %choice%==7 set /a H=103 & set /a M=130&goto run
if %choice%==8 goto setmode
if %choice%==9 set ZT0=%ZT%&set ZT=%ZT0%&set ZX0=%ZX%&set ZX=%ZX0%&goto begin
if %choice%==0 goto SW
set choice0=1234567890
echo %choice%|findstr "[^^%choice0%]">nul&&(echo û��%choice%ѡ�&choice /t 1 /d y /n >nul&goto begin)
echo %choice%|findstr "^0">nul 2>nul&&(echo û��%choice%ѡ�&&choice /t 1 /d y /n >nul&goto begin)
if %choice% GTR 9 echo û��%choice%ѡ�&choice /t 1 /d y /n >nul&goto begin

:SW
cls
echo ��ѡ��:
echo ---------------------------------------------------------------
echo [1]=��Ϊ[˯��](�ڴ治�ϵ������쵫������Ҫ����ά��)
echo [2]=��Ϊ[����](�ڴ�ת��Ӳ��������������Ҫ����ά��)
echo [3]=��������ԱȨ�ޣ����˳����ڳ������Ҽ�ѡ"�Թ���Ա�������")
echo [0]=�������˵�
echo ---------------------------------------------------------------
echo ע���˴��ĸ�����Ҫ����ԱȨ�޲�����Ч������ѡ��ᱻϵͳ���棬֮��ѡ��[˯��/����]�ƻ�����Ӧ�Ľ���˯�߻�����
echo ϵͳĬ���趨Ϊ���ߣ���Ϊ˯��ʱwin10ϵͳ�ڵ�Դ������"�ػ�����"��Ŀ����������ܲ�����ʾ������Ч����Ϊ����ʱ�ָ���ʾ�͹���(����ϵͳ�Դ����������)
set choice=����
set /p choice=
if %choice%==1 goto SWOFF
if %choice%==2 goto SWON
if %choice%==3 goto GETAD
if %choice%==0 goto begin
set choice0=1230
echo %choice%|findstr "[^^%choice0%]">nul&&(echo û��%choice%ѡ�&choice /t 1 /d y /n >nul&goto SW)
echo %choice%|findstr "^0">nul 2>nul&&(echo û��%choice%ѡ�&&choice /t 1 /d y /n >nul&goto SW)
if %choice% GTR 9 echo û��%choice%ѡ�&choice /t 1 /d y /n >nul&goto SW

:SWOFF
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 powercfg -h off&echo �޸����&pause&goto SW
echo �趨������Ҫ����������ԱȨ��(���˳����ڳ������Ҽ�ѡ"�Թ���Ա�������")
pause
goto SW

:SWON
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 powercfg -h on&echo �޸����&pause&goto SW
echo �趨������Ҫ����������ԱȨ��(���˳����ڳ������Ҽ�ѡ"�Թ���Ա�������")
pause
goto SW

:GETAD
cd /d %~dp0
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "�����ɾ��.vbs" del /f /q "�����ɾ��.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"�����ɾ��.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"�����ɾ��.vbs"
echo WScript.Quit >>"�����ɾ��.vbs"
"�����ɾ��.vbs" /f
if exist "�����ɾ��.vbs" del /f /q "�����ɾ��.vbs"
exit
:Admin
echo �Ѿ��ǹ���Ա��ݣ�
pause
goto SW

:setmode
cls
echo [1]=�Ե���ʱ%ZT%
echo [2]=�Ե�ʱ��%ZT%
echo [0]=�������˵�
set /p choice=
if %choice%==1 goto settime1
if %choice%==2 goto settime3
if %choice%==0 goto begin
set choice0=120
echo %choice%|findstr "[^^%choice0%]">nul&&(echo û��%choice%ѡ�&choice /t 1 /d y /n >nul&goto setmode)
echo %choice%|findstr "^0">nul 2>nul&&(echo û��%choice%ѡ�&&choice /t 1 /d y /n >nul&goto setmode)
if %choice% GTR 9 echo û��%choice%ѡ�&choice /t 1 /d y /n >nul&goto setmode

:settime1
cls
set /a min=0
set H=����
echo �Ե���ʱ%ZT%:
echo (__:__)�����뵹��ʱ��Сʱ��(0-23)
echo [X]��[x]=������һ��
set /p H=
if %H%==X goto setmode
if %H%==x goto setmode
set choice0=1234567890
echo %H%|findstr "[^^%choice0%]">nul&&(echo ��������ȷ��������ֵ&choice /t 1 /d y /n >nul&goto settime1)
if %H%==0 set /a min=1&goto contH
echo %H%|findstr "^0">nul 2>nul&&(echo ����Ҫ����"0"��Ϊ��ͷռλ&&choice /t 1 /d y /n >nul&goto settime1)
:contH
if %H% GEQ 24 echo ��������ʾ��Χ���ڵļ�ʱʱ��&choice /t 1 /d y /n >nul&goto settime1
if %H% LSS 10 (
set /a H=10%H%) else (
set /a H=1%H%
)
:settime2
cls
set M=����
echo �Ե���ʱ%ZT%:
echo (%H:~1%:__)�����뵹��ʱ�ķ�����(%min%-59)
echo [X]��[x]=������һ��
set /p M=
if %M%==X goto setmode
if %M%==x goto setmode
set choice0=1234567890
echo %M%|findstr "[^^%choice0%]">nul&&(echo ��������ȷ��������ֵ&choice /t 1 /d y /n >nul&goto settime2)
if %M%==0 goto Z
echo %M%|findstr "^0">nul 2>nul&&(echo ����Ҫ����"0"��Ϊ��ͷռλ&&choice /t 1 /d y /n >nul&goto settime2)
:contM
set /a M=%M%
if %M% GEQ 60 echo ��������ʾ��Χ���ڵļ�ʱʱ��&choice /t 1 /d y /n >nul&goto settime2
if %M% LSS 10 (
set /a M=10%M%) else (
set /a M=1%M%
)
goto run
:Z
if %H%==100 (
echo ��������ʾ��Χ���ڵļ�ʱʱ��&choice /t 1 /d y /n >nul&goto settime2) else (
goto contM
)

:settime3
cls
set /a min=0
set TH=����
echo �Ե�ʱ��%ZT%:
echo (__:__)������ִ��ʱ��Сʱ��(0-23)
echo [X]��[x]=������һ��
set /p TH=
if %TH%==X goto setmode
if %TH%==x goto setmode
set choice0=1234567890
echo %TH%|findstr "[^^%choice0%]">nul&&(echo ��������ȷ��������ֵ&choice /t 1 /d y /n >nul&goto settime3)
if %TH%==0 goto contTH
echo %TH%|findstr "^0">nul 2>nul&&(echo ����Ҫ����"0"��Ϊ��ͷռλ&&choice /t 1 /d y /n >nul&goto settime3)
:contTH
if %TH% GEQ 24 echo ��������ʾ��Χ���ڵļ�ʱʱ��&choice /t 1 /d y /n >nul&goto settime3
if %TH% LSS 10 (
set /a TH=10%TH%) else (
set /a TH=1%TH%
)
:settime4
cls
set TM=����
echo �Ե�ʱ��%ZT%:
echo (%TH:~1%:__)������ִ��ʱ�ķ�����(0-59)
echo [X]��[x]=������һ��
set /p TM=
if %TM%==X goto setmode
if %TM%==x goto setmode
set choice0=1234567890
echo %TM%|findstr "[^^%choice0%]">nul&&(echo ��������ȷ��������ֵ&choice /t 1 /d y /n >nul&goto settime4)
if %TM%==0 goto contTM
echo %TM%|findstr "^0">nul 2>nul&&(echo ����Ҫ����"0"��Ϊ��ͷռλ&&choice /t 1 /d y /n >nul&goto settime4)
:contTM
set /a TM=%TM%
if %TM% GEQ 60 echo ��������ʾ��Χ���ڵļ�ʱʱ��&choice /t 1 /d y /n >nul&goto settime4
if %TM% LSS 10 (
set /a TM=10%TM%) else (
set /a TM=1%TM%
)
goto run2

:run
cls
set /a TH0=%time:~0,2%
if %TH0% LSS 10 (
set TH0=10%TH0%) else (
set /a TH0=1%TH0%
)
set /a TM0=1%time:~3,2%
set /a TS=%time:~6,1%
set /a TH=%TH0%+%H%-100
set /a TM=%TM0%+%M%-100
if %TM% GEQ 160 set /a TH=%TH%+1&set /a TM=%TM%-60
if %TH% GEQ 124 set /a TH=%TH%-24
goto FN1

:run2
cls
set /a TH0=%time:~0,2%
if %TH0% LSS 10 (
set /a TH0=10%TH0%) else (
set /a TH0=1%TH0%
)
set /a TM0=1%time:~3,2%
set /a TS=%time:~6,1%
if %TH% GEQ %TH0% (
set /a H=%TH%-%TH0%) else (
set /a H=%TH%+24-%TH0%
)
if %H% LSS 10 (
set /a H=10%H%) else (
set /a H=1%H%
)
if %TM% GEQ %TM0% (
set /a M=%TM%-%TM0%) else (
set /a M=%TM%+60-%TM0%&set /a H=%H%-1
)
if %H%==99 set /a H=123
if %M% LSS 10 (
set /a M=10%M%) else (
set /a M=1%M%
)
if %TH%==%TH0% (
goto CK1) else (
goto FN1
)
:CK1
if %TM%==%TM0% (
goto sp1) else (
goto FN1
)
:sp1
echo ע��!���趨�˺͵�ǰ��ͬ��ʱ��!���˻ط����趨����
choice /t 2 /d y /n >nul
goto settime4


:FN1
cls
echo ��������:%ZT%
echo ����ʱ��:[%time:~0,8%]
echo ��ʱ����:[%H:~1%:%M:~1%:00]
echo ִ��ʱ��:[%TH:~1%:%TM:~1%:%TS%4]��4s
echo ��Ҫȡ����ֱ�ӹرմ���
echo -----------------------------------------------------
echo (���ڱ�������˸"[������]"�Լ�������ʱ��ʾ��������)
echo -----------------------------------------------------

:RE
set P=%ZT%&set ZT=%P%
set /a TM1=1%time:~3,2%
title [%H:~1%:%M:~1%]%P%
choice /t 8 /d y /n >nul
set /a TH0=%time:~0,2%
if %TH0% LSS 10 (
set TH0=10%TH0%) else (
set /a TH0=1%TH0%
)
set /a TM0=1%time:~3,2%
set /a TS0=%time:~6,1%
if %TS0%==%TS% goto A
goto reM
:A
if %TM0%==%TM% goto B
goto reM
:B
if %TH0%==%TH% goto %ZX%

:reM
if %M%==100 goto reH
if %TM0%==%TM1% goto RE
set /a M=%M%-1
goto RE

:reH
if %H%==100 goto RE
set /a H=%H%-1&set /a M=159
goto RE


:OVER1
rundll32.exe powrprof.dll,SetSuspendState 0,1,0
exit
echo һ������Ϊ������Ϊ�˲������ػ�������
echo �Ѿ����ߣ�������˳�
echo Ԥ��ִ��ʱ��:[%TH:~1%:%TM:~1%:%TS%4](��4s)
echo ʵ��ִ��ʱ��:[%time:~0,8%]
pause
exit


:OVER2
shutdown -s -t 1
exit
echo һ������Ϊ������Ϊ�˲������ػ�������
echo �Ѿ��ػ���������˳�
echo Ԥ��ִ��ʱ��:[%TH:~1%:%TM:~1%:%TS%4](��4s)
echo ʵ��ִ��ʱ��:[%time:~0,8%]
pause
exit


%��ע��ɾ����%

+100
TH0����ʱ�仺��
TM0
THִ��ʱ��
TM
H
M
TM1����ʱ�� ��ʱ����

%��ע��ɾ����%