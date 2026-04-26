@echo off

::
:: ## Usage:
::
:: * MinTool4PG-latest.zip 을 `바탕화면` 이하에 압축해제
:: * [제어판] - .. - [계정의 환경변수 편집] 에서 PBTHOME 환경변수 등록
::   PBTHOME=%USERPROFILE%\Desktop\MinTool4PG
:: * **Windows Terminal** 에서, [설정] - [프로필] - [명령 프롬프트] - [명령줄] 에서 아래를 적용
::   %SystemRoot%\System32\cmd.exe /k %PBTHOME%\\bin\\MinTool4PG.SetEnv.bat

:: ---

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

:: 'cd' 대신 'pd'를 써서 이동하고, '-'를 입력하면 되돌아오게 설정
doskey pd=pushd $*
doskey -=popd

doskey cdh=pushd %PBTHOME%
doskey cds=pushd %PBTHOME%\stmt


:: **EDITOR**
:: doskey ed=vim $*
:: doskey ed=code $*
doskey ed="%ProgramFiles%\Notepad++\notepad++.exe" $*

::
:: ETC
::

:: PROMPT [$t] $p$g$s
PROMPT [%TIME: =0%] $p$g$s

:: set PATH=%PATH%;C:\Program Files\PostgreSQL\17\bin
:: set PATH=%PATH%;C:\Program Files\Git\cmd

set MINGW=%ProgramFiles%\Git\usr\bin
set PATH=%PATH%;%MINGW%

::
:: **PostgreSQL**
::

:: chcp 949
chcp 65001
:: (정상) `psql (17.9)` --> WARNING: Console code page (65001) differs from Windows code page (949)

:: set PBTHOME=%USERPROFILE%\Desktop\MinTool4PG
set PATH=%PATH%;%PBTHOME%\bin

:: pg_service.conf
set PGSYSCONFDIR=%PBTHOME%\bin\config
set PGPASSFILE=%PGSYSCONFDIR%\pgpass.conf


:: psql 명령행인자를 최대한 줄인다. 또는 %PGSYSCONFDIR%=pg_service.conf 내부의 공통 설정을 줄인다.
:: set PGSERVICE=
set PGHOST=1.1.1.1
set PGPORT=5432
:: set PGUSER=
:: set PGDATABASE=

:: set PGCLUSTER=NotUsed
:: PostgreSQL 인스턴스들의 설정 파일들이 모여 있는 뿌리 경로 ( pg_ctlcluster 에서는 의미가 있을지도 모름 )
:: set PG_CLUSTER_CONF_ROOT=/etc/postgresql

:: **Linux Only**
:: export PG_OOM_ADJUST_FILE=/proc/self/oom_score_adj
:: export PG_OOM_ADJUST_VALUE=0  # 다중 프로세스 구조이므로, 부모(Postmaster 등 주요데몬)는 음수값, 자식(사용자세션프로세스) 는 양수값을 부여하여 자식을 먼저 죽게 한다.

set PGSSLMODE=require
:: set PGCHANNELBINDING=disable
set PGCHANNELBINDING=prefer
set PGCLIENTENCODING=UTF8
:: set PGPASSWORD=dkagh12!

:: psql "host=127.0.0.1 user=test dbname=test sslmode=require channel_binding=prefer"

doskey dev=psql "host=127.0.0.1 dbname=test user=test" -e $*
doskey devadm=psql "service=devadm" -e $*
doskey dev2=psql -e -E -W "service=dev" $*

:: psql (17.9)
:: WARNING: Console code page (65001) differs from Windows code page (949)
:: \HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\CodePage 이하에서 ACP 항목 값을 "949" 에서 "65001" 로 바꾸면 해소되나 비권고
