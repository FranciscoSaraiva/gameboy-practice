echo off
set BIN=C:\gbdk-n\bin
set OBJ=obj

if "%1"=="clean" (
	if exist %OBJ% rd /s/q %OBJ%
	if exist practice.gb del practice.gb
	goto end
)

if not exist %OBJ% mkdir %OBJ%
call %BIN%\gbdk-n-compile.bat practice.c -o %OBJ%\practice.rel
call %BIN%\gbdk-n-link.bat %OBJ%\practice.rel -o %OBJ%\practice.ihx
call %BIN%\gbdk-n-make-rom.bat %OBJ%\practice.ihx practice.gb

:end
