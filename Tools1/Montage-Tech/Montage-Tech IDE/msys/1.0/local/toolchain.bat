@REM TC means Toolchain
@REM 1. MSYS_DIR is eqaul to %msys%\1.0\
@REM 2. Toolchain.bat is in path: %msys%\1.0\local

@REM Default configuration
@SET TC_VERSION=1.1.2
@SET MSYS_DIR=%~dp0..
@SET MSYS_PATH=%MSYS_DIR%\bin
@SET MSYS_LIB=%MSYS_DIR%\lib
@SET MSYS_INCLUDE=%MSYS_DIR%\include

@REM Current Settings
@SET TC_TARGET_PLATFORM=%1
@SET TC_PATH=
@SET TC_LIB=
@SET TC_INCLUDE=

@REM Bak Settings
@if "%BAK_PATH%"==""    SET BAK_PATH=%PATH%
@if "%BAK_LIB%"==""     SET BAK_LIB=%LIB%
@if "%BAK_INCLUDE%"=="" SET BAK_INCLUDE=%INCLUDE%

@if "%TC_TARGET_PLATFORM%"=="clean"   goto CLEAN
@if "%TC_TARGET_PLATFORM%"=="win32"   goto WIN32
@if "%TC_TARGET_PLATFORM%"=="mips1"   goto MIPS1
@if "%TC_TARGET_PLATFORM%"=="mips4k"  goto MIPS4K


@REM <-- Error Handler
@echo No target platform is specified.
@goto END
@REM -->

@REM <-- Target Platform List

@REM <-- WIN32 target platform
:WIN32
@SET TC_PATH=%MSYS_DIR%\win32
@GOTO CONFIG
@REM -->

@REM <-- MIPS1 target platform
:MIPS1
@SET TC_PATH=%MSYS_PATH%
@SET TC_LIB=%MSYS_LIB%
@SET TC_INCLUDE=%MSYS_INCLUDE%

@SET TC_PATH=%MSYS_DIR%\local\external;%TC_PATH%
@SET TC_PATH=%MSYS_DIR%\local\mips-elf\mips-elf\bin;%TC_PATH%
@SET TC_PATH=%MSYS_DIR%\local\mips-elf\bin;%TC_PATH%

@SET TC_INCLUDE=%MSYS_DIR%\local\mips-elf\mips-elf\include;%TC_INCLUDE%
@SET TC_INCLUDE=%MSYS_DIR%\local\mips-elf\mips-elf\include\sys;%TC_INCLUDE%
@SET TC_INCLUDE=%MSYS_DIR%\local\mips-elf\mips-elf\include\machine;%TC_INCLUDE%
@SET TC_INCLUDE=%MSYS_DIR%\local\mips-elf\mips-elf\include\bits;%TC_INCLUDE%

@SET TC_LIB=%MSYS_DIR%\local\mips-elf\mips-elf\lib;%TC_LIB%
@SET TC_LIB=%MSYS_DIR%\local\mips-elf\mips-elf\lib\soft-float;%TC_LIB%

@GOTO CONFIG
@REM -->


@REM <-- MIPS4K Target Platform
:MIPS4K
@SET TC_PATH=%MSYS_PATH%
@SET TC_LIB=%MSYS_LIB%
@SET TC_INCLUDE=%MSYS_INCLUDE%

@SET TC_PATH=%MSYS_DIR%\local\external;%TC_PATH%
@SET TC_PATH=%MSYS_DIR%\local\mips-windows\bin;%TC_PATH%
@SET TC_PATH=%MSYS_DIR%\local\mips-windows\mipsel-linux\bin;%TC_PATH%

@GOTO CONFIG
@REM -->

@REM -->

@REM <-- Config
:CONFIG
@echo Target Platform: %TC_TARGET_PLATFORM%
@if not "%TC_PATH%"==""    SET PATH=%TC_PATH%;%PATH%
@if not "%TC_INCLUDE%"=="" SET INCLUDE=%TC_INCLUDE%;%INCLUDE%
@if not "%TC_LIB%"==""     SET LIB=%TC_LIB%;%LIB%
@goto END
@REM -->

@REM <-- Clean
:CLEAN
@SET PATH=%BAK_PATH%
@SET INCLUDE=%BAK_INCLUDE%
@SET LIB=%BAK_LIB%

@SET BAK_PATH=
@SET BAK_INCLUDE=
@SET BAK_LIB=
@goto END
@REM -->

:END

@REM <-- Cleanup Environment variable
@SET MSYS_DIR=
@SET MSYS_PATH=
@SET MSYS_LIB=
@SET MSYS_INCLUDE=

@SET TC_TARGET_PLATFORM=
@SET TC_PATH=
@SET TC_LIB=
@SET TC_INCLUDE=
@REM -->