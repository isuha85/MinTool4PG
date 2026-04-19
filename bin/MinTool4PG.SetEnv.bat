@echo off

::
:: ## Usage:
::
:: * MinTool4PG-latest.zip 을 `바탕화면` 이하에 압축해제
:: * [제어판] - .. - [계정의 환경변수 편집] 에서 PBTHOME 환경변수 등록
::   PBTHOME=%USERPROFILE%\Desktop\MinTool4PG
:: * **Windows Terminal** 에서, [설정] - [프로필] - [명령 프롬프트] - [명령줄] 에서 아래를 적용
::   %SystemRoot%\System32\cmd.exe /k %PBTHOME%\\bin\\MinTool4PG.SetEnv.bat


::
:: alisaes
::   **TIP** : 인자가 불필요한 경우도 뒤에다 $* 를 추가하는 이유는, `alias |findstr git` 등의 용법때문이다.
::

doskey alias=doskey /macros $*
doskey a=doskey /macros ^| grep $*

doskey gs=git status -uno $*
doskey gits=git status $*

doskey h=doskey /history ^| tail -22
doskey lh=dir /A:-D /O:-D ^| grep "^202." ^|head -22
doskey ll=dir /n /o:n /a ^| findstr /v "Volume Directory" ^| findstr /v DIR ^| findstr /v bytes

:: **EDITOR**
:: doskey ed=vim $*
:: doskey ed=code $*
doskey ed="%ProgramFiles%\Notepad++\notepad++.exe" $*

::
:: ETC
::

:: set PATH=%PATH%;C:\Program Files\PostgreSQL\17\bin
:: set PATH=%PATH%;C:\Program Files\Git\cmd

set MINGW=%ProgramFiles%\Git\usr\bin
set PATH=%PATH%;%MINGW%

:: set PBTHOME=%USERPROFILE%\Desktop\MinTool4PG
set PATH=%PATH%;%PBTHOME%\bin

::
:: PostgreSQL ::
::

:: chcp 949
chcp 65001

:: PROMPT [$t] $p$g$s
PROMPT [%TIME: =0%] $p$g$s

:: psql 명령행인자를 최대한 줄인다. 암호는 .pgpass 파일로 관리
set PGPORT=5432
set PGSSLMODE=require
:: set PGCHANNELBINDING=disable
set PGCHANNELBINDING=prefer
set PGCLIENTENCODING=UTF8
:: set PGPASSWORD=dkagh12!
set PGPASSFILE=%PBTHOME%\bin\config\pgpass.conf


:: psql "host=127.0.0.1 user=test dbname=test sslmode=require channel_binding=prefer"

doskey dev2=psql -E "host=127.0.0.1 dbname=test user=test client_encoding=UTF8" $*
doskey dev=psql "host=127.0.0.1 dbname=test user=test" $*

:: (W) 컴퓨터\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\CodePage 이하에서 ACP 항목 값을 "949" 에서 "65001" 로 바꾸면 사라지긴 함
