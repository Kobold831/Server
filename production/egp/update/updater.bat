@echo off

echo アップデートファイルを確認しています．．．

if exist update.zip (
	echo ．．．OK
	echo.
	echo アップデートファイルを解凍しています．．．
	echo.
	call:tryUnzip
	if exist update (
		echo ．．．OK
		echo.
		echo アップデートファイルをコピーしています．．．
		echo.
		if exist EnableGPlayWithPC.exe (
			xcopy /e /y update .\..\..\
			echo.
		) else (
			xcopy /e /y update .\
			echo.
		)
		echo 一時ファイルを削除しています．．．
		echo.
		call:tryDelTmp
		call:success
	) else (
		echo ．．．NG
		echo.
		call:failure
	)
) else (
	echo ．．．NG
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
echo アップデータは正常で終了しました。
echo.
echo 続行するには何かキーを押してください．．．EnableGPlayWithPCが起動します。
echo.
pause > nul
if not exist EnableGPlayWithPC.exe (
	cd bin\ILMerge\
)
start EnableGPlayWithPC.exe
del /f "%~dp0%~nx0"
exit

:failure
echo アップデータは異常で終了しました。
echo.
echo 続行するには何かキーを押してください．．．EnableGPlayWithPCが起動します。
echo.
pause > nul
if not exist EnableGPlayWithPC.exe (
	cd bin\ILMerge\
)
start EnableGPlayWithPC.exe
del /f "%~dp0%~nx0"
exit
