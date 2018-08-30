@echo off
cd /d %~dp0
set ZT=[睡眠/休眠]
set ZT0=[关机]
set ZX=OVER1
set ZX0=OVER2
set P=[运行中]
:begin
cls
title 执行%ZT%的设定

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

echo 请选择计划进入%ZT%：
echo [1]=0:30后预计于[%TH2:~1%:%TM2:~1%]执行
echo [2]=1:00后预计于[%TH3:~1%:%TM3:~1%]执行
echo [3]=1:30后预计于[%TH4:~1%:%TM4:~1%]执行
echo [4]=2:00后预计于[%TH5:~1%:%TM5:~1%]执行
echo [5]=2:30后预计于[%TH6:~1%:%TM6:~1%]执行
echo [6]=3:00后预计于[%TH7:~1%:%TM7:~1%]执行
echo [7]=3:30后预计于[%TH8:~1%:%TM8:~1%]执行
echo [8]=自定义时间
echo ---------------------------------
echo [9]=进入%ZT0%计划
echo [0]=调换进入[睡眠]或[休眠]
echo ---------------------------------
echo 注:预计时间以[%TH0:~1,2%:%TM0:~1,2%]开始计算
set choice=输入
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
echo %choice%|findstr "[^^%choice0%]">nul&&(echo 没有%choice%选项！&choice /t 1 /d y /n >nul&goto begin)
echo %choice%|findstr "^0">nul 2>nul&&(echo 没有%choice%选项！&&choice /t 1 /d y /n >nul&goto begin)
if %choice% GTR 9 echo 没有%choice%选项！&choice /t 1 /d y /n >nul&goto begin

:SW
cls
echo 请选择:
echo ---------------------------------------------------------------
echo [1]=改为[睡眠](内存不断电启动快但主板需要供电维持)
echo [2]=改为[休眠](内存转储硬盘启动慢但不需要供电维持)
echo [3]=提升管理员权限（或退出后在程序上右键选"以管理员身份运行")
echo [0]=返回主菜单
echo ---------------------------------------------------------------
echo 注：此处的更改需要管理员权限才能生效且所做选择会被系统保存，之后选择[睡眠/休眠]计划会相应的进入睡眠或休眠
echo 系统默认设定为休眠，改为睡眠时win10系统在电源管理中"关机设置"里的快速启动功能不会显示不会起效，改为休眠时恢复显示和功能(引用系统自带功能请放心)
set choice=输入
set /p choice=
if %choice%==1 goto SWOFF
if %choice%==2 goto SWON
if %choice%==3 goto GETAD
if %choice%==0 goto begin
set choice0=1230
echo %choice%|findstr "[^^%choice0%]">nul&&(echo 没有%choice%选项！&choice /t 1 /d y /n >nul&goto SW)
echo %choice%|findstr "^0">nul 2>nul&&(echo 没有%choice%选项！&&choice /t 1 /d y /n >nul&goto SW)
if %choice% GTR 9 echo 没有%choice%选项！&choice /t 1 /d y /n >nul&goto SW

:SWOFF
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 powercfg -h off&echo 修改完成&pause&goto SW
echo 设定此项需要先提升管理员权限(或退出后在程序上右键选"以管理员身份运行")
pause
goto SW

:SWON
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 powercfg -h on&echo 修改完成&pause&goto SW
echo 设定此项需要先提升管理员权限(或退出后在程序上右键选"以管理员身份运行")
pause
goto SW

:GETAD
cd /d %~dp0
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "缓存可删除.vbs" del /f /q "缓存可删除.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"缓存可删除.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"缓存可删除.vbs"
echo WScript.Quit >>"缓存可删除.vbs"
"缓存可删除.vbs" /f
if exist "缓存可删除.vbs" del /f /q "缓存可删除.vbs"
exit
:Admin
echo 已经是管理员身份！
pause
goto SW

:setmode
cls
echo [1]=以倒计时%ZT%
echo [2]=以点时间%ZT%
echo [0]=返回主菜单
set /p choice=
if %choice%==1 goto settime1
if %choice%==2 goto settime3
if %choice%==0 goto begin
set choice0=120
echo %choice%|findstr "[^^%choice0%]">nul&&(echo 没有%choice%选项！&choice /t 1 /d y /n >nul&goto setmode)
echo %choice%|findstr "^0">nul 2>nul&&(echo 没有%choice%选项！&&choice /t 1 /d y /n >nul&goto setmode)
if %choice% GTR 9 echo 没有%choice%选项！&choice /t 1 /d y /n >nul&goto setmode

:settime1
cls
set /a min=0
set H=输入
echo 以倒计时%ZT%:
echo (__:__)请输入倒计时的小时数(0-23)
echo [X]或[x]=返回上一级
set /p H=
if %H%==X goto setmode
if %H%==x goto setmode
set choice0=1234567890
echo %H%|findstr "[^^%choice0%]">nul&&(echo 请输入正确的正整数值&choice /t 1 /d y /n >nul&goto settime1)
if %H%==0 set /a min=1&goto contH
echo %H%|findstr "^0">nul 2>nul&&(echo 不需要输入"0"作为开头占位&&choice /t 1 /d y /n >nul&goto settime1)
:contH
if %H% GEQ 24 echo 请输入提示范围以内的计时时间&choice /t 1 /d y /n >nul&goto settime1
if %H% LSS 10 (
set /a H=10%H%) else (
set /a H=1%H%
)
:settime2
cls
set M=输入
echo 以倒计时%ZT%:
echo (%H:~1%:__)请输入倒计时的分钟数(%min%-59)
echo [X]或[x]=返回上一级
set /p M=
if %M%==X goto setmode
if %M%==x goto setmode
set choice0=1234567890
echo %M%|findstr "[^^%choice0%]">nul&&(echo 请输入正确的正整数值&choice /t 1 /d y /n >nul&goto settime2)
if %M%==0 goto Z
echo %M%|findstr "^0">nul 2>nul&&(echo 不需要输入"0"作为开头占位&&choice /t 1 /d y /n >nul&goto settime2)
:contM
set /a M=%M%
if %M% GEQ 60 echo 请输入提示范围以内的计时时间&choice /t 1 /d y /n >nul&goto settime2
if %M% LSS 10 (
set /a M=10%M%) else (
set /a M=1%M%
)
goto run
:Z
if %H%==100 (
echo 请输入提示范围以内的计时时间&choice /t 1 /d y /n >nul&goto settime2) else (
goto contM
)

:settime3
cls
set /a min=0
set TH=输入
echo 以点时间%ZT%:
echo (__:__)请输入执行时的小时数(0-23)
echo [X]或[x]=返回上一级
set /p TH=
if %TH%==X goto setmode
if %TH%==x goto setmode
set choice0=1234567890
echo %TH%|findstr "[^^%choice0%]">nul&&(echo 请输入正确的正整数值&choice /t 1 /d y /n >nul&goto settime3)
if %TH%==0 goto contTH
echo %TH%|findstr "^0">nul 2>nul&&(echo 不需要输入"0"作为开头占位&&choice /t 1 /d y /n >nul&goto settime3)
:contTH
if %TH% GEQ 24 echo 请输入提示范围以内的计时时间&choice /t 1 /d y /n >nul&goto settime3
if %TH% LSS 10 (
set /a TH=10%TH%) else (
set /a TH=1%TH%
)
:settime4
cls
set TM=输入
echo 以点时间%ZT%:
echo (%TH:~1%:__)请输入执行时的分钟数(0-59)
echo [X]或[x]=返回上一级
set /p TM=
if %TM%==X goto setmode
if %TM%==x goto setmode
set choice0=1234567890
echo %TM%|findstr "[^^%choice0%]">nul&&(echo 请输入正确的正整数值&choice /t 1 /d y /n >nul&goto settime4)
if %TM%==0 goto contTM
echo %TM%|findstr "^0">nul 2>nul&&(echo 不需要输入"0"作为开头占位&&choice /t 1 /d y /n >nul&goto settime4)
:contTM
set /a TM=%TM%
if %TM% GEQ 60 echo 请输入提示范围以内的计时时间&choice /t 1 /d y /n >nul&goto settime4
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
echo 注意!你设定了和当前相同的时间!将退回分钟设定部分
choice /t 2 /d y /n >nul
goto settime4


:FN1
cls
echo 操作内容:%ZT%
echo 创建时间:[%time:~0,8%]
echo 计时长度:[%H:~1%:%M:~1%:00]
echo 执行时间:[%TH:~1%:%TM:~1%:%TS%4]±4s
echo 需要取消请直接关闭窗口
echo -----------------------------------------------------
echo (窗口标题间隔闪烁"[运行中]"以及操作项时表示运行正常)
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
echo 一下内容为测试项为了不真正关机或休眠
echo 已经休眠，任意键退出
echo 预计执行时间:[%TH:~1%:%TM:~1%:%TS%4](±4s)
echo 实际执行时间:[%time:~0,8%]
pause
exit


:OVER2
shutdown -s -t 1
exit
echo 一下内容为测试项为了不真正关机或休眠
echo 已经关机，任意键退出
echo 预计执行时间:[%TH:~1%:%TM:~1%:%TS%4](±4s)
echo 实际执行时间:[%time:~0,8%]
pause
exit


%备注可删除↓%

+100
TH0最新时间缓存
TM0
TH执行时间
TM
H
M
TM1最新时间 有时间差缓存

%备注可删除↑%