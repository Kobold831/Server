@echo off

echo �A�b�v�f�[�g�t�@�C�����m�F���Ă��܂��D�D�D

if exist update.zip (
	echo �D�D�DOK
	echo.
	echo �A�b�v�f�[�g�t�@�C�����𓀂��Ă��܂��D�D�D
	echo.
	call:tryUnzip
	echo �A�b�v�f�[�g�t�@�C�����R�s�[���Ă��܂��D�D�D
	echo.
	call:tryCopy
	echo �ꎞ�t�@�C�����폜���Ă��܂��D�D�D
	echo.
	call:tryDelTmp
	call:success
) else (
	echo �D�D�DNG
	echo.
	echo �G���[�������������߃A�b�v�f�[�^���I�����܂��B
	call:failure
)

:tryUnzip
powershell -NoProfile -ExecutionPolicy Unrestricted Expand-Archive -Path update.zip -DestinationPath ./EnableGPlayWithPC\ -Force
exit /b

:tryCopy
xcopy /e /y EnableGPlayWithPC .\
echo.
exit /b

:tryDelTmp
del /s /q update.zip
rd /s /q EnableGPlayWithPC
exit /b

:success
echo.
echo �A�b�v�f�[�^�͐���ɏI�����܂����B
echo.
echo ���s�������ƁAEnableGPlayWithPC�͎����N�����܂��B
echo.
for /l %%a in (5,-1,1) do (
  echo ���s����ɂ͉����L�[�������Ă��������D�D�D���삪�Ȃ��ꍇ%%a�b��Ɏ����N�����܂��D�D�D
  timeout /t 1 > nul
)
start bin\ILMerge\EnableGPlayWithPC.exe
del /f "%~dp0%~nx0"
exit

:failure
echo.
echo �A�b�v�f�[�^�̓G���[�ŏI�����܂����B
echo.
echo ���s�������ƁAEnableGPlayWithPC�͎����N�����܂��B
echo.
for /l %%a in (5,-1,1) do (
  echo ���s����ɂ͉����L�[�������Ă��������D�D�D���삪�Ȃ��ꍇ%%a�b��Ɏ����N�����܂��D�D�D
  timeout /t 1 > nul
)
start bin\ILMerge\EnableGPlayWithPC.exe
del /f "%~dp0%~nx0"
exit