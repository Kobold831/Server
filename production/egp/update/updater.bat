@echo off

echo �A�b�v�f�[�g�t�@�C�����m�F���Ă��܂��D�D�D

if exist update.zip (
	echo �D�D�DOK
	echo.
	echo �A�b�v�f�[�g�t�@�C�����𓀂��Ă��܂��D�D�D
	echo.
	call:tryUnzip
	if exist update (
		echo �D�D�DOK
		echo.
		echo �A�b�v�f�[�g�t�@�C�����R�s�[���Ă��܂��D�D�D
		echo.
		if exist EnableGPlayWithPC.exe (
			xcopy /e /y update .\..\..\
			echo.
		) else (
			xcopy /e /y update .\
			echo.
		)
		echo �ꎞ�t�@�C�����폜���Ă��܂��D�D�D
		echo.
		call:tryDelTmp
		call:success
	) else (
		echo �D�D�DNG
		echo.
		call:failure
	)
) else (
	echo �D�D�DNG
	echo.
	call:failure
)

:tryUnzip
powershell -NoProfile -ExecutionPolicy Unrestricted Expand-Archive -Path update.zip -DestinationPath update -Force
exit /b

:tryDelTmp
del /s /q update.zip
rmdir /s /q update
exit /b

:success
echo �A�b�v�f�[�^�͐���ŏI�����܂����B
echo.
echo ���s����ɂ͉����L�[�������Ă��������D�D�DEnableGPlayWithPC���N�����܂��B
echo.
pause > nul
if not exist EnableGPlayWithPC.exe (
	cd bin\ILMerge\
)
start EnableGPlayWithPC.exe
del /f "%~dp0%~nx0"
exit

:failure
echo �A�b�v�f�[�^�ُ͈�ŏI�����܂����B
echo.
echo ���s����ɂ͉����L�[�������Ă��������D�D�DEnableGPlayWithPC���N�����܂��B
echo.
pause > nul
if not exist EnableGPlayWithPC.exe (
	cd bin\ILMerge\
)
start EnableGPlayWithPC.exe
del /f "%~dp0%~nx0"
exit
