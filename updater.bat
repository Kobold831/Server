@echo off

echo アップデートファイルを確認しています．．．

if exist update.zip (
	echo ．．．OK
	echo.
	echo アップデートファイルを解凍しています．．．
	echo.
	call:tryUnzip
	echo アップデートファイルをコピーしています．．．
	echo.
	call:tryCopy
	echo 一時ファイルを削除しています．．．
	echo.
	call:tryDelTmp
	call:end
) else (
	echo ．．．NG
	echo.
	echo エラーが発生したためアップデータを終了します。
	call:end
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

:end
echo.
echo アップデータは正常に終了しました。
echo.
echo 続行したあと、EnableGPlayWithPCは自動起動します。
echo.
echo 続行するには何かキーを押してください．．．
pause > NUL
start ダブルクリックして起動.bat
del /f "%~dp0%~nx0"
exit