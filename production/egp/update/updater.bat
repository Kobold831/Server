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
	call:success
) else (
	echo ．．．NG
	echo.
	echo エラーが発生したためアップデータを終了します。
	call:failure
)

:tryUnzip
powershell -NoProfile -ExecutionPolicy Unrestricted Expand-Archive -Path update.zip -DestinationPath ./update\ -Force
exit /b

:tryCopy
xcopy /e /y update .\
echo.
exit /b

:tryDelTmp
del /s /q ダブルクリックして起動.bat
del /s /q Check.json
del /s /q update.zip
rmdir /s /q update
rmdir /s /q bin
exit /b

:success
echo.
echo アップデータは正常に終了しました。
echo.
echo 続行したあと、EnableGPlayWithPCは自動起動します。
echo.
for /l %%a in (5,-1,1) do (
  echo 続行するには何かキーを押してください．．．動作がない場合%%a秒後に自動起動します．．．
  timeout /t 1 > nul
)
cd ILMerge\
start EnableGPlayWithPC.exe
del /f "%~dp0%~nx0"
exit

:failure
echo.
echo アップデータはエラーで終了しました。
echo.
echo 続行したあと、EnableGPlayWithPCは自動起動します。
echo.
for /l %%a in (5,-1,1) do (
  echo 続行するには何かキーを押してください．．．動作がない場合%%a秒後に自動起動します．．．
  timeout /t 1 > nul
)
cd ILMerge\
start EnableGPlayWithPC.exe
del /f "%~dp0%~nx0"
exit
