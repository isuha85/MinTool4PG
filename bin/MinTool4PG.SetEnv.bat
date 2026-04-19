@echo off

:: **Windows Terminal** 에서, [설정] - [프로필] - [명령 프롬프트] - [명령줄] 에서 아래를 적용
:: %SystemRoot%\System32\cmd.exe /k %DBAHOME%\\bin\\MinTool4PG.SetEnv.bat


::
:: alisaes
::   **TIP** : 인자가 불필요한 경우도 뒤에다 $* 를 추가하는 이유는, `alias |findstr git` 등의 용법때문이다.
::

doskey alias=doskey /macros $*
doskey a=doskey /macros ^| grep $*

doskey gs=git status -uno $*
doskey gits=git status -uno $*

doskey h=doskey /history ^| tail -22
doskey lh=dir /A:-D /O:-D ^| grep "^202." ^|head -22

doskey ll=dir /n /o:n /a ^| findstr /v "Volume Directory" ^| findstr /v DIR ^| findstr /v bytes

::
:: PostgreSQL ::
::

:: chcp 949
chcp 65001

:: PROMPT [$t] $p$g$s
PROMPT [%TIME: =0%] $p$g$s

:: set PGPASSWORD=dkagh12!
set PGPASSFILE=%PBTHOME%\bin\config\pgpass.conf
set PGCLIENTENCODING=UTF8

:: set PATH=%PATH%;C:\Program Files\PostgreSQL\17\bin
:: set PATH=%PATH%;C:\Program Files\Git\cmd
set PATH=%PATH%;%MINGW%;%PBTHOME%\bin